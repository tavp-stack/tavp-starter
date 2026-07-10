{% extends 'layouts/app.volt' %}

{% block content %}
<h1>{{ heading }}</h1>

<form method="post" action="{{ action }}">
    <div>
        <label for="title">Title</label>
        <input type="text" name="title" id="title" value="{{ post['title'] | default('') }}" required>
    </div>
    <div>
        <label for="slug">Slug</label>
        <input type="text" name="slug" id="slug" value="{{ post['slug'] | default('') }}">
    </div>
    <div>
        <label for="body">Body</label>
        <textarea name="body" id="body" rows="10">{{ post['body'] | default('') }}</textarea>
    </div>
    <button type="submit">Save</button>
</form>
{% endblock %}
