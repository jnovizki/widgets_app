import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption: 'Et est fugiat commodo magna nisi consectetur cupidatat ex elit nisi ut dolor adipisicing culpa.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Entrega rápida',
    caption: 'Tempor sunt nostrud cillum enim ex do occaecat aute enim exercitation consectetur dolor minim.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption:
        'Esse anim incididunt voluptate dolor sunt consequat est ipsum ullamco adipisicing ex excepteur cupidatat.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      //print('${pageviewController.page}');
      final page = pageviewController.page ?? 0;
      if (!(endReached) && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) =>
                      _Slide(title: slideData.title, caption: slideData.caption, imageUrl: slideData.imageUrl),
                )
                .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(child: Text('Salir'), onPressed: () => context.pop()),
          ),

          endReached
              ? Positioned(
                  bottom: 39,
                  right: 30,
                    child:  
                    FadeInLeft(duration: Duration(seconds: 2),
                      child: FilledButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text('Comenzar'),
                      ),
                    ),
                  )
              : SizedBox(),
/*           Visibility(
            visible: endReached,
            child: Positioned(
              bottom: 50,
              right: 30,
              child: FilledButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Start'),
              ),
            ),
          ),
 */                 ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({required this.title, required this.caption, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(height: 20),
            Text(title, style: titleStyle),
            SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
