<?php
/**
 * Copyright © 2019 Rokanthemes. All rights reserved.
 */

namespace Rokanthemes\StoreLocator\Setup;

use \Magento\Framework\Setup\InstallSchemaInterface;
use \Magento\Framework\Setup\SchemaSetupInterface;
use \Magento\Framework\Setup\ModuleContextInterface;
use \Magento\Framework\DB\Ddl\Table;

class InstallSchema implements InstallSchemaInterface
{
    /**
     * {@inheritdoc}
     */
    public function install(SchemaSetupInterface $setup, ModuleContextInterface $context)
    {
        $installer = $setup;

        $installer->startSetup();
        $storeTable = $installer->getTable('taller_customer');

        $table = $installer->getConnection()->newTable(
            $storeTable
        )->addColumn(
            'taller_customer_id',
            Table::TYPE_INTEGER,
            null,
            ['identity' => true, 'nullable' => false, 'primary' => true],
            'ID'
        )->addColumn(
            'store_id',
            Table::TYPE_INTEGER,
            null,
            ['nullable' => false],
            'Store ID'
        )->addColumn(
            'customer_id',
            Table::TYPE_INTEGER,
            null,
            ['nullable' => false],
            'Customer ID'
        )->addColumn(
            'created_at',
            Table::TYPE_TIMESTAMP,
            null,
            ['nullable' => false, 'default' => Table::TIMESTAMP_INIT],
            'Created At'
        )->addColumn(
            'updated_ad',
            Table::TYPE_TIMESTAMP,
            null,
            ['nullable' => false, 'default' => Table::TIMESTAMP_INIT],
            'Updated At'
        );

        $installer->getConnection()->createTable($table);

        $installer->endSetup();
    }
}
