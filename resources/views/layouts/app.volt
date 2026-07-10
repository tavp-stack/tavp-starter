<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ page_title | default('Dashboard') }} — Fleet Log</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gray-950 text-gray-100">
    <div class="flex min-h-screen">
        <aside class="w-64 bg-gray-900 border-r border-gray-800 flex flex-col">
            <div class="p-6 border-b border-gray-800">
                <a href="/" class="text-lg font-bold text-white">Fleet Log</a>
                <div class="text-xs text-gray-500 mt-1">Vehicle Logbook</div>
            </div>
            <nav class="flex-1 p-4 space-y-1">
                <a href="/" class="flex items-center gap-3 rounded-lg px-3 py-2 text-sm text-gray-300 hover:bg-gray-800 hover:text-white">Dashboard</a>
                <a href="/vehicles" class="flex items-center gap-3 rounded-lg px-3 py-2 text-sm text-gray-300 hover:bg-gray-800 hover:text-white">Vehicles</a>
            </nav>
            <div class="p-4 border-t border-gray-800 text-xs text-gray-600">
                Powered by TAVP Stack
            </div>
        </aside>
        <main class="flex-1 p-8">
            {% block content %}{% endblock %}
        </main>
    </div>
</body>
</html>
