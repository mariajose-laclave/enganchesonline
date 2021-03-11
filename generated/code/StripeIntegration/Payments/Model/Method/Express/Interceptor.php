<?php
namespace StripeIntegration\Payments\Model\Method\Express;

/**
 * Interceptor class for @see \StripeIntegration\Payments\Model\Method\Express
 */
class Interceptor extends \StripeIntegration\Payments\Model\Method\Express implements \Magento\Framework\Interception\InterceptorInterface
{
    use \Magento\Framework\Interception\Interceptor;

    public function __construct(\Magento\Framework\Event\ManagerInterface $eventManager, \Magento\Payment\Gateway\Config\ValueHandlerPoolInterface $valueHandlerPool, \Magento\Payment\Gateway\Data\PaymentDataObjectFactory $paymentDataObjectFactory, $code, $formBlockType, $infoBlockType, \StripeIntegration\Payments\Model\Config $config, \StripeIntegration\Payments\Model\Method\Checkout\Card $checkoutCardMethod, \StripeIntegration\Payments\Helper\Generic $helper, \StripeIntegration\Payments\Helper\Api $api, \StripeIntegration\Payments\Model\PaymentIntent $paymentIntent, \Magento\Checkout\Helper\Data $checkoutHelper, \Magento\Framework\App\CacheInterface $cache, \Psr\Log\LoggerInterface $logger, ?\Magento\Payment\Gateway\Command\CommandPoolInterface $commandPool = null, ?\Magento\Payment\Gateway\Validator\ValidatorPoolInterface $validatorPool = null)
    {
        $this->___init();
        parent::__construct($eventManager, $valueHandlerPool, $paymentDataObjectFactory, $code, $formBlockType, $infoBlockType, $config, $checkoutCardMethod, $helper, $api, $paymentIntent, $checkoutHelper, $cache, $logger, $commandPool, $validatorPool);
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
