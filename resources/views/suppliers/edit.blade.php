@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Edit Data Supplier</h3>
                    </div>
                    <div class="card-body">
                        @if (session('error'))
                            <div class="alert alert-danger">
                                {{ session('error') }}
                            </div>
                        @endif

                        <form action="{{ url('/supplier/' . $supplier->id) }}" method="post">
                            @csrf
                            <input type="hidden" name="_method" value="PUT" class="form-control">
                            <div class="form-group">
                                <label for="">Nama Supplier</label>
                                <input type="text" name="nama" class="form-control" value="{{ $supplier->nama }}" placeholder="Masukkan nama supplier">
                            </div>
                            <div class="form-group">
                                <label for="">Alamat</label>
                                <textarea name="alamat" cols="10" rows="10" class="form-control">{{ $supplier->alamat }}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="">No Telepone</label>
                                <input type="number" name="phone" class="form-control" value="{{ $supplier->phone }}">
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary btn-sm">Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection