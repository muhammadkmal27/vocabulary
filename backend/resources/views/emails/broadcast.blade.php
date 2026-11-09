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
            font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif;
            background-color: #f8f9fa;
            color: #202124;
            line-height: 1.55;
            -webkit-font-smoothing: antialiased;
        }
        .wrapper {
            width: 100%;
            background-color: #f8f9fa;
            padding: 12px 6px;
            box-sizing: border-box;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #e0e0e0;
            box-shadow: 0 1px 3px rgba(60, 64, 67, 0.08);
        }
        .header {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            padding: 20px 20px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            color: #ffffff;
            font-size: 19px;
            font-weight: 700;
            letter-spacing: -0.3px;
        }
        .header p {
            margin: 4px 0 0;
            color: rgba(255, 255, 255, 0.92);
            font-size: 12.5px;
        }
        .content {
            padding: 24px 20px;
            font-size: 14px;
            color: #202124;
            line-height: 1.55;
            word-break: break-word;
        }
        .content p {
            margin: 0 0 14px 0;
            padding: 0;
            font-size: 14px;
            line-height: 1.55;
            color: #202124;
        }
        .content p:last-child {
            margin-bottom: 0;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 18px 20px;
            border-top: 1px solid #e8eaed;
            text-align: center;
            font-size: 12px;
            color: #5f6368;
            line-height: 1.5;
        }
        .footer a {
            color: #059669;
            text-decoration: underline;
            font-weight: 500;
        }
        .footer p {
            margin: 4px 0;
        }
        @media only screen and (max-width: 600px) {
            .wrapper {
                padding: 4px 0 !important;
            }
            .container {
                border-radius: 6px !important;
                border-left: none !important;
                border-right: none !important;
            }
            .content {
                padding: 20px 16px !important;
            }
            .header {
                padding: 18px 16px !important;
            }
            .footer {
                padding: 16px 16px !important;
            }
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
            <div class="content" style="padding: 22px 18px; font-size: 14px; color: #202124; line-height: 1.55; font-family: Roboto, Helvetica, Arial, sans-serif; word-break: break-word;">
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
                    <p style="margin: 0 0 14px 0; padding: 0; font-size: 14px; line-height: 1.55; color: #202124; font-family: Roboto, Helvetica, Arial, sans-serif;">
                        {!! $formatted !!}
                    </p>
                @endforeach
            </div>
            <div class="footer">
                <p>Emel ini dihantar secara rasmi daripada <strong>Pasukan Bijak English</strong>.</p>
                <p>Sebarang maklum balas atau pertanyaan boleh terus diemel ke <a href="mailto:saashouse.mail@gmail.com">saashouse.mail@gmail.com</a>.</p>
                <p style="margin-top: 8px;">
                    <a href="https://bijakenglish.imat.my" target="_blank">Layari Bijak English</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
