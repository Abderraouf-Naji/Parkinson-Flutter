import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: [
          _buildNotificationTile(
            icon: Icons.medical_services,
            title: 'Rappels de médicaments',
            onTap: () {
              // Logique pour les rappels de médicaments
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MedicationRemindersPage()),
              );
            },
          ),
          _buildNotificationTile(
            icon: Icons.fitness_center,
            title: 'Rappels d\'exercices et de thérapies physiques',
            onTap: () {
              // Logique pour les rappels d'exercices et de thérapies physiques
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ExerciseRemindersPage()),
              );
            },
          ),
          _buildNotificationTile(
            icon: Icons.event_available,
            title: 'Suivi des rendez-vous médicaux',
            onTap: () {
              // Logique pour le suivi des rendez-vous médicaux
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MedicalAppointmentsPage()),
              );
            },
          ),
          _buildNotificationTile(
            icon: Icons.lightbulb_outline,
            title: 'Conseils de bien-être et d\'auto-soins',
            onTap: () {
              // Logique pour les conseils de bien-être et d'auto-soins
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WellnessTipsPage()),
              );
            },
          ),
          _buildNotificationTile(
            icon: Icons.warning,
            title: 'Alertes sur les changements de statut de santé',
            onTap: () {
              // Logique pour les alertes sur les changements de statut de santé
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HealthStatusAlertsPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        // Utilisation de la couleur primaire pour l'icône
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}

// Pages spécifiques pour chaque type de notification
class MedicationRemindersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rappels de médicaments'),
      ),
      body: Center(
        child: Text('Page pour les rappels de médicaments'),
      ),
    );
  }
}

class ExerciseRemindersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rappels d\'exercices et de thérapies physiques'),
      ),
      body: Center(
        child: Text(
            'Page pour les rappels d\'exercices et de thérapies physiques'),
      ),
    );
  }
}

class MedicalAppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suivi des rendez-vous médicaux'),
      ),
      body: Center(
        child: Text('Page pour le suivi des rendez-vous médicaux'),
      ),
    );
  }
}

class WellnessTipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conseils de bien-être et d\'auto-soins'),
      ),
      body: Center(
        child: Text('Page pour les conseils de bien-être et d\'auto-soins'),
      ),
    );
  }
}

class HealthStatusAlertsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertes sur les changements de statut de santé'),
      ),
      body: Center(
        child: Text(
            'Page pour les alertes sur les changements de statut de santé'),
      ),
    );
  }
}
