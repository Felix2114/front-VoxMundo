import 'package:flutter/material.dart';

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
        _buildSettingsItem(context, 'Cambiar Contraseña', Icons.lock),
        //_buildSettingsItem(context, 'Cambiar Correo', Icons.email),
        _buildSettingsItem(context, 'Notificaciones', Icons.notifications),
        _buildSettingsItem(context, 'Idioma', Icons.language),
        _buildSettingsItem(context, 'Privacidad y Seguridad', Icons.privacy_tip),
        _buildSettingsItem(context, 'Ayuda', Icons.help_outline),
      ],
    );
  }

  ListTile _buildSettingsItem(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Aquí puedes navegar a otra pantalla si lo deseas
      },
    );
  }
}
