<?php
namespace StripeIntegration\Payments\Model\Method\Checkout\Card;

/**
 * Interceptor class for @see \StripeIntegration\Payments\Model\Method\Checkout\Card
 */
class Interceptor extends \StripeIntegration\Payments\Model\Method\Checkout\Card implements \Magento\Framework\Interception\InterceptorInterface
{
    use \Magento\Framework\Interception\Interceptor;

    public function __construct(\Magento\Framework\App\RequestInterface $request, \Magento\Framework\UrlInterface $urlBuilder, \Magento\Store\Model\StoreManagerInterface $storeManager, \Magento\Tax\Helper\Data $taxHelper, \Magento\Framework\Model\Context $context, \Magento\Framework\Registry $registry, \Magento\Framework\Api\ExtensionAttributesFactory $extensionFactory, \Magento\Framework\Api\AttributeValueFactory $customAttributeFactory, \Magento\Payment\Helper\Data $paymentData, \Magento\Framework\App\Config\ScopeConfigInterface $scopeConfig, \StripeIntegration\Payments\Model\Config $config, \StripeIntegration\Payments\Helper\Generic $helper, \StripeIntegration\Payments\Helper\Api $api, \StripeIntegration\Payments\Model\PaymentIntent $paymentIntent, \StripeIntegration\Payments\Model\Stripe\CouponFactory $couponFactory, \StripeIntegration\Payments\Helper\Subscriptions $subscriptions, \Magento\Payment\Model\Method\Logger $logger, \Magento\Checkout\Helper\Data $checkoutHelper, ?\Magento\Framework\Model\ResourceModel\AbstractResource $resource = null, ?\Magento\Framework\Data\Collection\AbstractDb $resourceCollection = null, array $data = [])
    {
        $this->___init();
        parent::__construct($request, $urlBuilder, $storeManager, $taxHelper, $context, $registry, $extensionFactory, $customAttributeFactory, $paymentData, $scopeConfig, $config, $helper, $api, $paymentIntent, $couponFactory, $subscriptions, $logger, $checkoutHelper, $resource, $resourceCollection, $data);
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
