{% extends 'layouts/app.volt' %}

{% block content %}
<article>
    <h1>{{ post['title'] }}</h1>
    <small>{{ post['created_at'] }}</small>
    <div class="body">{{ post['body'] }}</div>
</article>

<a href="/posts">Back to posts</a>
{% endblock %}
