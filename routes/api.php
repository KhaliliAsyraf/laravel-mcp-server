<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MCPController;

Route::post('/mcp/tools/invoice.create', [MCPController::class, 'invoiceCreate'])->name('invoice.create');
Route::post('/mcp/tools/customer.find', [MCPController::class, 'customerFind'])->name('customer.find');

