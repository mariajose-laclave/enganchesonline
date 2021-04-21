<?php
require dirname(__FILE__) . '/../app/bootstrap.php';
$bootstrap = \Magento\Framework\App\Bootstrap::create(BP, $_SERVER);
require dirname(__FILE__) . '/abstract.php';

class CreateCategoriesApp extends AbstractApp
{
    protected $descriptionArray;
    protected $objectManager;
    protected $categoryLinkManagement;
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
        $this->objectManager = \Magento\Framework\App\ObjectManager::getInstance();
        $this->getDescriptions();
        $this->_state->setAreaCode('frontend');
        $this->get_lafuente_from_db();
        // $this->convert_aragon();
        $this->createCategories();
        $this->createProducts();
        // $this->insertKits();
    }

    protected function getDescriptions()
    {
        $this->descriptionArray = array();
        $tituloBojaFijaCisne = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('titulo_bola_fija_cisne');
        $tituloBojaFijaCisne = $tituloBojaFijaCisne->getHtmlValue();
        $descripcionBojaFijaCisne = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('descripcion_bola_fija_cisne');
        $descripcionBojaFijaCisne = $descripcionBojaFijaCisne->getHtmlValue();

        $titulo_bola_desmontable_horizontal = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('titulo_bola_desmontable_horizontal');
        $titulo_bola_desmontable_horizontal = $titulo_bola_desmontable_horizontal->getHtmlValue();
        $descripcion_bola_desmontable_horizontal = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('descripcion_bola_desmontable_horizontal');
        $descripcion_bola_desmontable_horizontal = $descripcion_bola_desmontable_horizontal->getHtmlValue();

        $titulo_bola_desmontable_vertical = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('titulo_bola_desmontable_vertical');
        $titulo_bola_desmontable_vertical = $titulo_bola_desmontable_vertical->getHtmlValue();
        $descripcion_bola_desmontable_vertical = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('descripcion_bola_desmontable_vertical');
        $descripcion_bola_desmontable_vertical = $descripcion_bola_desmontable_vertical->getHtmlValue();
        
        $titulo_bola_fija_mixta = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('titulo_bola_fija_mixta');
        $titulo_bola_fija_mixta = $titulo_bola_fija_mixta->getHtmlValue();
        $descripcion_bola_fija_mixta = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('descripcion_bola_fija_mixta');
        $descripcion_bola_fija_mixta = $descripcion_bola_fija_mixta->getHtmlValue();
        
        $titulo_bola_fija_mono_block = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('titulo_bola_fija_mono_block');
        $titulo_bola_fija_mono_block = $titulo_bola_fija_mono_block->getHtmlValue();
        $descripcion_bola_fija_mono_block = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('descripcion_bola_fija_mono_block');
        $descripcion_bola_fija_mono_block = $descripcion_bola_fija_mono_block->getHtmlValue();
        $this->descriptionArray = [
            'fija_cisne' => [
                'title' => $tituloBojaFijaCisne,
                'description' => $descripcionBojaFijaCisne,
                'image' => '/var/www/vhosts/epic-dhawan.82-223-50-168.plesk.page/httpdocs/pub/media/image/enganche-de-remolque-bola-fija-cuello-cisne.jpg'
            ],
            'desmontable_horizontal' => [
                'title' => $titulo_bola_desmontable_horizontal,
                'description' => $descripcion_bola_desmontable_horizontal,
                'image' => '/var/www/vhosts/epic-dhawan.82-223-50-168.plesk.page/httpdocs/pub/media/image/enganche-remolque-bola-desmontable-horizontal.jpg'
            ],
            'desmontable_vertical' => [
                'title' => $titulo_bola_desmontable_vertical,
                'description' => $descripcion_bola_desmontable_vertical,
                'image' => '/var/www/vhosts/epic-dhawan.82-223-50-168.plesk.page/httpdocs/pub/media/image/enganche-remolque-bola-desmontable-vertical.jpg'
            ],
            'fija_mixta' => [
                'title' => $titulo_bola_fija_mixta,
                'description' => $descripcion_bola_fija_mixta,
                'image' => '/var/www/vhosts/epic-dhawan.82-223-50-168.plesk.page/httpdocs/pub/media/image/enganche-remolque-bola-mixta.jpg'
            ],
            'fija_mono' => [
                'title' => $titulo_bola_fija_mono_block,
                'description' => $descripcion_bola_fija_mono_block,
                'image' => '/var/www/vhosts/epic-dhawan.82-223-50-168.plesk.page/httpdocs/pub/media/image/enganche-remolque-bola-mono-block-placa.jpg'
            ]
        ];
    }

    /**
     * 
     * Function to create all electric kits as products in the store
     */
    protected function insertKits()
    {
        $this->product_array = array();
        $this->createAragonKits();
        $this->createLaFuenteKits();
        foreach ($this->product_array as $_product) {
            $product = $this->objectManager->create('\Magento\Catalog\Model\Product');
            $product->setSku($_product['product']->sku); // Set your sku here
            $product->setName("Enganche para " . $_product['product']->name); // Name of Product
            $product->setAttributeSetId(4); // Attribute set id
            $product->setStatus(1); // Status on product enabled/ disabled 1/0
            // $product->setWeight(10); // weight of product
            $product->setVisibility(4); // visibilty of product (catalog / search / catalog, search / Not visible individually)
            $product->setTaxClassId(0); // Tax class id
            $product->setTypeId('simple'); // type of product (simple/virtual/downloadable/configurable)
            $product->setPrice($_product['product']->price * 1.21 / 100); // price of product
            $specialPrice = $this->getPrice($product);
            $product->setSpecialPrice($specialPrice);
            $product->setStockData(
                array(
                    'use_config_manage_stock' => 0,
                    'manage_stock' => 0,
                    'is_in_stock' => 1
                )
            );
            $url = str_replace([' ', '/'], ['', ''], $_product['product']->name) . str_replace(' ', '-', $_product['product']->sku);
            $product->setUrlKey($url);
            $product->save();
            $categoryId = $this->objectManager->get('\Magento\Catalog\Model\CategoryFactory')
                ->create()->getCollection()->addAttributeToFilter('name', $_product['product']->make)->getFirstItem()->getId();
            $modelId = $this->objectManager->get('\Magento\Catalog\Model\CategoryFactory')
                ->create()->getCollection()->addAttributeToFilter('name', $_product['product']->model)->getFirstItem()->getId();
            $this->getCategoryLinkManagement()->assignProductToCategories($product->getSku(), [$categoryId, $modelId]);
        }
    }


    /**
     * 
     * Import electric kit data from aragon (CSV)
    */
    protected function createAragonKits()
    {
    }

    /**
     * 
     * Import electric kit data from LaFuente
     */
    protected function createLaFuenteKits()
    {

        $endpoint = "https://www.lafuente.eu/motor/index.php?app=frontend&exe=portal&op=lista_precios_enganches&iRows=500&sEcho=500&iColumns=16&sColumns&iDisplayStart=10&iDisplayLength=500&mDataProp_0=0&mDataProp_1=1&mDataProp_2=2&mDataProp_3=3&mDataProp_4=4&mDataProp_5=5&mDataProp_6=6&mDataProp_7=7&mDataProp_8=8&mDataProp_9=9&mDataProp_10=10&mDataProp_11=11&mDataProp_12=12&mDataProp_13=13&mDataProp_14=14&mDataProp_15=15&marca&modelo";
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
            if (is_null($make_type_year['model'])) {
                continue;
            } else {
                $price = strip_tags($row[6]);
                $price = (int)str_replace(['EUR', '€'], '', $price) * 100;
                $array = array(
                    'name' => $row[0] . ' ' . $row[2] . ' ' . $make_type_year['variant'] . ' ' . $make_type_year['year'],
                    'sku' => $row[5],
                    'price' => $price,
                    'type_id' => 'simple',
                    'attribute_set_id' => 4,
                    'make' => $row[0],
                    'model' => $make_type_year['model'],
                    'variant' => $make_type_year['variant'],
                    'year' => $make_type_year['year']
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

    protected function fillParameters($string, $object)
    {
        foreach ($object as $key => $value) {
            $string = str_replace("<!-- $key -->", $value, $string);
        }
        return $string;
    }

    /**
     * Function to create products from $this->product_array
     */
    protected function createProducts()
    {
        foreach ($this->product_array as $_product) {
            $product = $this->objectManager->create('\Magento\Catalog\Model\Product');
            $product->setSku($_product['product']->sku); // Set your sku here
            $name = $this->fillParameters($this->descriptionArray[$_product['product']->type]['title'], $_product['product']);
            $product->setName($name); // Name of Product
            $description = $this->fillParameters($this->descriptionArray[$_product['product']->type]['description'], $_product['product']);
            $product->setDescription($description);
            $product->setAttributeSetId(4); // Attribute set id
            $product->setStatus(1); // Status on product enabled/ disabled 1/0
            // $product->setWeight(10); // weight of product
            $product->setVisibility(4); // visibilty of product (catalog / search / catalog, search / Not visible individually)
            $product->setTaxClassId(0); // Tax class id
            $product->setTypeId('simple'); // type of product (simple/virtual/downloadable/configurable)
            $product->setPrice($_product['product']->price * 1.21 / 100); // price of product
            $specialPrice = $this->getPrice($product);
            $product->setSpecialPrice($specialPrice);
            $product->setWebsiteIds(array(1));
            $product->setStockData(
                array(
                    'use_config_manage_stock' => 0,
                    'manage_stock' => 1,
                    'is_in_stock' => 1,
                    'qty' => 99999
                )
            );
            $product->setVariant($_product['product']->variant);
            $product->setDateRange($_product['product']->year);
            // $product->setType($_product['product']->type);
            $product->setTiempoDeMontaje($_product['product']->tiempo_de_montaje);
            $product->setMmr($_product['product']->mmr);
            $product->setValorD($_product['product']->valor_d);
            $product->setValorSCargaVertical($_product['product']->valor_s_carga_vertical);
            
            $url = str_replace([' ', '/'], ['', ''], $_product['product']->name) . str_replace(' ', '-', $_product['product']->sku);
            $product->setUrlKey($url);
            $product->addImageToMediaGallery($this->descriptionArray[$_product['product']->type]['image'], array('image', 'small_image', 'thumbnail'), false, false);
            $product->save();
            $this->objectManager->get('\Magento\Catalog\Api\ProductRepositoryInterface')->save($product);
            $categoryId = $this->objectManager->get('\Magento\Catalog\Model\CategoryFactory')
                ->create()->getCollection()->addAttributeToFilter('name', $_product['product']->make)->getFirstItem()->getId();
            $modelId = $this->objectManager->get('\Magento\Catalog\Model\CategoryFactory')
                ->create()->getCollection()->addAttributeToFilter('name', $_product['product']->model)->getFirstItem()->getId();
            $this->getCategoryLinkManagement()->assignProductToCategories($product->getSku(), [$categoryId, $modelId]);
        }
    }

    /**
     * Function to get Link management interface
     */
    private function getCategoryLinkManagement()
    {
        if (null === $this->categoryLinkManagement) {
            $this->categoryLinkManagement = \Magento\Framework\App\ObjectManager::getInstance()
                ->get('Magento\Catalog\Api\CategoryLinkManagementInterface');
        }
        return $this->categoryLinkManagement;
    }

    /**
     * Function to create categories based on $this->product_array
     */
    protected function createCategories()
    {
        $car_brands = array();
        foreach ($this->product_array as $prod) {
            $models = array();
            $this->make = $prod['product']->make;
            if (!in_array($this->make, $car_brands)) {
                $brand_objects = array_filter($this->product_array, function ($obj) {
                    if ($obj['product']->make == $this->make) return true;
                    else return false;
                });
                foreach ($brand_objects as $bo) {
                    if (!in_array($bo['product']->model, $models)) {
                        $models[] = $bo['product']->model;
                    }
                }
                $car_brands[$this->make] = $models;
            }
        }
        foreach ($car_brands as $brand => $models) {
            $category = $this->objectManager->get('\Magento\Catalog\Model\CategoryFactory')
                ->create()
                ->getCollection()
                ->addAttributeToFilter('name', $brand)
                ->getFirstItem();
            if (!$category->getId()) $category = $this->objectManager->get('\Magento\Catalog\Model\CategoryFactory')->create();
            $category->setName($brand);
            $category->setParentId(1);
            $category->setIsActive(true);

            $categoryId = $this->objectManager->get('\Magento\Catalog\Model\CategoryFactory')
                ->create()
                ->getCollection()
                ->addAttributeToFilter('url_key', $category->getUrlKey())
                ->getFirstItem()
                ->getId();
            if ($categoryId) {
                $category->setUrlKey($category->getUrlKey() . uniqid());
            }
            $category->setUrlKey($category->getUrlKey() . uniqid());
            $this->objectManager->get('\Magento\Catalog\Api\CategoryRepositoryInterface')->save($category);
            $id = $category->getId();
            foreach ($models as $model) {

                $modelExists = $this->objectManager->get('\Magento\Catalog\Model\CategoryFactory')
                    ->create()
                    ->getCollection()
                    ->addAttributeToFilter('name', $model)
                    ->addAttributeToFilter('parent_id', $id)
                    ->getFirstItem()
                    ->getId();

                if (!$modelExists) {
                    $modelCategory = $this->objectManager->get('\Magento\Catalog\Model\CategoryFactory')->create();
                    $modelCategory->setName($model);
                    $modelCategory->setParentId($id);
                    $modelCategory->setIsActive(true);
                    $modelCategoryId = $this->objectManager->get('\Magento\Catalog\Model\CategoryFactory')
                        ->create()->getCollection()->addAttributeToFilter('url_key', $category->getUrlKey())->getFirstItem()->getId();
                    if ($modelCategoryId) {
                        $modelCategory->setUrlKey($modelCategory->getUrlKey() . uniqid());
                    }
                    $this->objectManager->get('\Magento\Catalog\Api\CategoryRepositoryInterface')->save($modelCategory);
                }
            }
        }
    }

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
        foreach ($lines as $line) {
            $line_array = explode(';', $line);
            if (!is_array($line_array) || $line_array[0] == 'Referencia' || $line_array[0] == '') {
                continue;
            } else {
                $array = array(
                    'name' => $line_array[3] . ' ' . $line_array[4] . ' ' . $line_array[6] . ' ' . $line_array[8],
                    'sku' => $line_array[0],
                    'price' => (int)str_replace(['EUR', '€'], '', $line_array[9]) * 100,
                    'type_id' => 'simple',
                    'attribute_set_id' => 4,
                    'make' => $line_array[3],
                    'model' => $line_array[4],
                    'variant' => $line_array[6],
                    'year' => $line_array[8],
                    'supplier' => 'Aragón'

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
    protected function get_lafuente_from_db()
    {

        $endpoint = "https://www.lafuente.eu/motor/index.php?app=frontend&exe=portal&op=lista_precios_enganches&iRows=10&sEcho=10&iColumns=16&sColumns&iDisplayStart=1000&iDisplayLength=10&mDataProp_0=0&mDataProp_1=1&mDataProp_2=2&mDataProp_3=3&mDataProp_4=4&mDataProp_5=5&mDataProp_6=6&mDataProp_7=7&mDataProp_8=8&mDataProp_9=9&mDataProp_10=10&mDataProp_11=11&mDataProp_12=12&mDataProp_13=13&mDataProp_14=14&mDataProp_15=15&marca&modelo";
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
            if (is_null($make_type_year['model'])) {
                continue;
            } else {
                $type = $this->getType($row[4]);
                $price = strip_tags($row[6]);
                $price = (int)str_replace(['EUR', '€'], '', $price) * 100;
                $array = array(
                    'name' => $row[0] . ' ' . $row[2] . ' ' . $make_type_year['variant'] . ' ' . $make_type_year['year'],
                    'sku' => $row[5],
                    'price' => $price,
                    'type_id' => 'simple',
                    'attribute_set_id' => 4,
                    'make' => $row[0],
                    'model' => $make_type_year['model'],
                    'variant' => $make_type_year['variant'],
                    'year' => $make_type_year['year'],
                    'supplier' => 'LaFuente',
                    'type' => $type,
                    'tiempo_de_montaje' => $row[7],
                    'mmr' => $row[9],
                    'valor_d' => $row[11],
                    'valor_s_carga_vertical' => $row[10]
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

    protected function getType($string)
    {
        if (strpos(strtolower($string), strtolower('fija'))) {
            // Bola fija
            if (strpos(strtolower($string), strtolower('cisne'))) {
                // Fija cisne
                return 'fija_cisne';
            } elseif (strpos(strtolower($string), strtolower('mixta'))) {
                // Fija horizontal
                return 'fija_mixta';
            } elseif (strpos(strtolower($string), strtolower('mono'))) {
                // Fija vertical
                return 'fija_mono';
            }
        } elseif (strpos(strtolower($string), strtolower('desmontable'))) {
            // desmontable
            if (strpos(strtolower($string), strtolower('cisne'))) {
                // desmontable cisne
                return 'desmontable_cisne';
            } elseif (strpos(strtolower($string), strtolower('horizontal'))) {
                // desmontable horizontal
                return 'desmontable_horizontal';
            } elseif (strpos(strtolower($string), strtolower('vertical'))) {
                // desmontable vertical
                return 'desmontable_vertical';
            }
        }
        return 'fija_cisne';
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
        if (preg_match($this->date_preg_match, $input_string, $matches)) {
            if (count($matches) === 1) {
                $date_array = explode(' a ', $matches[0]);
                foreach ($date_array as $date_) {
                    $date = explode('-', $date_);
                    $date[1] = ((int)$date[1] > 50) ? '19' . $date[1] : '20' . $date[1];
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

    protected function getPrice($product)
    {
        $profitMargin = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('profit_margin');
        $profitMarginValue = (100 + (int)$profitMargin->getPlainValue())/100;
        $discountLaFuente = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('descuento_lafuente_es');
        $discountLaFuenteValue = (100 - (int)$discountLaFuente->getPlainValue())/100;
        $discountLaFuenteImports = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('descuento_lafuente_im');
        $discountLaFuenteImportsValue = (100 - (int)$discountLaFuenteImports->getPlainValue())/100;
        $discountAragon = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('descuento_aragon_es');
        $discountAragonValue = (100 - (int)$discountAragon->getPlainValue())/100;
        $discountAragonImports = $this->objectManager->get('Magento\Variable\Model\Variable')->loadByCode('descuento_aragon_im');
        $discountAragonImportsValue = (100 - (int)$discountAragonImports->getPlainValue())/100;

        if (substr($product->getSku(), 0, 1) == 'X') {
            if (substr($product->getSku(), strlen($product->getSku()) - 2, 1) == 'X') {
                return $product->getPrice() * $discountLaFuenteValue * $profitMarginValue * 1.21;
            }
            return $product->getPrice() * $discountLaFuenteImportsValue * $profitMarginValue * 1.21;
        } else {
            if (substr($product->getSku(), strlen($product->getSku()) - 2, 1) == 'X') {
                return $product->getPrice() * $discountAragonValue * $profitMarginValue * 1.21;
            }
            return $product->getPrice() * $discountAragonImportsValue * $profitMarginValue * 1.21;
        }
    }

    /* 
    * TODO 
        - Price calculator based on user input values
        - Stock control
        - Add description & title maker - Based on type & source
        - Add proveedor (¿brand?)
        - Relationships between enganches and kits
    * 
    */
}

/** @var \Magento\Framework\App\Http $app */
$app = $bootstrap->createApplication('CreateCategoriesApp');
$bootstrap->run($app);
