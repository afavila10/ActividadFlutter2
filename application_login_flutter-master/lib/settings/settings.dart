import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';

class SettingsPage extends StatelessWidget {
  final String username;

  const SettingsPage({super.key, required this.username});

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildSettingCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Opciones de Configuración', showBackButton: true),
      body: Column(
        children: [
          // Subtítulo centrado debajo del AppBar
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          ),

          // ListView con las opciones
          Expanded(
            child: ListView(
              children: [
                _buildSectionTitle("Cuenta"),
                _buildSettingCard(
                  icon: Icons.email,
                  title: "Cambiar Email",
                  description: "Actualiza tu dirección de correo electrónico",
                  onTap: () {},
                ),
                _buildSettingCard(
                  icon: Icons.lock,
                  title: "Cambiar Contraseña",
                  description: "Actualiza tu contraseña de acceso",
                  onTap: () {},
                ),
                _buildSectionTitle("Apariencia"),
                _buildSettingCard(
                  icon: Icons.color_lens,
                  title: "Tema de la App",
                  description: "Cambia entre modo claro y oscuro",
                  onTap: () {},
                ),
                _buildSettingCard(
                  icon: Icons.language,
                  title: "Idioma",
                  description: "Selecciona el idioma de la aplicación",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
