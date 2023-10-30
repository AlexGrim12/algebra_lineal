import 'package:algebra_lineal/widget/MatrizInputWidget.dart';
import 'package:algebra_lineal/widget/BuildMatrixWidget.dart';
import 'package:algebra_lineal/widget/chat_bot_button.dart';
import 'package:flutter/material.dart';

class SumaScreen extends StatefulWidget {
  @override
  _SumaScreenState createState() => _SumaScreenState();
}

class _SumaScreenState extends State<SumaScreen> {
  List<List<int>> matrizA = [];
  List<List<int>> matrizB = [];
  List<List<int>> resultadoSuma = [];

  int selectedSize = 2; // Valor predeterminado para el tamaño de la matriz

  List<int> matrizSizes = [2, 3, 4]; // Lista de tamaños de matriz posibles

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suma de Matrices'),
        backgroundColor: Colors.orange.shade800,
      ),
      body: Theme(
        data: ThemeData(
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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  // cambiar el texto a blanco
                  Text(
                    'Tamaño de la Matriz: ',
                    style: TextStyle(color: Colors.white),
                  ),

                  DropdownButton<int>(
                    dropdownColor:
                        Colors.black, // Cambia esto al color que desees
                    value: selectedSize,
                    items: matrizSizes.map((int size) {
                      return DropdownMenuItem<int>(
                        value: size,
                        child: Text(size.toString(),
                            style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (int? newSize) {
                      setState(() {
                        selectedSize = newSize!;
                      });
                    },
                  ),
                ],
              ),
              MatrizInputWidget(
                label: 'Matriz A:',
                onMatrixEntered: (matrix) {
                  setState(() {
                    matrizA = matrix;
                  });
                },
                size: selectedSize,
              ),
              MatrizInputWidget(
                label: 'Matriz B:',
                onMatrixEntered: (matrix) {
                  setState(() {
                    matrizB = matrix;
                  });
                },
                size: selectedSize,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    resultadoSuma = _sumarMatrices(matrizA, matrizB);
                  });
                },
                child: Text('Calcular Suma'),
              ),
              Text('Resultado Suma:', style: TextStyle(color: Colors.white)),
              BuildMatrixWidget(
                matriz: resultadoSuma,
              ),
              const ChatBotButton(),
            ],
          ),
        ),
      ),
    );
  }

  List<List<int>> _sumarMatrices(List<List<int>> A, List<List<int>> B) {
    List<List<int>> result = [];
    for (int i = 0; i < A.length; i++) {
      List<int> row = [];
      for (int j = 0; j < A[i].length; j++) {
        row.add(A[i][j] + B[i][j]);
      }
      result.add(row);
    }
    return result;
  }
}
