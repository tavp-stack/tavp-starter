<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ page_title | default('My TAVP App') }}</title>
    <link rel="stylesheet" href="/assets/app.css">
</head>
<body>
    <nav>
        <a href="/">Home</a>
        <a href="/posts">Blog</a>
        <a href="/about">About</a>
    </nav>

    <main>
        {% block content %}{% endblock %}
    </main>

    <footer>
        <p>&copy; {{ 'now' | date('Y') }} My TAVP App</p>
    </footer>
</body>
</html>
