import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorage{
  static UploadTask uploadFile(String path,File file){
try{
  final ref= FirebaseStorage.instance.ref(path);
  return ref .putFile(file);
}catch(e){
  print(e);
}

  }

}