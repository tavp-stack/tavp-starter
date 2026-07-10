<?php

declare(strict_types=1);

namespace App\Models;

use Tavp\Core\Database\Model;

class Maintenance extends Model
{
    protected string $table = 'maintenances';
    protected string $primaryKey = 'id';

    protected array $fillable = [
        'vehicle_id',
        'date',
        'type',
        'description',
        'cost',
        'odometer',
        'next_service_odometer',
    ];

    protected array $casts = [
        'vehicle_id' => 'integer',
        'odometer' => 'integer',
        'next_service_odometer' => 'integer',
        'cost' => 'float',
    ];

    protected bool $timestamps = true;
}
