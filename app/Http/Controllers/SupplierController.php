<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Supplier;

class SupplierController extends Controller
{
    public function index()
    {
        $suppliers = Supplier::orderBy('created_at', 'DESC')->get();
        return view ('suppliers.index', compact('suppliers'));
    }

    public function create()
    {
        return view('suppliers.create');
    }

    public function save(Request $request)
    {
        $this->validate($request, [
            'nama' => 'required|string|max:100',
            'alamat' => 'required|string',
            'phone'  => 'required|string',
        ]);

        try {
            $supplier = Supplier::create([
                'nama' => $request->nama,
                'alamat' => $request->alamat,
                'phone'  => $request->phone,
            ]);
           return redirect('/supplier')->with(['success' => '<strong>' . $supplier->nama . '</strong> Telah disimpan']);
        }catch(\Exception $e) {
            return redirect('/supplier/new')->with(['error' => $e->getMessage()]);
        }
    }

    public function edit($id)
    {
        $supplier = Supplier::find($id);
        return view('suppliers.edit', compact('supplier'));
    }

    public function update(Request $request, $id)
    {
        $supplier = Supplier::find($id);
        $supplier->update([
            'nama' => $request->nama,
            'alamat' => $request->alamat,
            'phone' => $request->phone,
        ]);
        return redirect('/supplier')->with(['success' => '<strong>' . $supplier->nama . '</strong> Diperbaharui']);
    }

    public function destroy($id)
    {
        $supplier = Supplier::find($id);
        $supplier->delete();
        return redirect('/supplier')->with(['success' => '<strong>' . $supplier->nama . '</strong> Dihapus']);
    }
}

