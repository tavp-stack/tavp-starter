{% extends 'layouts/app.volt' %}

{% block content %}
<h1>Blog</h1>

{% if posts is defined and posts|length %}
    {% for post in posts %}
        <article>
            <h2><a href="/posts/{{ post['slug'] }}">{{ post['title'] }}</a></h2>
            {% if post['excerpt'] is defined and post['excerpt'] %}
                <p>{{ post['excerpt'] }}</p>
            {% endif %}
            <small>{{ post['created_at'] }}</small>
        </article>
    {% endfor %}
{% else %}
    <p>No posts yet.</p>
{% endif %}
{% endblock %}
