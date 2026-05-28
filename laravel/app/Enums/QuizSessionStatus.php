<?php

namespace App\Enums;

enum QuizSessionStatus: string
{
    case InProgress = 'in_progress';
    case Completed = 'completed';
    case Repeated = 'repeated';
}
