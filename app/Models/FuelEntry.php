<?php

declare(strict_types=1);

namespace App\Models;

use Tavp\Core\Database\Model;

class FuelEntry extends Model
{
    protected string $table = 'fuel_entries';
    protected string $primaryKey = 'id';

    protected array $fillable = [
        'vehicle_id',
        'date',
        'odometer',
        'liters',
        'price_per_liter',
        'total_cost',
        'fuel_type',
        'station',
        'full_tank',
    ];

    protected array $casts = [
        'vehicle_id' => 'integer',
        'odometer' => 'integer',
        'liters' => 'float',
        'price_per_liter' => 'float',
        'total_cost' => 'float',
        'full_tank' => 'boolean',
    ];

    protected bool $timestamps = true;
}
