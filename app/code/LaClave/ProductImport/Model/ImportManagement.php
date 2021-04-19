<?php
/**
 * Copyright ©  All rights reserved.
 * See COPYING.txt for license details.
 */
declare(strict_types=1);

namespace LaClave\ProductImport\Model;

class ImportManagement implements \LaClave\ProductImport\Api\ImportManagementInterface
{

    /**
     * {@inheritdoc}
     */
    public function postImport($param)
    {
        return 'hello api POST return the $param ' . $param;
    }
}

