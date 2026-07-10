# Fleet Log — Vehicle Logbook

A demo app built with TAVP Stack. Track fuel, maintenance, and costs for your vehicles.

## Features

- **Vehicle management** — add, edit, delete vehicles (motorcycle, car, truck, etc.)
- **Fuel tracking** — log fuel entries with odometer, liters, price, station
- **Maintenance tracking** — log maintenance with cost and next service reminder
- **Dashboard** — overview stats (total cost, liters, vehicles)
- **Dark UI** — modern dark theme with Tailwind CSS

## Quick Start

```bash
composer create-project tavp/starter fleet-log
cd fleet-log
cp .env.example .env
tavp phalcon:install
tavp migrate
tavp serve
```

Open http://localhost:8000

## Tech Stack

- **PHP 8.3** + **Phalcon 5.16** (Volt template engine)
- **Tailwind CSS** (dark theme)
- **SQLite** (default, works out of the box)
- **TAVP Core** — routing, ORM, helpers

## Convention Examples

This app demonstrates TAVP conventions:

- `App\Models\Vehicle` — PascalCase model, snake_case table
- `App\Controllers\VehicleController` — Controller suffix, snake_case methods
- `get_all_vehicles()` — verb + noun naming
- `$vehicle_name` — full words, no abbreviations

See [CONVENTIONS.md](https://github.com/tavp-stack/tavp-core/blob/main/CONVENTIONS.md)

## Structure

```
app/
  Controllers/         # DashboardController, VehicleController, FuelController
  Models/              # Vehicle, FuelEntry, Maintenance
config/                # app.php, database.php
database/migrations/   # 001_create_tables.php
resources/views/       # Volt templates (dark theme)
routes/web.php         # Resource routes
```

## Requirements

- PHP 8.3+
- Phalcon 5.16+ (install with `tavp phalcon:install`)

## License

MIT
