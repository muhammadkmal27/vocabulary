<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Language;
class LanguageController extends Controller
{
    public function index() { return Language::where('is_active',true)->get(['id','code','name','flag']); }
}
