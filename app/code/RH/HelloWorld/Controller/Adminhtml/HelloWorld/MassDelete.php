<?php
/**
 * Copyright © Magento, Inc. All rights reserved.
 * See COPYING.txt for license details.
 */

/**
 * Code standard by : RH
 */
namespace RH\HelloWorld\Controller\Adminhtml\HelloWorld;

use Magento\Backend\App\Action;
use Magento\Backend\App\Action\Context;
use Magento\Framework\Controller\ResultFactory;
use Magento\Ui\Component\MassAction\Filter;
use RH\HelloWorld\Model\ResourceModel\HelloWorld\Collection;

/**
 * Class MassDelete
 */
class MassDelete extends Action
{

    /**
     * @var Filter
     */
    protected $filter;

    /**
     * @var Collection
     */
    protected $helloworldCollection;

    /**
     * @param  Context    $context
     * @param  Filter     $filter
     * @param  Collection $helloworldCollection
     */
    public function __construct(
        Context $context,
        Filter $filter,
        Collection $helloworldCollection
    ) {
        $this->filter = $filter;
        $this->helloworldCollection = $helloworldCollection;
        parent::__construct($context);
    }

    /**
     * Execute action
     *
     * @return \Magento\Backend\Model\View\Result\Redirect
     * @throws \Magento\Framework\Exception\LocalizedException | \Exception
     */
    public function execute()
    {
        $collection = $this->filter->getCollection($this->helloworldCollection);
        $collectionSize = $collection->getSize();
        $collection->walk('delete');

        $this->messageManager->addSuccessMessage(__('A total of %1 record(s) have been deleted.', $collectionSize));

        /** @var \Magento\Backend\Model\View\Result\Redirect $resultRedirect */
        $resultRedirect = $this->resultFactory->create(ResultFactory::TYPE_REDIRECT);
        return $resultRedirect->setPath('*/*/');
    }
}