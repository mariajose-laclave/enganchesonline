<?php
use \Magento\Framework\AppInterface as AppInterface;
use \Magento\Framework\App\Http as Http;

use Magento\Framework\ObjectManager\ConfigLoaderInterface;
use Magento\Framework\App\Request\Http as RequestHttp;
use Magento\Framework\App\Response\Http as ResponseHttp;
use Magento\Framework\Event;
use Magento\Framework\Filesystem;
use Magento\Framework\App\AreaList as AreaList;
use Magento\Framework\App\State as State;

require dirname(__FILE__) . '/../app/bootstrap.php';
$bootstrap = \Magento\Framework\App\Bootstrap::create(BP, $_SERVER);
require dirname(__FILE__) . '/abstract.php';

class CreateCategoriesApp extends AbstractApp
{

    public function __construct(
        \Magento\Framework\ObjectManagerInterface $objectManager,
        Event\Manager $eventManager,
        AreaList $areaList,
        RequestHttp $request,
        ResponseHttp $response,
        ConfigLoaderInterface $configLoader,
        Filesystem $filesystem,
        \Magento\Framework\Registry $registry
    )
    {
        parent::__construct();
        $this->_state->setAreaCode(\Magento\Framework\App\Area::AREA_GLOBAL);        
    }

    public function run()
    {
        $objectManager = \Magento\Framework\App\ObjectManager::getInstance();
        $product = $objectManager->create('\Magento\Catalog\Model\Product');
        $product->setSku('my-sku'); // Set your sku here
        $product->setName('Sample Simple Product'); // Name of Product
        $product->setAttributeSetId(4); // Attribute set id
        $product->setStatus(1); // Status on product enabled/ disabled 1/0
        $product->setWeight(10); // weight of product
        $product->setVisibility(4); // visibilty of product (catalog / search / catalog, search / Not visible individually)
        $product->setTaxClassId(0); // Tax class id
        $product->setTypeId('simple'); // type of product (simple/virtual/downloadable/configurable)
        $product->setPrice(100); // price of product
        $product->setStockData(
            array(
                'use_config_manage_stock' => 0,
                'manage_stock' => 1,
                'is_in_stock' => 1,
                'qty' => 999999999
            )
        );
        $product->save();
        /*
        $this->_objectManager->get('Magento\Framework\Registry')
            ->register('isSecureArea', true);

        $category = $this->_objectManager->create('\Magento\Catalog\Model\Category');
        $category = $category->load(343);

        $category->delete();*/
    }
}

/** @var \Magento\Framework\App\Http $app */
$app = $bootstrap->createApplication('CreateCategoriesApp');
$bootstrap->run($app);
