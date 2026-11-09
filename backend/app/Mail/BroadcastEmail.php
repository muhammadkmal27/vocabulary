<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Address;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Mail\Mailables\Headers;
use Illuminate\Queue\SerializesModels;

class BroadcastEmail extends Mailable
{
    use Queueable, SerializesModels;

    public function __construct(
        public string $emailSubject,
        public string $emailBody,
        public ?string $recipientName = null
    ) {}

    public function envelope(): Envelope
    {
        return new Envelope(
            from: new Address('saashouse.mail@gmail.com', 'Pasukan Bijak English'),
            replyTo: [new Address('saashouse.mail@gmail.com', 'Pasukan Bijak English')],
            subject: $this->emailSubject,
        );
    }

    public function headers(): Headers
    {
        return new Headers(
            text: [
                'X-Entity-Ref-ID' => uniqid('msg_', true),
            ],
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails.broadcast',
        );
    }
}
