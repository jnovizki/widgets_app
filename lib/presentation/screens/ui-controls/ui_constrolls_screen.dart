import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controlls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ui Controls')),
      body: _UiControllsView(),
    );
  }
}

class _UiControllsView extends StatefulWidget {
  const _UiControllsView();

  @override
  State<_UiControllsView> createState() => _UiControllsViewState();
}

enum Transportation { car, plane, boat, submarine }
bool wantsBreakfast = false;
bool wantsLunch = false;
bool wantsDinner = false;


class _UiControllsViewState extends State<_UiControllsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => {
            setState(() {
              isDeveloper = !isDeveloper;
            }),
          },
        ),

        ExpansionTile(
          title: Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          initiallyExpanded: false,
          children: [
            RadioListTile(
              title: Text('By Car'),
              subtitle: Text('Viajar por carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => {
                setState(() {
                  selectedTransportation = Transportation.car;
                }),
              },
            ),
            RadioListTile(
              title: Text('By Boat'),
              subtitle: Text('Viajar por barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => {
                setState(() {
                  selectedTransportation = Transportation.boat;
                }),
              },
            ),
            RadioListTile(
              title: Text('By Plane'),
              subtitle: Text('Viajar por avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => {
                setState(() {
                  selectedTransportation = Transportation.plane;
                }),
              },
            ),
            RadioListTile(
              title: Text('By Submarine'),
              subtitle: Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                }),
              },
            ),
          ],
        ),
      
        CheckboxListTile(
          title: Text('¿Desayuno?'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: Text('¿Almuerzo?'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: Text('¿Cena?'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),

      ],
    );
  }
}
