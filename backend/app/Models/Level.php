<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class Level extends Model
{
    use HasUuids;

    protected $fillable = ['language_id', 'order', 'name'];

    public function language()
    {
        return $this->belongsTo(Language::class);
    }

    public function sentences()
    {
        return $this->hasMany(Sentence::class);
    }
}
