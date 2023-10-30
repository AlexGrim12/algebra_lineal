import 'package:algebra_lineal/widget/MatrizInputWidget.dart';
import 'package:algebra_lineal/widget/BuildMatrixWidget.dart';
import 'package:algebra_lineal/widget/chat_bot_button.dart';
import 'package:flutter/material.dart';

class RestaScreen extends StatefulWidget {
  @override
  _RestaScreenState createState() => _RestaScreenState();
}

class _RestaScreenState extends State<RestaScreen> {
  List<List<int>> matrizA = [];
  List<List<int>> matrizB = [];
  List<List<int>> resultadoResta = [];

  int selectedSize = 2;
  List<int> matrizSizes = [2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resta de Matrices'),
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
                  resultadoResta = _restarMatrices(matrizA, matrizB);
                });
              },
              child: Text('Calcular Resta'),
            ),
            Text('Resultado Resta:', style: TextStyle(color: Colors.white)),
            BuildMatrixWidget(
              matriz: resultadoResta,
            ),
            const ChatBotButton(),
          ],
        ),
      ),
    );
  }

  List<List<int>> _restarMatrices(List<List<int>> A, List<List<int>> B) {
    List<List<int>> result = [];
    for (int i = 0; i < A.length; i++) {
      List<int> row = [];
      for (int j = 0; j < A[i].length; j++) {
        row.add(A[i][j] - B[i][j]);
      }
      result.add(row);
    }
    return result;
  }
}
