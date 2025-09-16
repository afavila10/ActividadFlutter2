import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  final String username;

  const SettingsPage({super.key, required this.username});

  /// 🔹 Título de cada sección
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

  /// 🔹 Tarjetas reutilizables
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

  /// 🔹 Modal genérico de texto (Email, Password, Idioma, etc.)
  void _showInputDialog(
    BuildContext context, {
    required String title,
    required String hintText,
    required void Function(String) onConfirm,
  }) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text("Guardar"),
              onPressed: () {
                onConfirm(controller.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  /// 🔹 Modal de selección de Tema
  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Seleccionar Tema"),
          content: Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<bool>(
                    title: const Text("Claro"),
                    value: false,
                    groupValue: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme(false);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<bool>(
                    title: const Text("Oscuro"),
                    value: true,
                    groupValue: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme(true);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuración',
              selectionColor: theme.primaryColor,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 103, 80, 164),
      ),
      body: ListView(
        children: [
          _buildSectionTitle("Cuenta"),
          _buildSettingCard(
            icon: Icons.email,
            title: "Cambiar Email",
            description: "Actualiza tu dirección de correo electrónico",
            onTap: () {
              _showInputDialog(
                context,
                title: "Cambiar Email",
                hintText: "Introduce tu nuevo email",
                onConfirm: (newEmail) {
                  debugPrint("Nuevo Email: $newEmail");
                },
              );
            },
          ),
          _buildSettingCard(
            icon: Icons.lock,
            title: "Cambiar Contraseña",
            description: "Actualiza tu contraseña de acceso",
            onTap: () {
              _showInputDialog(
                context,
                title: "Cambiar Contraseña",
                hintText: "Introduce tu nueva contraseña",
                onConfirm: (newPassword) {
                  debugPrint("Nueva contraseña: $newPassword");
                },
              );
            },
          ),

          _buildSectionTitle("Apariencia"),
          _buildSettingCard(
            icon: Icons.color_lens,
            title: "Tema de la App",
            description: "Cambia entre modo claro y oscuro",
            onTap: () => _showThemeDialog(context),
          ),
          _buildSettingCard(
            icon: Icons.language,
            title: "Idioma",
            description: "Selecciona el idioma de la aplicación",
            onTap: () {
              _showInputDialog(
                context,
                title: "Cambiar Idioma",
                hintText: "Ejemplo: Español, Inglés...",
                onConfirm: (newLang) {
                  debugPrint("Nuevo idioma: $newLang");
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
