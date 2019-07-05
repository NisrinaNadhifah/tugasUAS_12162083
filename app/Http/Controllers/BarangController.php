<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Barang;

class BarangController extends Controller
{
    public function index()
    {
        $barangs = Barang::orderBy('created_at', 'DESC')->get();
        return view('barangs.index', compact('barangs'));
    }

    public function create()
    {
        return view('barangs.create');
    }

    public function save(Request $request)
    {
        $this->validate($request, [
            'nama_barang' => 'required|string|max:100',
            'jumlah' => 'required|integer',
            'harga' => 'required|integer',
        ]);

        try {
            $barang = Barang::create([
                'nama_barang' => $request->nama_barang,
                'jumlah' => $request->jumlah,
                'harga' => $request->harga,
            ]);
            return redirect('/barang')->with(['success' => '<strong>' . $barang->nama_barang . '</strong> Telah disimpan']);
        } catch(\Exception $e) {
            return redirect('/barang/new')->with(['error' => $e->getMessage()]);
        }
    }

}
