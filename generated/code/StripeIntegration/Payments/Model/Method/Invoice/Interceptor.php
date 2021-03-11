<?php
namespace StripeIntegration\Payments\Model\Method\Invoice;

/**
 * Interceptor class for @see \StripeIntegration\Payments\Model\Method\Invoice
 */
class Interceptor extends \StripeIntegration\Payments\Model\Method\Invoice implements \Magento\Framework\Interception\InterceptorInterface
{
    use \Magento\Framework\Interception\Interceptor;

    public function __construct(\Magento\Framework\Event\ManagerInterface $eventManager, \Magento\Payment\Gateway\Config\ValueHandlerPoolInterface $valueHandlerPool, \Magento\Payment\Gateway\Data\PaymentDataObjectFactory $paymentDataObjectFactory, $code, $formBlockType, $infoBlockType, \StripeIntegration\Payments\Model\Config $config, \StripeIntegration\Payments\Helper\Generic $helper, \StripeIntegration\Payments\Model\Stripe\ProductFactory $productFactory, \StripeIntegration\Payments\Model\Stripe\PriceFactory $priceFactory, \StripeIntegration\Payments\Model\Stripe\CouponFactory $couponFactory, \StripeIntegration\Payments\Model\Stripe\InvoiceItemFactory $invoiceItemFactory, \StripeIntegration\Payments\Model\Stripe\InvoiceFactory $invoiceFactory, \StripeIntegration\Payments\Model\InvoiceFactory $orderInvoiceFactory, \Magento\Framework\App\CacheInterface $cache, ?\Magento\Payment\Gateway\Command\CommandPoolInterface $commandPool = null, ?\Magento\Payment\Gateway\Validator\ValidatorPoolInterface $validatorPool = null)
    {
        $this->___init();
        parent::__construct($eventManager, $valueHandlerPool, $paymentDataObjectFactory, $code, $formBlockType, $infoBlockType, $config, $helper, $productFactory, $priceFactory, $couponFactory, $invoiceItemFactory, $invoiceFactory, $orderInvoiceFactory, $cache, $commandPool, $validatorPool);
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
