<?php
/**
 * Short description...
 *
 * Long description
 * Broken down into several lines
 *
 * License notice...
 */
use \Magento\Framework\AppInterface as AppInterface;
use \Magento\Framework\App\Http as Http;

use Magento\Framework\ObjectManager\ConfigLoaderInterface;
use Magento\Framework\App\Request\Http as RequestHttp;
use Magento\Framework\App\Response\Http as ResponseHttp;
use Magento\Framework\Event;
use Magento\Framework\Filesystem;
use Magento\Framework\App\AreaList as AreaList;
use Magento\Framework\App\State as State;

    /**
     * Function to create products from $this->product_array
     */
abstract class AbstractApp implements AppInterface
{
    public function __construct(
        \Magento\Framework\ObjectManagerInterface $objectManager,
        Event\Manager $eventManager,
        AreaList $areaList,
        RequestHttp $request,
        ResponseHttp $response,
        ConfigLoaderInterface $configLoader,
        State $state,
        Filesystem $filesystem,
        \Magento\Framework\Registry $registry
    ) {
        $this->_objectManager = $objectManager;
        $this->_eventManager = $eventManager;
        $this->_areaList = $areaList;
        $this->_request = $request;
        $this->_response = $response;
        $this->_configLoader = $configLoader;
        $this->_state = $state;
        $this->_filesystem = $filesystem;
        $this->registry = $registry;
    }

    /**
     * Function to create products from $this->product_array
     */
    public function launch()
    {
        $this->run();
        return $this->_response;
    }

    /**
     * Function to create products from $this->product_array
     */
    abstract public function run();

    /**
     * Function to create products from $this->product_array
     */
    public function catchException(\Magento\Framework\App\Bootstrap $bootstrap, \Exception $exception)
    {
        return false;
    }
}