import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './models/Transaction.dart';
import './pages/TransactionScreen.dart';
import './pages/AddTransactionScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gastos Personales App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Ruta inicial de la aplicación
      getPages: [
        GetPage(name: '/', page: () => TransactionsScreen()),
        GetPage(name: '/addTransaction', page: () => AddTransactionScreen()),
      ],
    );
  }
}
