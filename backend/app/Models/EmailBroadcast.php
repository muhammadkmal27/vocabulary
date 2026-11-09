<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmailBroadcast extends Model
{
    use HasFactory, HasUuids;

    protected $table = 'email_broadcasts';

    protected $fillable = [
        'sender_email',
        'subject',
        'body',
        'recipient_type',
        'total_recipients',
        'sent_count',
        'failed_count',
        'status',
        'notes',
    ];

    protected $casts = [
        'total_recipients' => 'integer',
        'sent_count'       => 'integer',
        'failed_count'     => 'integer',
    ];
}
