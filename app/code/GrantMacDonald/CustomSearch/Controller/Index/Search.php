<?php

namespace GrantMacDonald\CustomSearch\Controller\Index;


use Magento\Framework\App\Action\HttpGetActionInterface;
use Magento\Catalog\Model\Layer\Resolver;
use Magento\Catalog\Model\Session;
use Magento\Framework\App\Action\Context;
use Magento\Framework\App\Action\HttpPostActionInterface;
use Magento\Store\Model\StoreManagerInterface;
use Magento\Search\Model\QueryFactory;
use Magento\Search\Model\PopularSearchTerms;

class Search extends \Magento\CatalogSearch\Controller\Result\Index {
    
    public function execute()
    {
        $this->layerResolver->create(Resolver::CATALOG_LAYER_SEARCH);

        /* @var $query \Magento\Search\Model\Query */
        $query = $this->_queryFactory->get();

        $storeId = $this->_storeManager->getStore()->getId();
        $query->setStoreId($storeId);

        $queryText = $query->getQueryText();

        $catalogSearchHelper = $this->_objectManager->get(\Magento\CatalogSearch\Helper\Data::class);

        $getAdditionalRequestParameters = $this->getRequest()->getParams();
        unset($getAdditionalRequestParameters[QueryFactory::QUERY_VAR_NAME]);

        $handles = null;
        if ($query->getNumResults() == 0) {
            $this->_view->getPage()->initLayout();
            $handles = $this->_view->getLayout()->getUpdate()->getHandles();
            $handles[] = static::DEFAULT_NO_RESULT_HANDLE;
        }

        if (empty($getAdditionalRequestParameters) &&
            $this->_objectManager->get(PopularSearchTerms::class)->isCacheable($queryText, $storeId)
        ) {
            $this->getCacheableResult($catalogSearchHelper, $query, $handles);
        } else {
            $this->getNotCacheableResult($catalogSearchHelper, $query, $handles);
        }
    }
}