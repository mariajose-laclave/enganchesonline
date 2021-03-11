<?php
namespace StripeIntegration\Payments\Model\Method\Ideal;

/**
 * Interceptor class for @see \StripeIntegration\Payments\Model\Method\Ideal
 */
class Interceptor extends \StripeIntegration\Payments\Model\Method\Ideal implements \Magento\Framework\Interception\InterceptorInterface
{
    use \Magento\Framework\Interception\Interceptor;

    public function __construct(\Magento\Framework\App\RequestInterface $request, \Magento\Framework\UrlInterface $urlBuilder, \Magento\Store\Model\StoreManagerInterface $storeManager, \Magento\Framework\Model\Context $context, \Magento\Framework\Registry $registry, \Magento\Framework\Api\ExtensionAttributesFactory $extensionFactory, \Magento\Framework\Api\AttributeValueFactory $customAttributeFactory, \Magento\Payment\Helper\Data $paymentData, \Magento\Framework\App\Config\ScopeConfigInterface $scopeConfig, \StripeIntegration\Payments\Model\Config $config, \StripeIntegration\Payments\Helper\Generic $helper, \StripeIntegration\Payments\Helper\Address $addressHelper, \StripeIntegration\Payments\Helper\Api $api, \StripeIntegration\Payments\Model\SourceFactory $sourceFactory, \Magento\Payment\Model\Method\Logger $logger, \Magento\Checkout\Helper\Data $checkoutHelper, ?\Magento\Framework\Model\ResourceModel\AbstractResource $resource = null, ?\Magento\Framework\Data\Collection\AbstractDb $resourceCollection = null, array $data = [])
    {
        $this->___init();
        parent::__construct($request, $urlBuilder, $storeManager, $context, $registry, $extensionFactory, $customAttributeFactory, $paymentData, $scopeConfig, $config, $helper, $addressHelper, $api, $sourceFactory, $logger, $checkoutHelper, $resource, $resourceCollection, $data);
    }

    /**
     * {@inheritdoc}
     */
    public function denyPayment(\Magento\Payment\Model\InfoInterface $payment)
    {
        $pluginInfo = $this->pluginList->getNext($this->subjectType, 'denyPayment');
        if (!$pluginInfo) {
            return parent::denyPayment($payment);
        } else {
            return $this->___callPlugins('denyPayment', func_get_args(), $pluginInfo);
        }
    }
}
