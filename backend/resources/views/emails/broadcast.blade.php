<!DOCTYPE html>
<html lang="ms">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $emailSubject }}</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background-color: #f4f4f7;
            color: #333333;
            line-height: 1.5;
        }
        .wrapper {
            width: 100%;
            background-color: #f4f4f7;
            padding: 24px 10px;
            box-sizing: border-box;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid #e5e7eb;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
        }
        .header {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            padding: 22px 28px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            color: #ffffff;
            font-size: 20px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }
        .header p {
            margin: 4px 0 0;
            color: rgba(255, 255, 255, 0.9);
            font-size: 13px;
        }
        .content {
            padding: 24px 28px;
            font-size: 15px;
            color: #2d3748;
            line-height: 1.6;
            word-break: break-word;
        }
        .content p {
            margin: 0 0 12px 0;
            padding: 0;
            line-height: 1.6;
            color: #2d3748;
        }
        .content p:last-child {
            margin-bottom: 0;
        }
        .footer {
            background-color: #f9fafb;
            padding: 18px 28px;
            border-top: 1px solid #e5e7eb;
            text-align: center;
            font-size: 12px;
            color: #6b7280;
        }
        .footer a {
            color: #059669;
            text-decoration: none;
            font-weight: 600;
        }
        .footer p {
            margin: 4px 0;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="header">
                <h1>Bijak English</h1>
                <p>Platform Pembelajaran Bahasa Inggeris Interaktif</p>
            </div>
            <div class="content" style="padding: 24px 28px; font-size: 15px; color: #2d3748; line-height: 1.6; word-break: break-word;">
                @php
                    $paragraphs = preg_split('/(\r\n|\n|\r){2,}/', trim($emailBody));
                @endphp
                @foreach ($paragraphs as $para)
                    @php
                        $escaped = e(trim($para));
                        $linked = preg_replace(
                            '/(https?:\/\/[^\s<]+)/i',
                            '<a href="$1" target="_blank" style="color: #059669; text-decoration: underline; font-weight: 600;">$1</a>',
                            $escaped
                        );
                        $formatted = nl2br($linked);
                    @endphp
                    <p style="margin: 0 0 12px 0; padding: 0; line-height: 1.6; color: #2d3748;">
                        {!! $formatted !!}
                    </p>
                @endforeach
            </div>
            <div class="footer">
                <p>Emel ini dihantar secara rasmi daripada <strong>Pasukan Bijak English</strong>.</p>
                <p>Sebarang maklum balas atau pertanyaan boleh terus diemel ke <a href="mailto:saashouse.mail@gmail.com">saashouse.mail@gmail.com</a>.</p>
                <p style="margin-top: 10px;">
                    <a href="https://bijakenglish.imat.my" target="_blank">Layari Bijak English</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
