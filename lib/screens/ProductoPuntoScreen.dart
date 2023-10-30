import 'package:algebra_lineal/widget/chat_bot_button.dart';
import 'package:flutter/material.dart';
import 'package:algebra_lineal/widget/MatrizInputWidget.dart';

class ProductoPuntoScreen extends StatefulWidget {
  @override
  _ProductoPuntoScreenState createState() => _ProductoPuntoScreenState();
}

class _ProductoPuntoScreenState extends State<ProductoPuntoScreen> {
  List<List<int>> matrizA = [];
  List<List<int>> matrizB = [];
  int resultadoProductoPunto = 0; // Change the type to int

  int selectedSize = 2;
  List<int> matrizSizes = [2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto punto de Matrices'),
        backgroundColor: Colors.orange.shade800,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Tamaño de la Matriz: ',
                    style: TextStyle(color: Colors.white)),
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
                  resultadoProductoPunto =
                      _calcularProductoPunto(matrizA, matrizB);
                });
              },
              child: Text('Calcular Producto punto'),
            ),
            Text('Resultado Producto punto: $resultadoProductoPunto',
                style: TextStyle(
                    color:
                        Colors.white)), // Display the integer result directly
            const ChatBotButton()
          ],
        ),
      ),
    );
  }

  int _calcularProductoPunto(List<List<int>> A, List<List<int>> B) {
    int result = 0;
    for (int i = 0; i < A.length; i++) {
      for (int j = 0; j < A[i].length; j++) {
        result += A[i][j] * B[i][j];
      }
    }
    return result;
  }
}
