import 'package:flutter/material.dart';
import 'package:login_screen/screens/augmented_reality.dart';
import 'package:login_screen/screens/produits.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
          appBar: AppBar(  
            title: const Text('Page d\'accueil'),  
          ),  
          body: Center(child: Column(children: <Widget>[  
            Container(  
              margin: const EdgeInsets.all(100),  
              child: ElevatedButton(  
                child: const Text('Produits', style: TextStyle(fontSize: 20.0),),  
                onPressed: () {        
                Navigator.push(context, MaterialPageRoute(builder: (context) {return const Produits();}));
                }, 
              ),  
            ),  
            ElevatedButton(  
              child: const Text('Réalité augmentée', style: TextStyle(fontSize: 20.0),),  
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AugmentedReality();
            }));
          }, 
            ),  
          ]  
         ))  
      ),  
    );  
  }
}
