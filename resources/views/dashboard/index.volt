{% extends 'layouts/app.volt' %}

{% block content %}
<h1 class="text-2xl font-bold mb-6">Dashboard</h1>

<div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
    <div class="rounded-lg bg-gray-900 border border-gray-800 p-5">
        <div class="text-sm text-gray-400 mb-1">Vehicles</div>
        <div class="text-3xl font-bold">{{ total_vehicles }}</div>
    </div>
    <div class="rounded-lg bg-gray-900 border border-gray-800 p-5">
        <div class="text-sm text-gray-400 mb-1">Fuel Cost</div>
        <div class="text-3xl font-bold text-yellow-400">${{ total_fuel_cost | number_format(0) }}</div>
    </div>
    <div class="rounded-lg bg-gray-900 border border-gray-800 p-5">
        <div class="text-sm text-gray-400 mb-1">Total Liters</div>
        <div class="text-3xl font-bold">{{ total_liters | number_format(1) }}L</div>
    </div>
    <div class="rounded-lg bg-gray-900 border border-gray-800 p-5">
        <div class="text-sm text-gray-400 mb-1">Maintenance Cost</div>
        <div class="text-3xl font-bold text-red-400">${{ total_maintenance_cost | number_format(0) }}</div>
    </div>
</div>

<div class="grid md:grid-cols-2 gap-6">
    <div class="rounded-lg bg-gray-900 border border-gray-800 p-6">
        <h2 class="text-lg font-semibold mb-4">Recent Fuel Entries</h2>
        {% if recent_fuel is not empty %}
            <div class="space-y-3">
                {% for entry in recent_fuel %}
                    <div class="flex justify-between items-center text-sm">
                        <div>
                            <span class="text-white">{{ entry['vehicle_name'] }}</span>
                            <span class="text-gray-500 ml-2">{{ entry['date'] }}</span>
                        </div>
                        <div class="text-yellow-400">${{ entry['total_cost'] }}</div>
                    </div>
                {% endfor %}
            </div>
        {% else %}
            <p class="text-gray-500 text-sm">No fuel entries yet.</p>
        {% endif %}
    </div>

    <div class="rounded-lg bg-gray-900 border border-gray-800 p-6">
        <h2 class="text-lg font-semibold mb-4">Recent Maintenance</h2>
        {% if recent_maintenance is not empty %}
            <div class="space-y-3">
                {% for m in recent_maintenance %}
                    <div class="flex justify-between items-center text-sm">
                        <div>
                            <span class="text-white">{{ m['vehicle_name'] }}</span>
                            <span class="text-gray-500 ml-2">{{ m['type'] }}</span>
                        </div>
                        <div class="text-red-400">${{ m['cost'] }}</div>
                    </div>
                {% endfor %}
            </div>
        {% else %}
            <p class="text-gray-500 text-sm">No maintenance records yet.</p>
        {% endif %}
    </div>
</div>
{% endblock %}
