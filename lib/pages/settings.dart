import 'package:flutter/material.dart';
import 'package:Parkinson/pages/login_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implémentez la logique de recherche
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Paramètres de notification'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationSettingsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings), // Ajoutez cette ligne pour l'icône
            title: Text('Personnalisation de l\'interface utilisateur'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserInterfaceSettingsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Gestion du compte utilisateur'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountSettingsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.sync),
            title: Text('Synchronisation avec des dispositifs externes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SyncSettingsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Paramètres de confidentialité et de sécurité'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecuritySettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _enableNotifications = true;
  bool _enableSound = true;
  bool _enableVibration = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres de notification'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Activer les notifications'),
            value: _enableNotifications,
            onChanged: (value) {
              setState(() {
                _enableNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Activer le son'),
            value: _enableSound,
            onChanged: (value) {
              setState(() {
                _enableSound = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Activer la vibration'),
            value: _enableVibration,
            onChanged: (value) {
              setState(() {
                _enableVibration = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class UserInterfaceSettingsPage extends StatefulWidget {
  const UserInterfaceSettingsPage({Key? key}) : super(key: key);

  @override
  _UserInterfaceSettingsPageState createState() =>
      _UserInterfaceSettingsPageState();
}

class _UserInterfaceSettingsPageState extends State<UserInterfaceSettingsPage> {
  int _selectedTheme = 0; // 0: Light, 1: Dark
  int _selectedLanguage = 0; // 0: English, 1: French
  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personnalisation de l\'interface utilisateur'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Thème'),
            trailing: SizedBox(
              width: 200,
              child: DropdownButton<int>(
                value: _selectedTheme,
                onChanged: (value) {
                  setState(() {
                    _selectedTheme = value!;
                  });
                },
                items: [
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Text('Clair'),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('Sombre'),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('Langue'),
            trailing: DropdownButton<int>(
              value: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text('Anglais'),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Français'),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Taille de la police'),
            trailing: SizedBox(
              width: 200,
              child: Slider(
                value: _fontSize,
                min: 12,
                max: 24,
                divisions: 12,
                onChanged: (value) {
                  setState(() {
                    _fontSize = value;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  String _username = 'Utilisateur';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion du compte utilisateur'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Nom d\'utilisateur'),
            subtitle: Text(_username),
            trailing: Icon(Icons.edit),
            onTap: () {
              // Implémenter la logique pour modifier le nom d'utilisateur
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Changer le mot de passe'),
            onTap: () {
              // Implémenter la logique pour changer le mot de passe
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Déconnexion'),
            onTap: () {
              // Implémenter la logique pour la déconnexion
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SyncSettingsPage extends StatefulWidget {
  const SyncSettingsPage({Key? key}) : super(key: key);

  @override
  _SyncSettingsPageState createState() => _SyncSettingsPageState();
}

class _SyncSettingsPageState extends State<SyncSettingsPage> {
  bool _autoSync = true;
  List<String> _selectedData = ['Contacts'];
  int _syncFrequency = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Synchronisation avec des dispositifs externes'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Synchronisation automatique'),
            value: _autoSync,
            onChanged: (value) {
              setState(() {
                _autoSync = value;
              });
            },
          ),
          ListTile(
            title: Text('Données à synchroniser'),
            subtitle: Text(_selectedData.join(', ')),
            onTap: () {
              // Implémenter la logique pour choisir les données à synchroniser
            },
          ),
          ListTile(
            title: Text('Fréquence de synchronisation'),
            trailing: DropdownButton<int>(
              value: _syncFrequency,
              onChanged: (value) {
                setState(() {
                  _syncFrequency = value!;
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Toutes les 1 heure'),
                ),
                DropdownMenuItem<int>(
                  value: 6,
                  child: Text('Toutes les 6 heures'),
                ),
                DropdownMenuItem<int>(
                  value: 24,
                  child: Text('Tous les jours'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecuritySettingsPage extends StatefulWidget {
  const SecuritySettingsPage({Key? key}) : super(key: key);

  @override
  _SecuritySettingsPageState createState() => _SecuritySettingsPageState();
}

class _SecuritySettingsPageState extends State<SecuritySettingsPage> {
  bool _passwordProtection = true;
  bool _twoFactorAuth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres de confidentialité et de sécurité'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Protection par mot de passe'),
            value: _passwordProtection,
            onChanged: (value) {
              setState(() {
                _passwordProtection = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Vérification en deux étapes'),
            value: _twoFactorAuth,
            onChanged: (value) {
              setState(() {
                _twoFactorAuth = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingsPage(),
  ));
}
