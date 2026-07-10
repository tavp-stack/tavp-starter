{% extends 'layouts/app.volt' %}

{% block content %}
<div class="flex items-center justify-between mb-6">
    <h1 class="text-2xl font-bold">Vehicles</h1>
    <a href="/vehicles/create" class="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700">+ Add Vehicle</a>
</div>

<div class="rounded-lg bg-gray-900 border border-gray-800 overflow-hidden">
    <table class="w-full">
        <thead class="bg-gray-800">
            <tr>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Name</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Type</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">License</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Fuel</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Status</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase">Actions</th>
            </tr>
        </thead>
        <tbody class="divide-y divide-gray-800">
            {% for v in vehicles %}
                <tr class="hover:bg-gray-800/50">
                    <td class="px-6 py-4 text-sm font-medium text-white">{{ v['name'] }}</td>
                    <td class="px-6 py-4 text-sm text-gray-300">{{ v['type'] }}</td>
                    <td class="px-6 py-4 text-sm text-gray-300 font-mono">{{ v['license_plate'] }}</td>
                    <td class="px-6 py-4 text-sm text-gray-300">{{ v['fuel_type'] }}</td>
                    <td class="px-6 py-4">
                        <span class="rounded-full px-2 py-1 text-xs {% if v['status'] == 'active' %}bg-green-900 text-green-300{% else %}bg-gray-700 text-gray-400{% endif %}">{{ v['status'] }}</span>
                    </td>
                    <td class="px-6 py-4 text-sm">
                        <a href="/vehicles/{{ v['id'] }}/fuel" class="text-yellow-400 hover:underline mr-3">Fuel</a>
                        <a href="/vehicles/{{ v['id'] }}/edit" class="text-blue-400 hover:underline mr-3">Edit</a>
                        <form method="post" action="/vehicles/{{ v['id'] }}/delete" class="inline">
                            <button type="submit" class="text-red-400 hover:underline" onclick="return confirm('Delete?')">Delete</button>
                        </form>
                    </td>
                </tr>
            {% endfor %}
            {% if vehicles is empty %}
                <tr>
                    <td colspan="6" class="px-6 py-12 text-center text-gray-500">No vehicles yet. Add your first vehicle!</td>
                </tr>
            {% endif %}
        </tbody>
    </table>
</div>
{% endblock %}
