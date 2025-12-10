<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\McpController;

Route::post('/mcp/tools/invoice.create', [McpController::class, 'invoiceCreate']);
Route::post('/mcp/tools/customer.find', [McpController::class, 'customerFind']);

