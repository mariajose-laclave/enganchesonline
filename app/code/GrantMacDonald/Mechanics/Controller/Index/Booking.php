<?php

namespace GrantMacDonald\Mechanics\Controller\Index;

use Magento\Framework\Controller\ResultFactory;

class Booking extends \Magento\Framework\App\Action\Action
{
    /**
     * Booking action
     *
     * @return void
     */
    public function execute()
    {
        // 1. POST request : Get booking data
        $post = (array) $this->getRequest()->getPost();

        if (!empty($post)) {
            // Retrieve your form data
            
            // Doing-something with...

            // Display the succes form validation message
            $this->messageManager->addSuccessMessage('Booking done !');

            // Redirect to your form page (or anywhere you want...)
            $resultRedirect = $this->resultFactory->create(ResultFactory::TYPE_REDIRECT);
            $resultRedirect->setUrl('/grantmacdonaldmechanics/index/booking');

            return $resultRedirect;
        }
        // 2. GET request : Render the booking page 
        $this->_view->loadLayout();
        $this->_view->renderLayout();
    }
}