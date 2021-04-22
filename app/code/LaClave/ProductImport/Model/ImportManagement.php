<?php
/**
 * Copyright ©  All rights reserved.
 * See COPYING.txt for license details.
 */
declare(strict_types=1);

namespace LaClave\ProductImport\Model;


use Magento\Framework\Notification\NotifierInterface as NotifierPool;

class ImportManagement implements \LaClave\ProductImport\Api\ImportManagementInterface
{

    /**
     * Notifier Pool
     *
     * @var NotifierPool
     */
    protected $notifierPool;


    public function __construct(
        NotifierPool $notifierPool
    ) {
        $this->notifierPool = $notifierPool;
    }

    /**
     * {@inheritdoc}
     */
    public function postImport($param)
    {
        $data = json_decode($param);

        switch ($data->action) {
            case 'import_and_wipe':
                $this->importAndWipe();
                break;
            case 'import_update':
                $this->importUpdate();
                break;
            case 'import_kits':
                $this->importKits();
                break;
            case 'import_tow_bars':
                $this->importTowBars();
                break;
            default:
                $this->test();
                break;
        }
        
        return 'hello api POST return the $param ' . $param;
    }

    protected function importAndWipe()
    {

    }

    protected function importUpdate()
    {

    }

    protected function importKits()
    {

    }

    protected function importTowBars()
    {

    }

    protected function test()
    {
        $this->notifierPool->addNotice('Notice Title', 'Notice description text.');
        return 'Notification added';
    }

}

