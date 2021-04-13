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
use RH\HelloWorld\Model\HelloWorldFactory;

class Save extends Action
{

    /**
     * @var HelloWorldFactory
     */
    protected $helloworldFactory;

    /**
     * @param  Context           $context
     * @param  HelloWorldFactory $helloworldFactory
     */
    public function __construct(
        Context $context,
        HelloWorldFactory $helloworldFactory
    ) {
        $this->helloworldFactory = $helloworldFactory;
        parent::__construct($context);
    }

    /**
     * For allow to access or not
     *
     * return boolean
     */
    protected function _isAllowed()
    {
        return $this->_authorization->isAllowed('RH_HelloWorld::helloworld');
    }

    /**
     * Save action
     *
     * @return \Magento\Framework\Controller\ResultInterface
     */
    public function execute()
    {
        $storeId = (int) $this->getRequest()->getParam('store_id');
        $data = $this->getRequest()->getParams();
        /** @var \Magento\Backend\Model\View\Result\Redirect $resultRedirect */
        $resultRedirect = $this->resultRedirectFactory->create();
        if ($data) {
            $params = [];
            $helloworldData = $this->helloworldFactory->create();
            $helloworldData->setStoreId($storeId);
            $params['store'] = $storeId;
            if (empty($data['entity_id'])) {
                $data['entity_id'] = null;
            } else {
                $helloworldData->load($data['entity_id']);
                $params['entity_id'] = $data['entity_id'];
            }
            $helloworldData->addData($data);

            $this->_eventManager->dispatch(
                'rh_helloworld_helloworld_prepare_save',
                ['object' => $this->helloworldFactory, 'request' => $this->getRequest()]
            );

            try {
                $helloworldData->save();
                $this->messageManager->addSuccessMessage(__('You saved this record.'));
                $this->_getSession()->setFormData(false);
                if ($this->getRequest()->getParam('back')) {
                    $params['entity_id'] = $helloworldData->getId();
                    $params['_current'] = true;
                    return $resultRedirect->setPath('*/*/edit', $params);
                }
                return $resultRedirect->setPath('*/*/');
            } catch (\Exception $e) {
                $this->messageManager->addErrorMessage($e->getMessage());
                $this->messageManager->addExceptionMessage($e, __('Something went wrong while saving the record.'));
            }

            $this->_getSession()->setFormData($this->getRequest()->getPostValue());
            return $resultRedirect->setPath('*/*/edit', $params);
        }
        return $resultRedirect->setPath('*/*/');
    }
}