{% extends 'layouts/app.volt' %}

{% block content %}
<h1 class="text-2xl font-bold mb-6">{{ heading }}</h1>

<form method="post" action="{{ action }}" class="space-y-6 max-w-2xl">
    <div>
        <label class="block text-sm font-medium text-gray-300 mb-1">Name <span class="text-red-400">*</span></label>
        <input type="text" name="name" value="{{ vehicle['name'] | default('') }}" required
            class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
    </div>

    <div class="grid grid-cols-2 gap-4">
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">Type</label>
            <select name="type" class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
                {% for t in ['motorcycle', 'car', 'truck', 'van', 'bus'] %}
                    <option value="{{ t }}" {% if vehicle['type'] | default('') == t %}selected{% endif %}>{{ t | capitalize }}</option>
                {% endfor %}
            </select>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">Fuel Type</label>
            <select name="fuel_type" class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
                {% for f in ['gasoline', 'diesel', 'electric', 'hybrid', 'lpg'] %}
                    <option value="{{ f }}" {% if vehicle['fuel_type'] | default('') == f %}selected{% endif %}>{{ f | capitalize }}</option>
                {% endfor %}
            </select>
        </div>
    </div>

    <div class="grid grid-cols-2 gap-4">
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">Brand</label>
            <input type="text" name="brand" value="{{ vehicle['brand'] | default('') }}"
                class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">Model</label>
            <input type="text" name="model" value="{{ vehicle['model'] | default('') }}"
                class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
        </div>
    </div>

    <div class="grid grid-cols-2 gap-4">
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">Year</label>
            <input type="number" name="year" value="{{ vehicle['year'] | default('') }}"
                class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-1">License Plate</label>
            <input type="text" name="license_plate" value="{{ vehicle['license_plate'] | default('') }}"
                class="w-full rounded-lg border border-gray-700 bg-gray-900 px-4 py-3 text-white font-mono focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500">
        </div>
    </div>

    <div class="flex gap-3 pt-4">
        <button type="submit" class="rounded-lg bg-blue-600 px-6 py-3 font-medium text-white hover:bg-blue-700">Save</button>
        <a href="/vehicles" class="rounded-lg border border-gray-700 px-6 py-3 text-gray-300 hover:bg-gray-800">Cancel</a>
    </div>
</form>
{% endblock %}
