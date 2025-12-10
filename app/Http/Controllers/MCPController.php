<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Invoice;
use App\Models\Customer;

class MCPController extends Controller
{
    public function invoiceCreate(Request $request)
    {
        $validated = $request->validate([
            'customer_name' => 'required|string',
            'amount' => 'required|numeric'
        ]);

        $invoice = Invoice::create([
            'customer_name' => $validated['customer_name'],
            'amount' => $validated['amount'],
        ]);

        return response()->json([
            "success" => true,
            "tool" => "invoice.create",
            "data" => $invoice
        ]);
    }

    public function customerFind(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string'
        ]);

        $customer = Customer::where('name', $validated['name'])->first();

        return response()->json([
            "success" => true,
            "tool" => "customer.find",
            "data" => $customer
        ]);
    }
}
