/*
 * @Author: zlei
 * @Date: 2021-01-07 19:57:29
 * @LastEditors: zlei
 * @LastEditTime: 2021-01-08 10:54:58
 * @FilePath: /animations/lib/a_page.dart
 * @Description: todo
 */

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'assets/test.png',
          width: 300.0,
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder<void>(
                pageBuilder: (context, animation, secondaryAnimation) {
              return buildW(context);
            }, transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
              Tween<Offset> tween =
                  Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
              return SlideTransition(
                position: animation
                    .drive(tween.chain(CurveTween(curve: Curves.ease))),
                child: child,
              );
            }));
            // Navigator.of(context)
            //     .push(MaterialPageRoute<void>(builder: (BuildContext context) {
            //   this.buildW(context);
            // }));
          },
        ),
      ),
    );
  }

  Widget buildW(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Flippers Page'),
      // ),
      body: Container(
        // The blue background emphasizes that it's a new route.
        color: Colors.lightBlueAccent,
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.topLeft,
        child: PhotoHero(
          photo: 'assets/test.png',
          width: 100.0,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
