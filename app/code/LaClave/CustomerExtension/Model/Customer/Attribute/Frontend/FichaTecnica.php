<?php

namespace LaClave\CustomerExtension\Model\Customer\Attribute\Frontend;

class FichaTecnica extends \Magento\Eav\Model\Entity\Attribute\Frontend\AbstractFrontend {

    /**
     * Store manager
     *
     * @var \Magento\Store\Model\StoreManagerInterface
     */
    protected $_storeManager;

    /**
     * Construct
     *
     * @param \Magento\Store\Model\StoreManagerInterface $storeManager
     */
    public function __construct(\Magento\Store\Model\StoreManagerInterface $storeManager)
    {
        $this->_storeManager = $storeManager;
    }

    /**
     * Returns url to customer image
     *
     * @param  \Magento\Catalog\Model\Customer $customer
     *
     * @return string|false
     */
    public function getUrl($customer)
    {
        $fichaTecnica = $customer->getData($this->getAttribute()->getAttributeCode());
        $url = false;
        if (!empty($fichaTecnica)) {
            $url = $this->_storeManager->getStore($customer->getStore())
                    ->getBaseUrl(\Magento\Framework\UrlInterface::URL_TYPE_MEDIA)
                . 'catalog/customer/ficha_tecnica/' . $fichaTecnica;
        }
        return $url;
    }
}