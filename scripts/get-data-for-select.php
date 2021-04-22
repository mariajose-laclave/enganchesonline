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
        
        $categoryId = (isset($_GET['id_car_brand']) && $_GET['id_car_brand'] != '') ? $_GET['id_car_brand'] : 2;
        $query = "SELECT DISTINCT `value` FROM catalog_product_entity_varchar WHERE entity_id IN (SELECT product_id FROM catalog_category_product WHERE category_id = $categoryId) AND attribute_id = 194 ORDER BY `value` DESC";

        $mysqli = new mysqli('localhost', 'enganches_user', 'Wje5q?24', 'enganches_');
        $mysqli->set_charset("utf8");
        $res = $mysqli->query("$query");
        $select_data = array();
        while($row = $res->fetch_object()){
            $select_data[] = array(
                'label' => $row->value,
                'id' => $row->value
            );
        }
        
        return json_encode($select_data);
    }

    protected function _getYears()
    {
        $categoryId = (isset($_GET['id_car_brand']) && $_GET['id_car_brand'] != '') ? $_GET['id_car_brand'] : 2;
        $query = "SELECT DISTINCT `value` FROM catalog_product_entity_varchar WHERE entity_id IN (SELECT product_id FROM catalog_category_product WHERE category_id = $categoryId) AND attribute_id = 195 ORDER BY `value` DESC";
        if (isset($_GET['variant']) && $_GET['variant'] != '') {
            $variant = $_GET['variant'];
            $query = "SELECT DISTINCT `value` FROM catalog_product_entity_varchar WHERE entity_id IN (SELECT product_id FROM catalog_category_product WHERE category_id = $categoryId) AND attribute_id = 195 AND entity_id IN (SELECT entity_id FROM catalog_product_entity_varchar WHERE attribute_id = 194 AND value = '$variant') ORDER BY `value` DESC";
        }

        $mysqli = new mysqli('localhost', 'enganches_user', 'Wje5q?24', 'enganches_');
        $mysqli->set_charset("utf8");
        $res = $mysqli->query("$query");
        $select_data = array();
        while($row = $res->fetch_object()){
            $select_data[] = array(
                'label' => $row->value,
                'id' => $row->value
            );
        }
        
        return json_encode($select_data);
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
