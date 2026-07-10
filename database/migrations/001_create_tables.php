<?php

declare(strict_types=1);

/**
 * Migration: Create vehicles table.
 */
return [
    'up' => function ($db) {
        $db->execute("CREATE TABLE IF NOT EXISTS vehicles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(255) NOT NULL,
            type VARCHAR(50) DEFAULT 'car',
            brand VARCHAR(100),
            model VARCHAR(100),
            year INTEGER,
            license_plate VARCHAR(20),
            fuel_type VARCHAR(50) DEFAULT 'gasoline',
            status VARCHAR(20) DEFAULT 'active',
            created_at DATETIME,
            updated_at DATETIME
        )");

        $db->execute("CREATE TABLE IF NOT EXISTS fuel_entries (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            vehicle_id INTEGER NOT NULL,
            date DATE NOT NULL,
            odometer INTEGER,
            liters REAL,
            price_per_liter REAL,
            total_cost REAL,
            fuel_type VARCHAR(50),
            station VARCHAR(100),
            full_tank INTEGER DEFAULT 0,
            created_at DATETIME,
            updated_at DATETIME
        )");

        $db->execute("CREATE TABLE IF NOT EXISTS maintenances (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            vehicle_id INTEGER NOT NULL,
            date DATE NOT NULL,
            type VARCHAR(100),
            description TEXT,
            cost REAL,
            odometer INTEGER,
            next_service_odometer INTEGER,
            created_at DATETIME,
            updated_at DATETIME
        )");
    },
    'down' => function ($db) {
        $db->execute("DROP TABLE IF EXISTS maintenances");
        $db->execute("DROP TABLE IF EXISTS fuel_entries");
        $db->execute("DROP TABLE IF EXISTS vehicles");
    },
];
