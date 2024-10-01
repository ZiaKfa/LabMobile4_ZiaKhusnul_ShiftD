import 'package:flutter/material.dart';
import 'package:toko_kita/model/produk.dart';
import 'package:toko_kita/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  Produk? produk;

  ProdukDetail({super.key, this.produk}); 

  @override
  _ProdukDetailState createState() => _ProdukDetailState();

}

class _ProdukDetailState extends State<ProdukDetail>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk ${widget.produk?.namaProduk} Zia'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Kode Produk: ${widget.produk?.kodeProduk}'),
            Text('Nama Produk: ${widget.produk?.namaProduk}'),
            Text('Harga: ${widget.produk?.harga}'),
            _tombolAksi(),
          ],
        ),
      ),
    );
  }

  Widget _tombolAksi(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          child: const Text('Edit'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProdukForm(produk: widget.produk)));
          },
        ),
        OutlinedButton(
          child: const Text('Hapus'),
          onPressed: (){
            konfirmasiHapus();
          }
        ),
      ],
    );
  }

  void konfirmasiHapus(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda yakin ingin menghapus data ini?'),
          actions: <Widget>[
            OutlinedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            OutlinedButton(
              onPressed: (){
                
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      }
    );
  }
}