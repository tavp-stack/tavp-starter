<?php

declare(strict_types=1);

require_once __DIR__ . '/../vendor/autoload.php';

use Tavp\Core\Application;
use Tavp\Core\Kernel;
use Tavp\Core\Routing\Router;
use Tavp\Core\View\ViewFactory;

$app = new Application(dirname(__DIR__));
$app->bootstrap();

$router = new Router();

$app->bind('router', fn () => $router);
$app->bind('view', fn () => new ViewFactory(
    $app->getBasePath() . '/resources/views',
    storage_path('compiled/volt')
));

require_once $app->getBasePath() . '/routes/web.php';

$kernel = new Kernel($app, $router);

$method = $_SERVER['REQUEST_METHOD'] ?? 'GET';
$uri = $_SERVER['REQUEST_URI'] ?? '/';

echo $kernel->handle($method, $uri);
