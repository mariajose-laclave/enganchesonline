<?php
/**
 * Copyright © Magento, Inc. All rights reserved.
 * See COPYING.txt for license details.
 */

/**
 * Code standard by : RH
 */
namespace RH\HelloWorld\Setup;

use Magento\Eav\Model\Entity\Attribute\ScopedAttributeInterface;
use Magento\Eav\Setup\EavSetup;

class HelloWorldSetup extends EavSetup
{

    /**
     * Entity type for Hello World EAV attributes
     */
    const ENTITY_TYPE_CODE = 'rh_helloworld_helloworld';

    /**
     * EAV Entity type for Hello World EAV attributes
     */
    const EAV_ENTITY_TYPE_CODE = 'rh_helloworld';

    /**
     * Retrieve Entity Attributes
     *
     * @return array
     * @SuppressWarnings(PHPMD.ExcessiveMethodLength)
     */
    protected function getAttributes()
    {
        $attributes = [];

        $attributes['main_title'] = [
            'group' => 'General',
            'type' => 'varchar',
            'label' => 'Main Title',
            'input' => 'text',
            'global' => ScopedAttributeInterface::SCOPE_STORE,
            'required' => '1',
            'user_defined' => false,
            'default' => '',
            'unique' => false,
            'position' => '10',
            'note' => '',
            'visible' => '1',
            'wysiwyg_enabled' => '0',
        ];

        // Add your more entity attributes here...

        return $attributes;
    }

    /**
     * Retrieve default entities
     *
     * @return array
     */
    public function getDefaultEntities()
    {
        $entities = [
            self::ENTITY_TYPE_CODE => [
                'entity_model' => 'RH\HelloWorld\Model\ResourceModel\HelloWorld',
                'attribute_model' => 'RH\HelloWorld\Model\ResourceModel\Eav\Attribute',
                'table' => self::ENTITY_TYPE_CODE,
                'increment_model' => null,
                'additional_attribute_table' => 'rh_helloworld_eav_attribute',
                'entity_attribute_collection' => 'RH\HelloWorld\Model\ResourceModel\Attribute\Collection',
                'attributes' => $this->getAttributes(),
            ],
        ];

        return $entities;
    }
}