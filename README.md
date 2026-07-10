# TAVP Starter

A minimal starter template for building apps with the TAVP Stack.

## Quick Start

```bash
composer create-project tavp/starter my-app
cd my-app
cp .env.example .env
composer install
tavp phalcon:install
tavp serve
```

## Structure

```
app/
  Controllers/         # HTTP handlers (extend BaseController)
  Models/              # Database models (extend Tavp\Core\Database\Model)
config/                # Configuration files
database/migrations/   # Schema migrations
public/                # Web root (index.php)
resources/views/       # Volt templates
routes/                # Route definitions
storage/               # Cache, compiled views, logs
```

## Conventions

See [CONVENTIONS.md](https://github.com/tavp-stack/tavp-core/blob/main/CONVENTIONS.md) for the full coding standards.

### Quick Reference

| Element | Convention | Example |
|---------|-----------|---------|
| Classes | PascalCase | `PostController`, `PaymentService` |
| Functions | snake_case, verb+noun | `get_user_by_email()` |
| Variables | snake_case, full words | `$user_email`, `$post_count` |
| Booleans | `is_`, `has_`, `can_` prefix | `$is_authenticated` |
| Tables | plural snake_case | `posts`, `user_sessions` |
| Routes | descriptive params | `/posts/{slug}` not `/posts/{id}` |

### Model Example

```php
<?php
namespace App\Models;

use Tavp\Core\Database\Model;

class Post extends Model
{
    protected string $table = 'posts';
    protected array $fillable = ['title', 'slug', 'body', 'status'];
    protected array $casts = ['published_at' => 'datetime'];
}
```

### Controller Example

```php
<?php
namespace App\Controllers;

use Tavp\Core\Http\Response;

class PostController extends BaseController
{
    public function index(): string
    {
        $posts = $this->service('post')->get_all_published_posts();
        return $this->view('posts.index', ['posts' => $posts]);
    }

    public function show(string $slug): string|Response
    {
        $post = $this->service('post')->get_post_by_slug($slug);
        if ($post === null) {
            return response('404 Not Found', 404);
        }
        return $this->view('posts.show', ['post' => $post]);
    }
}
```

### Route Example

```php
<?php
/** @var \Tavp\Core\Routing\Router $router */

$router->get('/posts', [PostController::class, 'index']);
$router->get('/posts/{slug}', [PostController::class, 'show']);
$router->post('/posts', [PostController::class, 'store']);
```

## Requirements

- PHP 8.3+
- Phalcon 5.16+ (install with `tavp phalcon:install`)

## Learn More

- [TAVP Docs](https://tavp.web.id)
- [Coding Standards](https://tavp.web.id/coding-standards.html)
- [GitHub](https://github.com/tavp-stack)
