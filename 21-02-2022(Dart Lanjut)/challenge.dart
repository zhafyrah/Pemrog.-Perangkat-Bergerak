import 'dart:io';

void main(){

  var coba = new Map();
  var simpan = new Map();

  stdout.write("Jumlah Mahasiswa :");
  int jmlMhs = int.parse(stdin.readLineSync()!);
  for(int i = 0; i < jmlMhs; i++) {
    stdout.write("Nama :");
    String? nama = stdin.readLineSync();

    stdout.write("Nim :");
    String? nim = stdin.readLineSync();

    stdout.write("Jumlah Mata Kuliah :");
    int jmlMk = int.parse(stdin.readLineSync()!);

    for(int a = 0; a < jmlMk; a++) {
      stdout.write("Mata Kuliah :");
      simpan[a] = stdin.readLineSync();
    }

    coba [i] = {
      'nim':nim,
      'nama':nama,
      'matkul':simpan
    };
    simpan = new Map();
  }
  print(coba);
}