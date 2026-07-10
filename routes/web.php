<?php

declare(strict_types=1);

use App\Controllers\DashboardController;
use App\Controllers\VehicleController;
use App\Controllers\FuelController;

/** @var \Tavp\Core\Routing\Router $router */
if (!isset($router)) {
    return;
}

// Dashboard
$router->get('/', [DashboardController::class, 'index']);

// Vehicles
$router->get('/vehicles', [VehicleController::class, 'index']);
$router->get('/vehicles/create', [VehicleController::class, 'create']);
$router->post('/vehicles', [VehicleController::class, 'store']);
$router->get('/vehicles/{id}/edit', [VehicleController::class, 'edit']);
$router->post('/vehicles/{id}', [VehicleController::class, 'update']);
$router->post('/vehicles/{id}/delete', [VehicleController::class, 'destroy']);

// Fuel entries
$router->get('/vehicles/{vehicleId}/fuel', [FuelController::class, 'index']);
$router->get('/vehicles/{vehicleId}/fuel/create', [FuelController::class, 'create']);
$router->post('/vehicles/{vehicleId}/fuel', [FuelController::class, 'store']);
$router->post('/vehicles/{vehicleId}/fuel/{entryId}/delete', [FuelController::class, 'destroy']);
