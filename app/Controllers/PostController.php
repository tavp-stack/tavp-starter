<?php

declare(strict_types=1);

namespace App\Controllers;

use Tavp\Core\Http\Response;

/**
 * Blog post controller.
 *
 * Convention: Controller suffix, snake_case methods, verb + noun.
 */
class PostController extends BaseController
{
    /**
     * List all published posts.
     * GET /posts
     */
    public function index(): string
    {
        $posts = $this->service('post')->get_all_published_posts();

        return $this->view('posts.index', ['posts' => $posts]);
    }

    /**
     * Show a single post by slug.
     * GET /posts/{slug}
     */
    public function show(string $slug): string|Response
    {
        $post = $this->service('post')->get_post_by_slug($slug);

        if ($post === null) {
            return response('404 Not Found', 404);
        }

        return $this->view('posts.show', ['post' => $post]);
    }

    /**
     * Show the create form.
     * GET /posts/create
     */
    public function create(): string
    {
        return $this->view('posts.form', [
            'post' => [],
            'action' => '/posts',
            'heading' => 'New Post',
        ]);
    }

    /**
     * Store a new post.
     * POST /posts
     */
    public function store(): Response
    {
        $data = [
            'title' => (string) $this->request->input('title', ''),
            'slug' => (string) $this->request->input('slug', ''),
            'body' => (string) $this->request->input('body', ''),
            'status' => 'draft',
        ];

        $this->service('post')->create_new_post($data);

        return $this->redirect('/posts');
    }
}
