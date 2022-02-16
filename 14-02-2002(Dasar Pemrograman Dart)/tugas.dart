import 'dart:io';

void main(List<String> args) {
  List<String> matkul = <String>[];

  print("Silahkan Isi Nama Anda Dibawah ini");
  String? nama = stdin.readLineSync();
  print("Selamat Datang $nama");
  print("");
  print("Masukkan jumlah mata kuliah : ");
  String? jumlah = stdin.readLineSync();
  var jumlahInt = int.parse(jumlah!);

  for (var i = 1; i <= jumlahInt; i++) {
    print("Masukkan Mata Kuliah ke-$i : ");
    matkul.add(stdin.readLineSync()!);
  }

  print("");
  print("Mata Kuliah Anda");
  for (var mk in matkul) {
    print("$mk");
  }
  
}
