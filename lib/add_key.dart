import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddKey extends StatefulWidget {
  const AddKey({super.key});

  @override
  State<AddKey> createState() => _AddKeyState();
}

class _AddKeyState extends State<AddKey> {

  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//function to add password to the database
  Future<void> _addDataToFirestore() async {
    final String account = _accountController.text.trim();
    final String password = _passwordController.text.trim();

    if (account.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs.")),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('keys').add({
        'account': account,
        'password': password,
        'timestamp': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Données ajoutées avec succès !")),
      );
      _accountController.clear();
      _passwordController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur : $e")),
      );
    }
  }
  //end function...



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title:const Text("AJOUTER MOT DE PASSE", style: TextStyle(color:Colors.white),)),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                child: Image(image: AssetImage('assets/key.png')),
              ),
               const SizedBox(
                height: 20.0,
              ),
               Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
        
                    TextField(
                      controller: _accountController,
                      decoration: InputDecoration(
                        hintText: "Compte",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
        
                    const SizedBox(height: 20,),
        
                     TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "Mot de passe",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
        
                    const SizedBox(height: 20,),
        
        
                    ElevatedButton(
                    onPressed: _addDataToFirestore, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Bords arrondis à 10
                      ),
                    ),
                    child: const Text("Ajouter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      ),))
                
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}