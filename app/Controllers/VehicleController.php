<?php

declare(strict_types=1);

namespace App\Controllers;

use Tavp\Core\Http\Response;

class VehicleController extends BaseController
{
    public function index(): string
    {
        $vehicles = $this->db()->query('SELECT * FROM vehicles ORDER BY name');

        return $this->view('vehicles/index', ['vehicles' => $vehicles]);
    }

    public function create(): string
    {
        return $this->view('vehicles/form', [
            'vehicle' => [],
            'action' => '/vehicles',
            'heading' => 'Add Vehicle',
        ]);
    }

    public function store(): Response
    {
        $data = $this->collect([
            'name', 'type', 'brand', 'model', 'year', 'license_plate', 'fuel_type', 'status',
        ]);

        $this->db()->insert('vehicles', array_merge($data, [
            'status' => $data['status'] ?? 'active',
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]));

        return $this->redirect('/vehicles');
    }

    public function edit(string $id): string
    {
        $vehicle = $this->db()->query('SELECT * FROM vehicles WHERE id = ?', [$id])[0] ?? null;

        return $this->view('vehicles/form', [
            'vehicle' => $vehicle ?? [],
            'action' => '/vehicles/' . $id,
            'heading' => 'Edit Vehicle',
        ]);
    }

    public function update(string $id): Response
    {
        $data = $this->collect([
            'name', 'type', 'brand', 'model', 'year', 'license_plate', 'fuel_type', 'status',
        ]);

        $data['updated_at'] = date('Y-m-d H:i:s');
        $this->db()->update('vehicles', $data, ['id' => $id]);

        return $this->redirect('/vehicles');
    }

    public function destroy(string $id): Response
    {
        $this->db()->delete('fuel_entries', ['vehicle_id' => $id]);
        $this->db()->delete('maintenances', ['vehicle_id' => $id]);
        $this->db()->delete('vehicles', ['id' => $id]);

        return $this->redirect('/vehicles');
    }

    private function db()
    {
        return app('db');
    }

    private function collect(array $fields): array
    {
        $data = [];
        foreach ($fields as $field) {
            $value = $this->request->input($field);
            if ($value !== null) {
                $data[$field] = $value;
            }
        }
        return $data;
    }
}
