<?php

declare(strict_types=1);

namespace App\Controllers;

use Tavp\Core\Http\Response;

class DashboardController extends BaseController
{
    public function index(): string
    {
        $vehicles = $this->db()->query('SELECT * FROM vehicles ORDER BY name');
        $total_vehicles = count($vehicles);

        $fuel_stats = $this->db()->query('SELECT COALESCE(SUM(total_cost), 0) as total_fuel_cost, COALESCE(SUM(liters), 0) as total_liters FROM fuel_entries')[0] ?? [];
        $maintenance_stats = $this->db()->query('SELECT COALESCE(SUM(cost), 0) as total_maintenance_cost FROM maintenances')[0] ?? [];

        $recent_fuel = $this->db()->query('SELECT f.*, v.name as vehicle_name FROM fuel_entries f JOIN vehicles v ON f.vehicle_id = v.id ORDER BY f.date DESC LIMIT 5');
        $recent_maintenance = $this->db()->query('SELECT m.*, v.name as vehicle_name FROM maintenances m JOIN vehicles v ON m.vehicle_id = v.id ORDER BY m.date DESC LIMIT 5');

        return $this->view('dashboard/index', [
            'total_vehicles' => $total_vehicles,
            'total_fuel_cost' => $fuel_stats['total_fuel_cost'] ?? 0,
            'total_liters' => $fuel_stats['total_liters'] ?? 0,
            'total_maintenance_cost' => $maintenance_stats['total_maintenance_cost'] ?? 0,
            'recent_fuel' => $recent_fuel,
            'recent_maintenance' => $recent_maintenance,
        ]);
    }

    private function db()
    {
        return app('db');
    }
}
