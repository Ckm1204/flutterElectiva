import 'package:get/get.dart';
import '../models/Transaction.dart';

class TransactionsController extends GetxController {
  var transactions = <Transaction>[].obs;

  double get totalSpending =>
      transactions.fold(0.0, (sum, transaction) => sum + transaction.amount);

  void addTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );
    transactions.add(newTransaction);
    update(); 
  }

  void deleteTransaction(String id) {
    transactions.removeWhere((transaction) => transaction.id == id);
    update(); 
  }
}
