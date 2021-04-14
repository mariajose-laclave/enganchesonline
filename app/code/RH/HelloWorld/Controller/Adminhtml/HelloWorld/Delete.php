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

class Delete extends Action
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
     * {@inheritdoc}
     */
    protected function _isAllowed()
    {
        return $this->_authorization->isAllowed('RH_HelloWorld::helloworld');
    }

    /**
     * Delete action
     *
     * @return \Magento\Framework\Controller\ResultInterface
     */
    public function execute()
    {
        $resultRedirect = $this->resultRedirectFactory->create();
        $id = $this->getRequest()->getParam('entity_id', null);

        try {
            $helloWorldData = $this->helloworldFactory->create()->load($id);
            if ($helloworldData->getId()) {
                $helloworldData->delete();
                $this->messageManager->addSuccessMessage(__('You deleted the record.'));
            } else {
                $this->messageManager->addErrorMessage(__('Record does not exist.'));
            }
        } catch (\Exception $exception) {
            $this->messageManager->addErrorMessage($exception->getMessage());
        }

        return $resultRedirect->setPath('*/*');
    }
}