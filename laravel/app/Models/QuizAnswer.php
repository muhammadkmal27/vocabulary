<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class QuizAnswer extends Model
{
    use HasUuids;

    protected $fillable = [
        'session_id',
        'sentence_id',
        'user_answer',
        'is_correct',
        'revealed',
        'answered_at'
    ];

    public $timestamps = false;

    protected function casts(): array
    {
        return [
            'is_correct' => 'boolean',
            'revealed' => 'boolean',
            'answered_at' => 'datetime'
        ];
    }

    public function session()
    {
        return $this->belongsTo(QuizSession::class, 'session_id');
    }

    public function sentence()
    {
        return $this->belongsTo(Sentence::class, 'sentence_id');
    }
}
