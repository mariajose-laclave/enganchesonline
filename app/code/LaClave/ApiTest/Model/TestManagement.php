<?php
/**
 * Copyright ©  All rights reserved.
 * See COPYING.txt for license details.
 */
declare(strict_types=1);

namespace LaClave\ApiTest\Model;

class TestManagement implements \LaClave\ApiTest\Api\TestManagementInterface
{
    protected $_customerSession;
    protected $_customerFactory;

    public function __construct(
        \Magento\Customer\Model\SessionFactory $customerSession,
        \Magento\Customer\Model\CustomerFactory $customerFactory
    )
    {
        $this->_customerSession = $customerSession->create();
        $this->_customerFactory = $customerFactory->create();
    }

    /**
     * {@inheritdoc}
     */
    public function getTest($param)
    {
        $customerId = $this->getLoggedinCustomerId();
        if ($customerId) {
            $customer = $this->_customerFactory->load($customerId);
            return $customer->getName();
        }
        return false;
    }

    
    public function getLoggedinCustomerId() {
        if ($this->_customerSession->isLoggedIn()) {
            return $this->_customerSession->getId();
        }
        return false;
    }
}

