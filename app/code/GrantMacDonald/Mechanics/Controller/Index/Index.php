<?php

declare(strict_types=1);

namespace GrantMacDonald\Mechanics\Controller\Index;

class Index extends \Magento\Framework\App\Action\Action
{

    protected $postFields = [
        'name',
        'direccion',
        'cif',
        'telefono',
        'email',
        'persona_de_contacto',
        'precio_hora',
        'marca_enganches',
        'enganches_montados_por_ano'
    ];
    protected $resultPageFactory;

    /**
     * Constructor
     *
     * @param \Magento\Framework\App\Action\Context  $context
     * @param \Magento\Framework\View\Result\PageFactory $resultPageFactory
     */
    public function __construct(
        \Magento\Framework\App\Action\Context $context,
        \Magento\Framework\View\Result\PageFactory $resultPageFactory
    ) {
        $this->resultPageFactory = $resultPageFactory;
        parent::__construct($context);
    }

    /**
     * Execute view action
     *
     * @return \Magento\Framework\Controller\ResultInterface
     */
    public function execute()
    {
        $objectManager = \Magento\Framework\App\ObjectManager::getInstance();
        $categories = $objectManager->get('\Smile\CustomEntity\Model\ResourceModel\CustomEntity\Collection')->create();
        $post = $this->getRequest()->getParams();
        echo var_dump($post);

        foreach ($this->postFields as $field) {
            if (isset($post[$field])) {

            }
        }
        return $this->resultPageFactory->create();
    }
}
