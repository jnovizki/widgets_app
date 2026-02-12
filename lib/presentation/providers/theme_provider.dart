import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado de colores inmutable
final colorListProvider = StateProvider((ref) => colorList);

//Un simple booleano
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Un simple entero
final selectedColorProvider = StateProvider<int>((ref) => 0);
