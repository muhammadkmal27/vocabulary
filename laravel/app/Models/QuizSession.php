<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class QuizSession extends Model
{
    use HasUuids;

    protected $fillable = [
        'user_id',
        'language_id',
        'level_id',
        'status',
        'total_questions',
        'correct_count',
        'started_at',
        'completed_at'
    ];

    protected function casts(): array
    {
        return [
            'started_at' => 'datetime',
            'completed_at' => 'datetime',
            'total_questions' => 'integer',
            'correct_count' => 'integer'
        ];
    }

    public function answers()
    {
        return $this->hasMany(QuizAnswer::class, 'session_id');
    }

    public function level()
    {
        return $this->belongsTo(Level::class, 'level_id');
    }

    public function language()
    {
        return $this->belongsTo(Language::class, 'language_id');
    }
}
