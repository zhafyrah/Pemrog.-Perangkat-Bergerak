import 'dart:convert';
// import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/screens/detail.dart';
import 'package:online_shop/screens/edit_produk.dart';
import 'package:online_shop/screens/tambah_produk.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'http://127.0.0.1:8000/api/produk';

  Future getProdukModel() async{
    var response = await http.get(Uri.parse(url));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteProduk(String produkId) async{

    String url = 'http://127.0.0.1:8000/api/produk' + produkId;
    
    var response = await http.get(Uri.parse(url));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.push(context, MaterialPageRoute(builder: (context)=> TambahProduk()));
          },
        child: Icon(Icons.add),),
      appBar: AppBar(
        title: const Text("My Store"),
      ),
      body: FutureBuilder(
        future: getProdukModel(), 
        builder: (context, snapshot) { 
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  height: 180,
                  child: Card(
                    elevation: 5,
                    child: Row(
                      children:[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProdukDetail(produk: snapshot.data['data'][index],)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(5),
                            height: 120,
                            width: 120,
                            child: Image.network(
                              snapshot.data['data'][index]['image_url'])
                              ),
                        ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(snapshot.data['data'][index]['nama'], style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(snapshot.data['data'][index]['detail_produk']),
                                    
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder:  (context)=> EditProduk(Produk: snapshot.data['data'][index],)));
                                          },
                                          child: Icon(Icons.edit)),
                                        GestureDetector(
                                          onTap: () {
                                            deleteProduk(snapshot.data['data'][index]['id'].toString()).then((value){
                                              setState(() {});
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("produk berhasil dihapus")));
                                            });
                                          },
                                          child: Icon(Icons.delete)),
                                          ],
                                        ),
                                        Text(snapshot.data['data'][index]['harga'].toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                      ]
                    ),
                  ),
                );
              });
          } else{
            return Text("error");
          }
        }
    )
      );
  }
}