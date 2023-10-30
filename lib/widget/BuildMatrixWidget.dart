import 'package:flutter/material.dart';

class BuildMatrixWidget extends StatelessWidget {
  final List<List<int>> matriz;

  BuildMatrixWidget({required this.matriz});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        // Define el tema para el DataTable
        primaryColor: Colors.orange.shade800, // Color primario del DataTable
        hintColor: Colors.orange, // Color de resaltado del DataTable
      ),
      child: _buildDataTable(),
    );
  }

  Widget _buildDataTable() {
    if (matriz.isNotEmpty && matriz[0].isNotEmpty) {
      return DataTable(
        headingRowHeight: 40,
        dataRowHeight: 40,
        columns: List<DataColumn>.generate(
          matriz[0].length,
          (columnIndex) => DataColumn(
            label: Text(
              'Col ${columnIndex + 1}',
              style: TextStyle(color: Colors.orange.shade800), // Cambia el color de texto a un tono de naranja
            ),
            numeric: true,
            tooltip: 'Columna ${columnIndex + 1} de la matriz',
          ),
        ),
        rows: List<DataRow>.generate(
          matriz.length,
          (rowIndex) {
            return DataRow(
              cells: List<DataCell>.generate(
                matriz[rowIndex].length,
                (cellIndex) => DataCell(
                  Text(
                    matriz[rowIndex][cellIndex].toString(),
                    style: TextStyle(color: Colors.orange.shade800), // Cambia el color de texto a un tono de naranja
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Center(
        child: Text(
          'La matriz está vacía.',
          style: TextStyle(color: Colors.orange.shade800), // Cambia el color de texto a un tono de naranja
        ),
      );
    }
  }
}
