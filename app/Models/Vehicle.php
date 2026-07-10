<?php

declare(strict_types=1);

namespace App\Models;

use Tavp\Core\Database\Model;

class Vehicle extends Model
{
    protected string $table = 'vehicles';
    protected string $primaryKey = 'id';

    protected array $fillable = [
        'name',
        'type',
        'brand',
        'model',
        'year',
        'license_plate',
        'fuel_type',
        'status',
    ];

    protected array $casts = [
        'year' => 'integer',
    ];

    protected bool $timestamps = true;
}
