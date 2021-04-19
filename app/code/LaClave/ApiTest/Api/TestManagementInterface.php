<?php
/**
 * Copyright ©  All rights reserved.
 * See COPYING.txt for license details.
 */
declare(strict_types=1);

namespace LaClave\ApiTest\Api;

interface TestManagementInterface
{

    /**
     * GET for Test api
     * @param string $param
     * @return string
     */
    public function getTest($param);
}

