<?php
/**
 * Copyright ©  All rights reserved.
 * See COPYING.txt for license details.
 */
declare(strict_types=1);

namespace LaClave\ProductImport\Api;

interface ImportManagementInterface
{

    /**
     * POST for Import api
     * @param string $param
     * @return string
     */
    public function postImport($param)
    {
        return 'hello';
    }
}

