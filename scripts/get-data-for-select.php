<?php
require dirname(__FILE__) . '/../app/bootstrap.php';
$bootstrap = \Magento\Framework\App\Bootstrap::create(BP, $_SERVER);
require dirname(__FILE__) . '/abstract.php';


class GetDataForSelect extends AbstractApp
{
    protected $objectManager;
    protected $resourceConnection;

    public function run()
    {
        $this->_state->setAreaCode('frontend');
        $this->objectManager = \Magento\Framework\App\ObjectManager::getInstance();
        switch ($_GET['data_type']) {
            case 'models':
                echo $this->_getModelsForBrand();
                break;
            case 'versions':
                echo $this->_getVersionsForModel();
                break;
            case 'years':
                echo $this->_getYears();
                break;
        }
    }

    protected function _getVersionsForModel()
    {
        $this->resourceConnection = \Magento\Framework\App\ResourceConnection::getInstance();
        $connection = $this->resourceConnection->getConnection();
        $categoryId = 2;
        $link = mysql_connect('localhost', 'enganches_user', 'Wje5q?24')
            or die('No se pudo conectar: ' . mysql_error());
        echo 'Connected successfully';
        mysql_select_db('enganches_') or die('No se pudo seleccionar la base de datos');

        // Realizar una consulta MySQL
        $query = "SELECT DISTINCT `value` FROM catalog_product_entity_varchar WHERE entity_id IN (SELECT product_id FROM catalog_category_product WHERE category_id = $categoryId) AND attribute_id = 194 ORDER BY `value` DESC";
        $result = mysql_query($query) or die('Consulta fallida: ' . mysql_error());

        $select_data = array();
        while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
            foreach ($line as $col_value) {
                $select_data[] = array(
                    'label' => $col_value,
                    'id' => $col_value
                );
            }
        }
        return json_encode($select_data);
    }

    protected function _getYears()
    {
        $arr = [];
        $i = 1970;
        $date = new DateTime();

        while ($i < (int)$date->format('Y') + 1) {
            $arr[] = [
                'label' => $i,
                'id' => $i
            ];
        }
        return json_encode(
            $arr
        );
    }

    protected function _getModelsForBrand()
    {
        $id_parent = $_GET['id_car_brand'];
        $categories = $this->objectManager->get('\Magento\Catalog\Model\ResourceModel\Category\CollectionFactory')->create();
        $categories->addAttributeToFilter('parent_id', array('eq' => (int)$id_parent));
        $categories->addAttributeToSelect('*');
        $select_data = [];
        foreach ($categories as $category) {
            $select_data[] = array(
                'label' => $category->getName(),
                'id' => $category->getId()
            );
        }

        return json_encode($select_data);
    }

    protected function _getYearsForModel()
    {
    }
}

/** @var \Magento\Framework\App\Http $app */
$app = $bootstrap->createApplication('GetDataForSelect');
$bootstrap->run($app);
