import 'package:algebra_lineal/widget/BuildMatrixWidget.dart';
import 'package:algebra_lineal/widget/MatrizInputWidget.dart';
import 'package:algebra_lineal/widget/chat_bot_button.dart';
import 'package:flutter/material.dart';

class ProductoEscalarScreen extends StatefulWidget {
  @override
  _ProductoEscalarScreenState createState() => _ProductoEscalarScreenState();
}

class _ProductoEscalarScreenState extends State<ProductoEscalarScreen> {
  List<List<int>> matrizA = [];
  int Escalar = 0;
  List<List<int>> resultadoPEscalar = [];

  int selectedSize = 2; // Valor predeterminado para el tamaño de la matriz

  List<int> matrizSizes = [2, 3, 4]; // Lista de tamaños de matriz posibles

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto Escalar de Matriz'),
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
            // input para el escalar con bordes personalizados
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange.shade800),
                  ),
                  labelText: 'Escalar',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange.shade800),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange.shade800),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    Escalar = int.parse(value);
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  resultadoPEscalar =
                      _calcularProductoEscalar(matrizA, Escalar);
                });
              },
              child: Text('Calcular Producto Escalar'),
            ),
            Text(
              'Resultado Producto Escalar:',
              style: TextStyle(color: Colors.white),
            ),
            BuildMatrixWidget(
              matriz: resultadoPEscalar,
            ),
            const ChatBotButton(),
          ],
        ),
      ),
    );
  }

  List<List<int>> _calcularProductoEscalar(List<List<int>> A, int escalar) {
    List<List<int>> result = [];
    for (int i = 0; i < A.length; i++) {
      List<int> row = [];
      for (int j = 0; j < A[i].length; j++) {
        row.add(A[i][j] * escalar);
      }
      result.add(row);
    }
    return result;
  }
}
