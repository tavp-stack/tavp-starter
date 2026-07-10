{% extends 'layouts/app.volt' %}

{% block content %}
<div class="flex items-center justify-between mb-6">
    <div>
        <h1 class="text-2xl font-bold">Fuel Log</h1>
        <p class="text-gray-400 text-sm mt-1">{{ vehicle['name'] | default('') }} — {{ vehicle['license_plate'] | default('') }}</p>
    </div>
    <a href="/vehicles/{{ vehicle['id'] | default('') }}/fuel/create" class="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700">+ Add Entry</a>
</div>

<div class="rounded-lg bg-gray-900 border border-gray-800 overflow-hidden">
    <table class="w-full">
        <thead class="bg-gray-800">
            <tr>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Date</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Odometer</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Liters</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Price/L</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Total</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Station</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Actions</th>
            </tr>
        </thead>
        <tbody class="divide-y divide-gray-800">
            {% for e in entries %}
                <tr class="hover:bg-gray-800/50">
                    <td class="px-6 py-4 text-sm text-gray-300">{{ e['date'] }}</td>
                    <td class="px-6 py-4 text-sm text-gray-300 font-mono">{{ e['odometer'] }} km</td>
                    <td class="px-6 py-4 text-sm text-gray-300">{{ e['liters'] }}L</td>
                    <td class="px-6 py-4 text-sm text-gray-300">${{ e['price_per_liter'] }}</td>
                    <td class="px-6 py-4 text-sm text-yellow-400 font-medium">${{ e['total_cost'] }}</td>
                    <td class="px-6 py-4 text-sm text-gray-300">{{ e['station'] | default('-') }}</td>
                    <td class="px-6 py-4 text-sm">
                        <form method="post" action="/vehicles/{{ vehicle['id'] | default('') }}/fuel/{{ e['id'] }}/delete" class="inline">
                            <button type="submit" class="text-red-400 hover:underline" onclick="return confirm('Delete?')">Delete</button>
                        </form>
                    </td>
                </tr>
            {% endfor %}
            {% if entries is empty %}
                <tr>
                    <td colspan="7" class="px-6 py-12 text-center text-gray-500">No fuel entries yet.</td>
                </tr>
            {% endif %}
        </tbody>
    </table>
</div>

<a href="/vehicles" class="inline-block mt-4 text-sm text-gray-400 hover:text-white">Back to vehicles</a>
{% endblock %}
