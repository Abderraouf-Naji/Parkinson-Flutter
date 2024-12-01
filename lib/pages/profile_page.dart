import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User _user;
  String _userName = "";
  String _userEmail = "";
  String _imageUrl = "";
  String _firstName = "";
  String _lastName = "";
  String _sex = "";
  int _age = 0;
  List<String> _signatures = [];

  @override
  void initState() {
    super.initState();
    _getUserData();
    _getSignatures();
  }

  Future<void> _getUserData() async {
    _user = FirebaseAuth.instance.currentUser!;
    _userName = _user.displayName ?? "No Username";
    _userEmail = _user.email ?? "No Email";

    // Récupérer l'URL de l'image de profil depuis Firebase Storage
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images/${_user.uid}.jpg');
      _imageUrl = await ref.getDownloadURL();
    } catch (error) {
      print("Error getting profile image: $error");
      // Gérer l'erreur d'autorisation pour récupérer l'image de profil
      // Peut-être afficher une image par défaut ou un message d'erreur
    }

    // Récupérer d'autres informations sur l'utilisateur depuis Firestore
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(_user.uid)
          .get();
      if (userDoc.exists) {
        _firstName = userDoc.get('firstName') ?? "";
        _lastName = userDoc.get('lastName') ?? "";
        _sex = userDoc.get('sex') ?? "";
        _age = userDoc.get('age') ?? 0;
      }
    } catch (error) {
      print("Error getting user information: $error");
      // Gérer l'erreur de récupération des informations utilisateur
    }

    setState(() {});
  }

  Future<void> _getSignatures() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("signatures")
          .where("userId", isEqualTo: _user.uid)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        _signatures = querySnapshot.docs
            .map((doc) => doc.get("signatureUrl") as String)
            .toList();
      }
    } catch (error) {
      print("Error getting user signatures: $error");
      // Gérer les erreurs de récupération des signatures utilisateur
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le Profil d\'utilisateur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: _imageUrl.isNotEmpty
                  ? NetworkImage(_imageUrl)
                  : const AssetImage('assets/images/default_profile.jpg')
                      as ImageProvider,
            ),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.person, 'Username', _userName),
            _buildInfoRow(Icons.email, 'Email', _userEmail),
            _buildInfoRow(Icons.person, 'First Name', _firstName),
            _buildInfoRow(Icons.person, 'Last Name', _lastName),
            _buildInfoRow(Icons.person, 'Sex', _sex),
            _buildInfoRow(Icons.person, 'Age', _age.toString()),
            const SizedBox(height: 16),
            Text(
              'Historique des Signatures',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _signatures.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Signature ${index + 1}'),
                    leading: Icon(Icons.insert_drive_file),
                    onTap: () {
                      // Gérer l'action lorsque l'utilisateur appuie sur une signature
                      // Par exemple, afficher la signature en plein écran
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          SizedBox(width: 16),
          Text(
            label + ':',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
