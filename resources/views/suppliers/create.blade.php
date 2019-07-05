@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Tambah Data Supplier</h3>
                    </div>
                    <div class="card-body">
                        @if (session('error'))
                            <div class="alert alert-danger">
                                {{ session('error') }}
                            </div>
                        @endif

                        <form action="{{ url('/supplier') }}" method="post">
                            @csrf
                            <div class="form-group">
                                <label for="">Nama Supplier</label>
                                <input type="text" name="nama" class="form-control {{ $errors->has('nama') ? 'is-invalid':'' }}" placeholder="Masukkan nama supplier">
                                <p class="text-danger">{{ $errors->first('nama') }}</p>
                            </div>
                            <div class="form-group">
                                <label for="">Alamat</label>
                                <textarea name="alamat" cols="10" rows="10" class="form-control {{ $errors->has('alamat') ? 'is-invalid':'' }}"></textarea>
                                <p class="text-danger">{{ $errors->first('alamat') }}</p>
                            </div>
                            <div class="form-group">
                                <label for="">No Telepone</label>
                                <input type="number" name="phone" class="form-control {{ $errors->has('phone') ? 'is-invalid':'' }}">
                                <p class="text-danger">{{ $errors->first('phone') }}</p>
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