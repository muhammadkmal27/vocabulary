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
            line-height: 1.6;
        }
        .wrapper {
            width: 100%;
            background-color: #f4f4f7;
            padding: 30px 10px;
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
            padding: 24px 30px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            color: #ffffff;
            font-size: 22px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }
        .header p {
            margin: 4px 0 0;
            color: rgba(255, 255, 255, 0.9);
            font-size: 13px;
        }
        .content {
            padding: 32px 30px;
            font-size: 15px;
            color: #2d3748;
            white-space: pre-line;
            word-break: break-word;
        }
        .footer {
            background-color: #f9fafb;
            padding: 20px 30px;
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
            <div class="content">{!! nl2br(e($emailBody)) !!}</div>
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
