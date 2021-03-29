<?php
require dirname(__FILE__) . '/../app/bootstrap.php';
$bootstrap = \Magento\Framework\App\Bootstrap::create(BP, $_SERVER);
require dirname(__FILE__) . '/abstract.php';

class CreateCategoriesApp extends AbstractApp
{
    protected $la_fuente_url_kits = 'https://www.lafuente.eu/motor/index.php?app=frontend&exe=portal&op=lista_precios_kits&sEcho=5&iColumns=10&sColumns=&iDisplayStart=0&iDisplayLength=100000000&mDataProp_0=0&mDataProp_1=1&mDataProp_2=2&mDataProp_3=3&mDataProp_4=4&mDataProp_5=5&mDataProp_6=6&mDataProp_7=7&mDataProp_8=8&mDataProp_9=9&marca=&modelo=&tipo_kit=';
    protected $magento_api;
    protected $data_base_client;
    protected $date_preg_match = '/[0-9][0-9]\-[0-9][0-9] a [0-9][0-9]\-[0-9][0-9]/'; // Pattern for dates
    protected $order_aragon = array(   // Define the order of the CSV for Aragon
        'sku' => 0,
        'product_model' => 1,
        'car_brand' => 3,
        'car_model' => 4,
        'model_type' => 5,
        'observations' => 7,
        'year' => 8,
        'price' => 9,
        'discount' => 10,
        'final_customer_price' => 11,
        'cut' => 12,
        'registration_plate_cover' => 13,
        'time' => 14,
        's' => 15,
        'mmr' => 16,
        'd' => 17,
        'ean' => 18
    );
    protected $order_lafuente = array(   // Define the order of the CSV for LaFuente
        'car_brand' => 0,
        'model_type_year' => 1,
        'ball_type' => 2,
        'sku' => 3,
        'price' => 4,
        'time' => 5,
        'cut' => 6,
        'mmr' => 7,
        's' => 8,
        'd' => 9,
        'kit' => 10
    );
    protected $order_lafuente_json = array(
        'car_brand' => 0,
        'model_type_year' => 1,
        'model' => 2,
        'ball_type' => 4,
        'sku' => 5,
        'price' => 6
    );

    public function run()
    {
        $this->_state->setAreaCode('frontend');
        
        $this->get_lafuente_from_db();
        $this->convert_aragon();

        $objectManager = \Magento\Framework\App\ObjectManager::getInstance();

        foreach ($this->product_array as $_product) {
            $product = $objectManager->create('\Magento\Catalog\Model\Product');
            $product->setSku($_product['product']->sku); // Set your sku here
            $product->setName("Enganche para ".$_product['product']->marca . " " . $_product['product']->model . " " . $_product['product']->year); // Name of Product
            $product->setAttributeSetId(4); // Attribute set id
            $product->setStatus(1); // Status on product enabled/ disabled 1/0
            // $product->setWeight(10); // weight of product
            $product->setVisibility(4); // visibilty of product (catalog / search / catalog, search / Not visible individually)
            $product->setTaxClassId(0); // Tax class id
            $product->setTypeId('simple'); // type of product (simple/virtual/downloadable/configurable)
            $product->setPrice($_product['product']->price); // price of product
            $product->setStockData(
                array(
                    'use_config_manage_stock' => 0,
                    'manage_stock' => 1,
                    'is_in_stock' => 1,
                    'qty' => 999999999
                )
            );
            $product->save();
        }
    }

    /**
     * Function to import the tow bars from LaFuente from CSV.
     * CSV file must be placed in the same folder and have the name indicated.
     */
    /*
    protected function convert_la_fuente()
    {
        $array = array();
        $difficult_file = file_get_contents('./listado_precios_enganches.csv');
        $lines = explode(';', $difficult_file);
        foreach ($lines as $line)
        {
            $line_array = explode(',', $line);
            if (!is_array($line_array) || $line_array[0] == 'Marca' || $line_array[0] == '')
            {
                continue;
            } else {
                $make_type_year = $this->get_make_type_year($line_array[1]);
                if ( is_null($make_type_year['model']) ){
                    continue;
                } else {
                    $array = array(
                        'car_brand' => $line_array[0],
                        'car_model' => $make_type_year['model'],
                        'model_type' => $make_type_year['variant'],
                        'year' => $make_type_year['year'],
                        'sku' => $line_array[3],
                        'price' => "$line_array[4],$line_array[5]"
                    );
                    foreach ($array as $key => $value) {
                        $array[$key] = str_replace('"', '', $value);
                    }
                    $this->data_base_client->insert($array);
                }
            }
        }
    }
    */
    /**
     * Function to import the tow bars from Enganches Aragón.
     * CSV file must be placed in the same folder and have the name indicated.
     */
    protected function convert_aragon()
    {
        $array = array();
        // $file = file_get_contents('./enganches.csv');
        $url = 'https://www.enganchesaragon.com/generar-csv.php?tipo=enganches';
        $file = file_get_contents($url);
        $lines = preg_split('/\n/', $file);
        foreach ($lines as $line)
        {
            $line_array = explode(';', $line);
            if (!is_array($line_array) || $line_array[0] == 'Referencia' || $line_array[0] == '')
            {
                continue;
            } else {
                $array = array(
                    'name' => $line_array[3] . ' ' . $line_array[4] . ' ' . $line_array[6] . ' ' . $line_array[8],
                    'sku' => $line_array[0],
                    'price' => (int)str_replace(['EUR', '€'], '', $line_array[9])*100,
                    'type_id' => 'simple',
                    'attribute_set_id' => 4

                );
                foreach ($array as $key => $value) {
                    $array[$key] = str_replace('"', '', $value);
                }
                
                // $this->data_base_client->insert($array);

                $this->product_array[] = [
                    'product' => (object)$array
                ];
            }
        }
    }

    /**
     * Function to insert tow bar information directly from the database of LaFuente.
     * Rather than converting the PDF to CSV and then importing the CSV
     */
    protected function get_lafuente_from_db() {
        
        $endpoint = "https://www.lafuente.eu/motor/index.php?app=frontend&exe=portal&op=lista_precios_enganches&iRows=10000000&sEcho=10000000&iColumns=16&sColumns&iDisplayStart=10&iDisplayLength=100000000000&mDataProp_0=0&mDataProp_1=1&mDataProp_2=2&mDataProp_3=3&mDataProp_4=4&mDataProp_5=5&mDataProp_6=6&mDataProp_7=7&mDataProp_8=8&mDataProp_9=9&mDataProp_10=10&mDataProp_11=11&mDataProp_12=12&mDataProp_13=13&mDataProp_14=14&mDataProp_15=15&marca&modelo";
        $ch = @curl_init();
        @curl_setopt($ch, CURLOPT_HTTPGET, true);
        @curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        @curl_setopt($ch, CURLOPT_URL, $endpoint);
        @curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Referer: https://www.lafuente.eu/lista_precios_enganche',
            'x-requested-with: XMLHttpRequest'
        ));
        @curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response    = @curl_exec($ch);
        $parsed_response = json_decode($response);
        foreach ($parsed_response->aaData as $row) {
            $make_type_year = $this->get_make_type_year($row[1]);
            if ( is_null($make_type_year['model']) ){
                continue;
            } else {
                $price = strip_tags($row[6]);
                $price = (int)str_replace(['EUR', '€'], '', $price)*100;
                $array = array(
                    'name' => $row[0] . ' ' . $row[2] . ' ' . $make_type_year['variant'] . ' ' . $make_type_year['year'],
                    'sku' => $row[5],
                    'price' => $price,
                    'type_id' => 'simple',
                    'attribute_set_id' => 4
                );
                foreach ($array as $key => $value) {
                    $array[$key] = str_replace('"', '', $value);
                }

                $this->product_array[] = [
                    'product' => (object)$array
                ];
            }
        }
    }

    /**
     * Function to return model, type and year from long string
     * Format: Model - Type mm/yyyy a mm/yyy
     */
    protected function get_make_type_year(string $input_string): array
    {
        $year = null;
        $model = null;
        $variant = null;
        $years = array();
        if ( preg_match($this->date_preg_match, $input_string, $matches) )
        {
            if ( count($matches) === 1)
            {
                $date_array = explode(' a ', $matches[0]);
                foreach ($date_array as $date_)
                {
                    $date = explode('-', $date_);
                    $date[1] = ((int)$date[1] > 50) ? '19'.$date[1] : '20'.$date[1];
                    $date_ = implode('/', $date);
                    $years[] = $date_;         
                }
                $year = implode(' - ', $years);
    
                $string_without_year = str_replace($matches[0], '', $input_string);
    
                $model_variant_array = explode(' - ', $string_without_year);
                $model = $model_variant_array[0];
                $variant = $model_variant_array[1];
            }
        }
        return array(
            'year' => $year,
            'model' => $model,
            'variant' => $variant
        );
    }

}

/** @var \Magento\Framework\App\Http $app */
$app = $bootstrap->createApplication('CreateCategoriesApp');
$bootstrap->run($app);
