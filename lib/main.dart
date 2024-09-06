import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Inicio de Sesión',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaInicioSesion(),
    );
  }
}

class PantallaInicioSesion extends StatefulWidget {
  @override
  _PantallaInicioSesionState createState() => _PantallaInicioSesionState();
}

class _PantallaInicioSesionState extends State<PantallaInicioSesion> {
  final TextEditingController _controladorUsuario = TextEditingController();
  final TextEditingController _controladorContrasena = TextEditingController();
  bool _ocultarTexto = true;

  void _alternarVisibilidadContrasena() {
    setState(() {
      _ocultarTexto = !_ocultarTexto;
    });
  }

  void _iniciarSesion() {
    final String usuario = _controladorUsuario.text;
    final String contrasena = _controladorContrasena.text;

    if (usuario.isEmpty || contrasena.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('El nombre de usuario y la contraseña no pueden estar en blanco.'),
        ),
      );
      return;
    }

    if (usuario == 'walter' && contrasena == 'walter') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PantallaBienvenida(usuario: usuario),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nombre de usuario o contraseña incorrectos.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Inicio de Sesión'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 90,
                backgroundColor: const Color.fromARGB(255, 103, 124, 214),
                backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/1361/1361728.png"), // Añade tu imagen aquí
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controladorUsuario,
                decoration: InputDecoration(
                  labelText: 'Nombre de usuario',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controladorContrasena,
                obscureText: _ocultarTexto,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _ocultarTexto ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _alternarVisibilidadContrasena,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _iniciarSesion,
                child: Text('Iniciar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PantallaBienvenida extends StatelessWidget {
  final String usuario;

  PantallaBienvenida({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: Center(
        child: Text(
          'Bienvenido $usuario',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
