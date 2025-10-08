import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buttons screen")),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Elevated")),

            ElevatedButton(onPressed: null, child: Text("Elevated Disabled")),

            ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.access_alarm_rounded), label: Text("Elevated Icon")),

            FilledButton(onPressed: () {}, child: Text("Filled")),

            FilledButton.icon(onPressed: () {}, icon: Icon(Icons.accessibility_new), label: Text("Filled Icon")),

            OutlinedButton(onPressed: () {}, child: Text("Outline")),

            OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.terminal), label: Text("Outline Icon")),

            TextButton(onPressed: () {}, child: Text("Text")),

            TextButton.icon(onPressed: () {}, icon:Icon(Icons.account_box_outlined), label: Text("Text Icon")),

            const CustomButton(),

            IconButton(onPressed: (){}, icon: Icon(Icons.app_registration_rounded)),

            IconButton(onPressed: (){}, 
            icon: Icon(Icons.app_registration_rounded),
            style:ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(colors.primary),
              iconColor: WidgetStatePropertyAll(Colors.white),
            )
            ),
          ],
          

        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
    const CustomButton({super.key});

    @override
    Widget build(BuildContext context) {
      final colors = Theme.of(context).colorScheme;
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.grey,
          child: InkWell(
            
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Hola Mundo',style: TextStyle(color:Colors.white)),
            ),
          ),
        ),
      );
    }
  }
