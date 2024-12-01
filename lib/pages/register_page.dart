import 'package:Parkinson/components/my_dropdownField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Parkinson/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  late String _selectedSex;

  @override
  void initState() {
    super.initState();
    _selectedSex = 'Masculin'; // Initial value for sex dropdown
  }

  Future<void> _registerWithEmailAndPassword(BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Save additional user information to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': _emailController.text,
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'sex': _selectedSex, // Using selected sex from dropdown
        'age': int.parse(_ageController.text),
        // Add additional fields as needed
      });

      // If successful, navigate to the login screen or perform the desired action.
      print("Registration successful!");
      Navigator.pop(context); // Go back to the login page
    } on FirebaseAuthException catch (e) {
      // Handle registration errors.
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 90),

            // Logo
            ClipOval(
              child: Image.asset(
                'assets/images/ic_launcher.png', // Replace with the correct path to your image
                width: 150,
                height: 150,
              ),
            ),

            const SizedBox(height: 25),

            // First Name textfield
            MyTextField(
              controller: _firstNameController,
              hintText: 'Prénom',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // Last Name textfield
            MyTextField(
              controller: _lastNameController,
              hintText: 'Nom',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // Email textfield
            MyTextField(
              controller: _emailController,
              hintText: 'Adresse e-mail',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // Password textfield
            MyTextField(
              controller: _passwordController,
              hintText: 'Mot de passe',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            // Sex dropdown
            MyDropdownField(
              value: _selectedSex,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSex = newValue!;
                });
              },
              items: <String>['Masculin', 'Féminin'],
              hintText: 'Sexe',
            ),
            // Age textfield
            MyTextField(
              controller: _ageController,
              hintText: 'Âge',
              obscureText: false,
            ),

            const SizedBox(height: 30),

            // Register button
            MyButton(
              onTap: () => _registerWithEmailAndPassword(context),
              text: "S'inscrire",
            ),

            const SizedBox(
              height: 20,
            ),

            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Ou continuez avec',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // google + apple sign in buttons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // google button
                SquareTile(imagePath: 'assets/images/google.png'),

                SizedBox(width: 25),

                // apple button
                SquareTile(imagePath: 'assets/images/apple.png')
              ],
            ),
            const SizedBox(height: 25),

            // not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vous êtes déjà membre ?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: const Text(
                      'Connectez-vous ici',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
