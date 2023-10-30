import 'package:flutter/material.dart';

class MatrizInputWidget extends StatelessWidget {
  final String label;
  final Function(List<List<int>>) onMatrixEntered;
  final int size;

  MatrizInputWidget({
    required this.label,
    required this.onMatrixEntered,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    List<List<TextEditingController>> controllers = List.generate(
      size,
      (i) => List.generate(size, (j) => TextEditingController()),
    );

    return Theme(
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                color: Colors.orange.shade800, // Color del texto
                fontSize: 18,
              ),
            ),
            Column(
              children: List.generate(size, (i) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(size, (j) {
                    return Container(
                      margin:
                          EdgeInsets.all(5), // Margen alrededor del TextField
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.orange.shade800), // Color del borde
                        borderRadius:
                            BorderRadius.circular(5), // Borde redondeado
                      ),
                      child: SizedBox(
                        width: 50.0,
                        child: TextField(
                          controller: controllers[i][j],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder
                                .none, // Ocultar el borde predeterminado
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          style: TextStyle(
                              color: Colors.orange
                                  .shade800), // Color del texto en TextField
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
            ElevatedButton(
              onPressed: () {
                List<List<int>> matrix = [];
                for (int i = 0; i < size; i++) {
                  List<int> values = [];
                  for (int j = 0; j < size; j++) {
                    values.add(int.tryParse(controllers[i][j].text) ?? 0);
                  }
                  matrix.add(values);
                }
                onMatrixEntered(matrix);
              },
              child: Text('Guardar Matriz'),
            ),
          ],
        ),
      ),
    );
  }
}
