<?php

declare(strict_types=1);

namespace App\Controllers;

use Tavp\Core\Http\Response;

class FuelController extends BaseController
{
    public function index(string $vehicleId): string
    {
        $vehicle = $this->db()->query('SELECT * FROM vehicles WHERE id = ?', [$vehicleId])[0] ?? null;
        $entries = $this->db()->query(
            'SELECT * FROM fuel_entries WHERE vehicle_id = ? ORDER BY date DESC, id DESC',
            [$vehicleId]
        );

        return $this->view('vehicles/fuel', [
            'vehicle' => $vehicle ?? [],
            'entries' => $entries,
        ]);
    }

    public function create(string $vehicleId): string
    {
        $vehicle = $this->db()->query('SELECT * FROM vehicles WHERE id = ?', [$vehicleId])[0] ?? null;

        return $this->view('vehicles/fuel_form', [
            'vehicle' => $vehicle ?? [],
            'entry' => [],
            'action' => '/vehicles/' . $vehicleId . '/fuel',
            'heading' => 'Add Fuel Entry',
        ]);
    }

    public function store(string $vehicleId): Response
    {
        $data = $this->collect(['date', 'odometer', 'liters', 'price_per_liter', 'fuel_type', 'station', 'full_tank']);

        $data['vehicle_id'] = (int) $vehicleId;
        $data['liters'] = (float) ($data['liters'] ?? 0);
        $data['price_per_liter'] = (float) ($data['price_per_liter'] ?? 0);
        $data['total_cost'] = $data['liters'] * $data['price_per_liter'];
        $data['full_tank'] = isset($data['full_tank']) ? 1 : 0;
        $data['created_at'] = date('Y-m-d H:i:s');
        $data['updated_at'] = date('Y-m-d H:i:s');

        $this->db()->insert('fuel_entries', $data);

        return $this->redirect('/vehicles/' . $vehicleId . '/fuel');
    }

    public function destroy(string $vehicleId, string $entryId): Response
    {
        $this->db()->delete('fuel_entries', ['id' => $entryId, 'vehicle_id' => $vehicleId]);

        return $this->redirect('/vehicles/' . $vehicleId . '/fuel');
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
