import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importa Get para usar su funcionalidad de gestión de estado y navegación
import '../controller/TransactionController.dart'; // Importa el controlador de transacciones si lo estás utilizando

class AddTransactionScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TransactionsController _transactionsController =
      Get.find<TransactionsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Transacción'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Cantidad'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                final amount = double.parse(_amountController.text);
                _transactionsController.addTransaction(
                  title,
                  amount,
                  DateTime.now(),
                );
                Get.back(); // Regresar a la pantalla anterior
              },
              child: Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}
