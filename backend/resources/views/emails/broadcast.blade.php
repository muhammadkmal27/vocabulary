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
            background-color: #ffffff;
            font-family: Roboto, -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif;
            color: #202124;
            line-height: 1.6;
            -webkit-font-smoothing: antialiased;
        }
        .wrapper {
            width: 100%;
            background-color: #ffffff;
            padding: 16px 0;
            box-sizing: border-box;
        }
        .container {
            max-width: 580px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #eaedf0;
        }
        .logo-header {
            text-align: center;
            padding: 24px 20px 16px 20px;
        }
        .divider {
            height: 1px;
            background-color: #f1f3f4;
            margin: 0 0 20px 0;
        }
        .content {
            padding: 0 24px 24px 24px;
            font-size: 14px;
            color: #202124;
            line-height: 1.6;
            word-break: break-word;
        }
        .content p {
            margin: 0 0 16px 0;
            padding: 0;
            font-size: 14px;
            line-height: 1.6;
            color: #202124;
        }
        .content p:last-child {
            margin-bottom: 0;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 20px 24px;
            border-top: 1px solid #e8eaed;
            text-align: center;
            font-size: 12px;
            color: #5f6368;
            line-height: 1.55;
        }
        .footer a {
            color: #059669;
            text-decoration: underline;
            font-weight: 500;
        }
        .footer p {
            margin: 0 0 6px 0;
        }
        .footer p:last-child {
            margin-bottom: 0;
        }
        @media only screen and (max-width: 600px) {
            .wrapper {
                padding: 0 !important;
            }
            .container {
                border-radius: 0 !important;
                border: none !important;
            }
            .logo-header {
                padding: 20px 16px 14px 16px !important;
            }
            .content {
                padding: 0 16px 20px 16px !important;
            }
            .footer {
                padding: 18px 16px !important;
            }
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <!-- HEADER / LOGO (Clean Shopee-style on pure white) -->
            <div class="logo-header">
                <table align="center" border="0" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
                    <tr>
                        <td style="vertical-align: middle; padding-right: 8px;">
                            <div style="width: 32px; height: 32px; background: linear-gradient(135deg, #10b981 0%, #059669 100%); border-radius: 8px; text-align: center; line-height: 32px; font-size: 16px; color: #ffffff;">
                                ✨
                            </div>
                        </td>
                        <td style="vertical-align: middle;">
                            <span style="font-size: 21px; font-weight: 800; color: #111827; letter-spacing: -0.4px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;">
                                Bijak <span style="color: #059669;">English</span>
                            </span>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="divider"></div>

            <!-- CONTENT BODY (Spacious, Clean Typography) -->
            <div class="content" style="padding: 0 20px 24px 20px; font-size: 14px; color: #202124; line-height: 1.6; font-family: Roboto, -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif; word-break: break-word;">
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
                    <p style="margin: 0 0 16px 0; padding: 0; font-size: 14px; line-height: 1.6; color: #202124; font-family: Roboto, -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif;">
                        {!! $formatted !!}
                    </p>
                @endforeach
            </div>

            <!-- FOOTER (Versi Asal yang digemari Tuan: Kotak Kelabu Lembut Berpusat) -->
            <div class="footer" style="background-color: #f8f9fa; padding: 20px 20px; border-top: 1px solid #e8eaed; text-align: center; font-size: 12px; color: #5f6368; line-height: 1.55; font-family: Roboto, -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif;">
                <p style="margin: 0 0 6px 0;">Emel ini dihantar secara rasmi daripada <strong>Pasukan Bijak English</strong>.</p>
                <p style="margin: 0 0 10px 0;">Sebarang maklum balas atau pertanyaan boleh terus diemel ke <a href="mailto:saashouse.mail@gmail.com" style="color: #059669; text-decoration: underline;">saashouse.mail@gmail.com</a>.</p>
                <p style="margin: 0;">
                    <a href="https://bijakenglish.imat.my" target="_blank" style="color: #059669; text-decoration: underline; font-weight: 600;">Layari Bijak English</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
