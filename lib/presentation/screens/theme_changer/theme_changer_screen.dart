import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme changer'),
        actions: [
          IconButton(
            onPressed: () {
              //ref.read(isDarkModeProvider.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: (isDarkMode ? Icon(Icons.dark_mode_outlined) : Icon(Icons.light_mode_outlined)),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Color> colors = ref.watch(colorListProvider);
    int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        RadioGroup<int>(
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).changeColorIndex(value!);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(colors.length, (index) {
              final color = colors[index];
              return RadioListTile<int>(
                title: Text('Este color', style: TextStyle(color: color)),
                subtitle: Text('${color.r}, ${color.g}, ${color.b}'),
                value: index, // ✔ int, consistente con RadioGroup<int>
              );
            }),
          ),
        ),
      ],
    );
  }
}
