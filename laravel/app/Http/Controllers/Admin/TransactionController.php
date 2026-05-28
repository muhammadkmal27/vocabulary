<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Illuminate\Http\Request;
class TransactionController extends Controller
{
    public function index() { return Transaction::with('user')->latest()->paginate(20); }
    public function show(Transaction $transaction) { return $transaction->load('user'); }
}
