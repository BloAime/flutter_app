

import 'package:firebase_database/firebase_database.dart';

class MyUser {
  String? uid;
  String? nom;
  String? prenoms;
  String? imageUrl;
  String? initiales;

  MyUser(DataSnapshot snapshot) {
    uid = snapshot.key!;
    Map map = snapshot.value as Map;
    prenoms = map['prenoms'];
    nom = map['nom'];
    imageUrl = map['imageUr'];
    if (prenoms != "" && prenoms!.length > 0) {
      initiales = prenoms![0];
    }
    if (nom != "" && nom!.length > 0) {
      if (initiales != "") {
        initiales = (initiales)! + nom![0];
      } else {
        initiales = nom![0];
      }
    }
  }
  Map toMap() {
    return {"prenoms": prenoms, "nom": nom, "imageUrl": imageUrl, "uid": uid};
  }

  String fullName() {
    return "$prenoms $nom";
  }
}
