import 'package:algebra_lineal/screens/MultiplicacionScreen.dart';
import 'package:algebra_lineal/screens/ProductoEscalarScreen.dart';
import 'package:algebra_lineal/screens/ProductoPuntoScreen.dart';
import 'package:algebra_lineal/screens/RestaScreen.dart';
import 'package:algebra_lineal/screens/SumaScreen.dart';
import 'package:algebra_lineal/screens/ChatbotScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MatrizCalculadoraApp());
}

class MatrizCalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange.shade800, // Color primario
        hintColor: Colors.black, // Color de acento
        scaffoldBackgroundColor: Colors.black, // Color de fondo
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.orange.shade600, // Color de los botones elevados
          ),
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/suma': (context) => SumaScreen(),
        '/resta': (context) => RestaScreen(),
        '/multiplicacion': (context) => MultiplicacionScreen(),
        '/producto_punto': (context) => ProductoPuntoScreen(),
        '/producto_escalar': (context) => ProductoEscalarScreen(),
        // add the chatbot
        '/chatbot': (context) => ChatbotScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

 // Cambia el color del AppBar
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wp.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/suma');
                  },
                  child: Text('Suma de Matrices'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/resta');
                  },
                  child: Text('Resta de Matrices'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/multiplicacion');
                  },
                  child: Text('Multiplicación de Matrices'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/producto_punto');
                  },
                  child: Text('Producto Punto'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/producto_escalar');
                  },
                  child: Text('Producto Escalar'),
                ),
                // add the chatbot
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chatbot');
                  },
                  child: Text('Chatbot'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Se debe implementar el código para las pantallas SumaScreen, RestaScreen, MultiplicacionScreen, 
// ProductoPuntoScreen y ProductoEscalarScreen para que la navegación funcione correctamente.
