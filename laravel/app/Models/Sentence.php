<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class Sentence extends Model { use HasUuids; protected $fillable = ['level_id','source_text','target_text','tags','difficulty','order']; protected function casts(): array { return ['tags'=>'array','difficulty'=>'integer']; } public function level() { return $this->belongsTo(Level::class); } }
