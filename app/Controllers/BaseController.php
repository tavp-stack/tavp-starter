<?php

declare(strict_types=1);

namespace App\Controllers;

use Tavp\Core\Controllers\BaseController;

/**
 * Base controller for all app controllers.
 *
 * Convention: Provides view rendering, redirects, and service access.
 */
abstract class BaseController extends BaseController
{
    /**
     * Render a Volt template with data.
     *
     * @param array<string,mixed> $data
     */
    protected function view(string $template, array $data = []): string
    {
        return view($template, $data);
    }

    /**
     * Redirect to a path.
     */
    protected function redirect(string $path, int $status = 302): \Tavp\Core\Http\Response
    {
        return redirect($path, $status);
    }

    /**
     * Get a service from the container.
     */
    protected function service(string $name): mixed
    {
        return app()->getService($name);
    }
}
