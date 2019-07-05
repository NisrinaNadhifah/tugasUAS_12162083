@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Tambah Dat</h3>
                    </div>
                    <div class="card-body">
                        @if (session('error'))
                            <div class="alert alert-danger">
                                {{ session('error') }}
                            </div>
                        @endif

                        <form action="{{ url('/barang') }}" method="post">
                            @csrf
                            <div class="form-group">
                                <label for="">Nama Barang</label>
                                <input type="text" name="nama_barang" class="form-control {{ $errors->has('nama_barang') ? 'is-invalid':'' }}" >
                                <p class="text-danger">{{ $errors->first('nama_barang') }}</p>
                            </div>
                            <div class="form-group">
                                <label for="">Jumlah</label>
                                <input type="number" name="jumlah" class="form-control {{ $errors->has('jumlah') ? 'is-invalid':'' }}">
                                <p class="text-danger">{{ $errors->first('jumlah') }}</p>
                            </div>
                            <div class="form-group">
                                <label for="">Harga</label>
                                <input type="number" name="harga" class="form-control {{ $errors->has('harga') ? 'is-invalid':'' }}">
                                <p class="text-danger">{{ $errors->first('harga') }}</p>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-danger btn-sm">Simpan</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection