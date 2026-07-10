{% extends 'layouts/app.volt' %}

{% block content %}
<h1 class="text-2xl font-bold mb-6">{{ heading }}</h1>
<p class="text-gray-400 text-sm mb-6">{{ vehicle['name'] | default('') }} — {{ vehicle['license_plate'] | default('') }}</p>

<form method="post" action="{{ action }}" class="space-y-6 max-w-2xl">
    <div class="grid grid-cols-2 gap-4">
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">Date <span class="text-red-400">*</span></label>
            <input type="date" name="date" value="{{ entry['date'] | default('') }}" required
                class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">Odometer (km) <span class="text-red-400">*</span></label>
            <input type="number" name="odometer" value="{{ entry['odometer'] | default('') }}" required
                class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white font-mono focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
        </div>
    </div>

    <div class="grid grid-cols-2 gap-4">
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">Liters <span class="text-red-400">*</span></label>
            <input type="number" step="0.01" name="liters" value="{{ entry['liters'] | default('') }}" required
                class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">Price per Liter <span class="text-red-400">*</span></label>
            <input type="number" step="0.01" name="price_per_liter" value="{{ entry['price_per_liter'] | default('') }}" required
                class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
        </div>
    </div>

    <div class="grid grid-cols-2 gap-4">
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">Fuel Type</label>
            <select name="fuel_type" class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
                {% for f in ['gasoline', 'diesel', 'electric', 'hybrid', 'lpg'] %}
                    <option value="{{ f }}" {% if entry['fuel_type'] | default('') == f %}selected{% endif %}>{{ f | capitalize }}</option>
                {% endfor %}
            </select>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">Station</label>
            <input type="text" name="station" value="{{ entry['station'] | default('') }}" placeholder="Shell, Pertamina, etc."
                class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
        </div>
    </div>

    <div class="flex items-center gap-2">
        <input type="checkbox" name="full_tank" value="1" {% if entry['full_tank'] | default('') %}checked{% endif %}
            class="rounded border-gray-700 bg-gray-900 text-blue-600">
        <label class="text-sm text-gray-300">Full tank</label>
    </div>

    <div class="flex gap-3 pt-4">
        <button type="submit" class="rounded-lg bg-blue-600 px-6 py-3 font-medium text-white hover:bg-blue-700">Save</button>
        <a href="/vehicles/{{ vehicle['id'] | default('') }}/fuel" class="rounded-lg border border-gray-700 px-6 py-3 text-gray-300 hover:bg-gray-800">Cancel</a>
    </div>
</form>
{% endblock %}
