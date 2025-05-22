import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cambiar Contraseña')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(labelText: 'Contraseña actual'),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nueva contraseña'),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Confirmar contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: null, // Reemplaza con lógica real
              child: Text('Guardar cambios'),
            ),
          ],
        ),
      ),
    );
  }
}