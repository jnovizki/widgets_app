import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackback = SnackBar(
      content: Text('Hola Mundo'),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {},
      ),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackback);
  }

  @override
  Widget build(BuildContext context) {
    //return Placeholder();
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars y Diálogos')),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
