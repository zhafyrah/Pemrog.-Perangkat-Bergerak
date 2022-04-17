import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_shop/screens/home_page.dart';
import 'package:http/http.dart' as http;



class TambahProduk extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  Future saveProduk() async{
    final response = await http.post(Uri.parse("http://127.0.0.1:8000/api/produk"),
    body: {
      "nama": _nameController.text,
      "detail_produk": _detailController.text,
      "harga": _hargaController.text,
      "image_url": _imageUrlController.text,
    }
    );

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Produk'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
            labelText: "Nama"),
            validator: (value){
              if(value == null || value.isEmpty){
                return "Masukkan nama produk";
              }
            },
          ),
          TextFormField(decoration: InputDecoration(labelText: "Detail Produk"),
          validator: (value){
              if(value == null || value.isEmpty){
                return "Masukkan detail produk";
              }
            },),
          TextFormField(
            controller: _hargaController,
            decoration: InputDecoration(labelText: "Harga"),
            validator: (value){
              if(value == null || value.isEmpty){
                return "Masukkan harga produk";
              }
            },),
          TextFormField(
            controller: _imageUrlController,
            decoration: InputDecoration(labelText: "Image_url"),
            validator: (value){
              if(value == null || value.isEmpty){
                return "Masukkan link produk";
              }
            },),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              if(_formKey.currentState!.validate()) {
              saveProduk().then((value){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("produk berhasil ditambah")));
              });
                
              }
            }, 
            child: Text('Simpan'))
    ],
      ))
    );
  }
}