import 'package:flutter/material.dart';
import 'change_password.dart';
import 'language_page.dart';
import 'privacy_page.dart';
import 'help_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        const Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'Poke',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Center(
          child: Text(
            '@felix',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 30),
        const Divider(),

        _buildSettingsItem(
          context,
          'Cambiar Contraseña',
          Icons.lock,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
            );
          },
        ),
        _buildSettingsItem(
          context,
          'Idioma',
          Icons.language,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LanguagePage()),
            );
          },
        ),
        _buildSettingsItem(
          context,
          'Privacidad y Seguridad',
          Icons.privacy_tip,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PrivacyPage()),
            );
          },
        ),
        _buildSettingsItem(
          context,
          'Ayuda',
          Icons.help_outline,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HelpPage()),
            );
          },
        ),
      ],
    );
  }

  ListTile _buildSettingsItem( 
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
