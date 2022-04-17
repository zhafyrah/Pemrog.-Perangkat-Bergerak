import 'package:flutter/material.dart';

class ProdukDetail extends StatelessWidget {
  final Map produk;

  ProdukDetail({required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Produk')),
      body: Column(children: [
        Container(
          child: Image.network(produk['iamge_url']),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                produk['harga'],
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                Icon(Icons.edit), Icon(Icons.delete),
              ],)
            ],
          ),
        ),
        Text(produk['detail_proudk']),
      ]),
    );
  }
}
