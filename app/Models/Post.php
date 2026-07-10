<?php

declare(strict_types=1);

namespace App\Models;

use Tavp\Core\Database\Model;
use Tavp\Core\Database\Relations;

/**
 * A blog post.
 *
 * Convention: Models are nouns, no suffix. $table is plural snake_case.
 */
class Post extends Model
{
    protected string $table = 'posts';
    protected string $primaryKey = 'id';

    protected array $fillable = [
        'title',
        'slug',
        'excerpt',
        'body',
        'status',
        'featured_image',
        'published_at',
    ];

    protected array $casts = [
        'published_at' => 'datetime',
    ];

    protected bool $timestamps = true;
    protected bool $softDeletes = false;

    use Relations;
}
