<?php
require dirname(__FILE__) . '/../app/bootstrap.php';
$bootstrap = \Magento\Framework\App\Bootstrap::create(BP, $_SERVER);
require dirname(__FILE__) . '/abstract.php';

class GetDataForSelect extends AbstractApp
{
    protected $objectManager;
    
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
        return json_encode(
            [['label' => '3 door', 'id' => '3 door'], ['label' => '5 door', 'id' => '5 door']]
        );
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
