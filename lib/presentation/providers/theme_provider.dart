import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado de colores inmutable
final colorListProvider = StateProvider((ref) => colorList);

//Un simple booleano
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Un simple entero
final selectedColorProvider = StateProvider<int>((ref) => 0);

//Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //ThemeNotifier(super.state);
  //equivale a:
  ThemeNotifier() : super(AppTheme()); //Crear la primer instancia de AppTheme.

  void toggleDarkMode() {
    state = state.copyWith(
      null,
      !state.isDarkMode,
    ); //Copia el estado actual y cambia el valor de isDarkMode al contrario.
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(
      colorIndex,
      null,
    ); //Copia el estado actual y cambia el valor de selectedColor al nuevo colorIndex.
  }
}
