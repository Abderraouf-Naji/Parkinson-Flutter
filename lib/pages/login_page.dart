import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Parkinson/pages/home_page.dart';
import 'package:Parkinson/pages/register_page.dart';
import 'package:Parkinson/components/my_textfield.dart';
import 'package:Parkinson/components/my_button.dart';
import 'package:Parkinson/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print("Connexion réussie !");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Aucun utilisateur trouvé avec cet email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Aucun utilisateur trouvé avec cet email.'),
            backgroundColor: Colors.red, // Alert color
          ),
        );
      } else if (e.code == 'wrong-password') {
        print('Mot de passe incorrect.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Mot de passe incorrect.'),
            backgroundColor: Colors.red, // Alert color
          ),
        );
      }
    } catch (e) {
      print("Erreur: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Une erreur s\'est produite lors de la connexion.'),
          backgroundColor: Colors.red, // Alert color
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 74),
              Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/ic_launcher.png', // Replace with the correct path to your image
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
              Text(
                'Bienvenue, tu nous as manqué !',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: _emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _passwordController,
                hintText: 'Mot de passe',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Mot de passe oublié?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MyButton(
                text: "Sign In",
                onTap: () => _signInWithEmailAndPassword(context),
              ),
              const SizedBox(height: 25),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'assets/images/google.png'),
                  SizedBox(width: 25),
                  SquareTile(imagePath: 'assets/images/apple.png')
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pas un membre?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'S\'inscrire maintenant',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
