import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackback = SnackBar(
      content: Text('Hola Mundo'),
      /* action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {}, 
      ),*/
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackback);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Estas seguro?'),
        content: Text(
          'Labore duis occaecat occaecat reprehenderit id. Sint veniam labore mollit non eiusmod sint labore labore. Magna culpa labore commodo elit eu occaecat ullamco fugiat nisi enim eiusmod qui anim aute. Magna non sunt irure id dolor.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //return Placeholder();
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars y Diálogos')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    Text(
                      'Lorem sit esse enim aliquip excepteur nulla Lorem exercitation amet in nisi exercitation. Nisi officia sint ipsum amet deserunt est laborum consectetur. Laborum ea Lorem consequat adipisicing cupidatat non. Do excepteur proident amet amet sit sit commodo velit laborum ipsum id enim est.',
                    ),
                  ],
                );
              },
              child: Text('Licencias usadas'),
            ),

            FilledButton.tonal(onPressed: () => openDialog(context), child: Text('Mostrar diálogo')),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
