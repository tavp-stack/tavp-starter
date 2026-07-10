<?php

declare(strict_types=1);

use App\Controllers\PostController;

/**
 * Application routes.
 *
 * Convention: Resource routes for CRUD, closures for simple pages.
 * $router is provided by the host application when this file is required.
 */

/** @var \Tavp\Core\Routing\Router $router */
if (!isset($router)) {
    return;
}

// --- Blog posts (resource routes) ---
$router->get('/posts', [PostController::class, 'index']);
$router->get('/posts/create', [PostController::class, 'create']);
$router->post('/posts', [PostController::class, 'store']);
$router->get('/posts/{slug}', [PostController::class, 'show']);

// --- Static pages ---
$router->get('/about', function () {
    return view('pages.about');
});

$router->get('/contact', function () {
    return view('pages.contact');
});

// --- Home ---
$router->get('/', function () {
    return view('home');
});
