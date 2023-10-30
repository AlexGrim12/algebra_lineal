import 'package:algebra_lineal/widget/BuildMatrixWidget.dart';
import 'package:algebra_lineal/widget/MatrizInputWidget.dart';
import 'package:algebra_lineal/widget/chat_bot_button.dart';
import 'package:flutter/material.dart';

class MultiplicacionScreen extends StatefulWidget {
  @override
  _MultiplicacionScreenState createState() => _MultiplicacionScreenState();
}

class _MultiplicacionScreenState extends State<MultiplicacionScreen> {
  List<List<int>> matrizA = [];
  List<List<int>> matrizB = [];
  List<List<int>> resultadoMultiplicacion = [];

  int selectedSize = 2; // Valor predeterminado para el tamaño de la matriz

  List<int> matrizSizes = [2, 3, 4]; // Lista de tamaños de matriz posibles

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiplicacion de Matrices'),
        backgroundColor: Colors.orange.shade800,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
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
                  resultadoMultiplicacion =
                      _multiplicarMatrices(matrizA, matrizB);
                });
              },
              child: Text('Calcular Multiplicacion'),
            ),
            Text('Resultado Multiplicacion:',
                style: TextStyle(color: Colors.white)),
            BuildMatrixWidget(matriz: resultadoMultiplicacion),
            const ChatBotButton()
          ],
        ),
      ),
    );
  }

  List<List<int>> _multiplicarMatrices(List<List<int>> A, List<List<int>> B) {
    List<List<int>> result = [];
    for (int i = 0; i < A.length; i++) {
      List<int> row = [];
      for (int j = 0; j < B[0].length; j++) {
        int sum = 0;
        for (int k = 0; k < A[i].length; k++) {
          sum += A[i][k] * B[k][j];
        }
        row.add(sum);
      }
      result.add(row);
    }
    return result;
  }
}
