import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login_screen/screens/augmented_reality.dart';
import 'package:login_screen/screens/produits.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ProduitDetail extends StatefulWidget {
  Products produit;
  ProduitDetail({required this.produit, super.key});

  @override
  State<ProduitDetail> createState() => _ProduitDetailState();
}

class _ProduitDetailState extends State<ProduitDetail> {
  
  testPost() async {
    String username = 'admin';
    String password = 'AbsCyb00';
    String basicAuth ='Basic ' + base64.encode(utf8.encode('$username:$password'));

    Response r = await post(
        Uri.parse('https://demox3.absyscyborg.cloud/api1/x3/erp/X3ABSYS_SEED/YCOMMANDE?representation=YCOMMANDE.\$create'),
        headers: <String, String>{'authorization': basicAuth},
        body: jsonEncode(<String, String>{
          'MAIL': "sskman8855@gmail.com",
          'ARTICLE': widget.produit.name,
          'PRIX': widget.produit.price,
          'QTY': "10"
        }));

    debugPrint(r.statusCode.toString());
    debugPrint(r.body);
  }

  @override
  Widget build(BuildContext context) {
    testPost();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du produit'),
      ),
      body: Material(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.grey.shade50,
        elevation: 3,
        child: ListTile(
            title: Text(
"\nNom : \n\t${widget.produit.name}\n\nDescription : \n\t${widget.produit.description}\n\nPrix : \n\t${widget.produit.price} Euros\n\nCouleur : \n\t${widget.produit.color}\n\nStock : \n\t${widget.produit.stock}\n")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AugmentedReality();
          }));
        },
        child: const Icon(Icons.adb_rounded),
      ),
    );
  }
}
