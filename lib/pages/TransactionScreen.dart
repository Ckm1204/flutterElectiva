import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/TransactionController.dart';
import '../pages/AddTransactionScreen.dart';

class TransactionsScreen extends StatelessWidget {
  final TransactionsController _transactionsController =
      Get.put(TransactionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gastos Personales'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(
              () => Text(
                'Total Gasto: \$${_transactionsController.totalSpending.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _transactionsController.transactions.length,
                itemBuilder: (context, index) {
                  final transaction =
                      _transactionsController.transactions[index];
                  return ListTile(
                    title: Text(transaction.title),
                    subtitle: Text(
                        '${transaction.amount.toStringAsFixed(2)} - ${transaction.date.toString()}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _transactionsController
                            .deleteTransaction(transaction.id);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTransactionScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
