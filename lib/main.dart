/*
 * @Author: zlei
 * @Date: 2021-01-06 12:10:39
 * @LastEditors: zlei
 * @LastEditTime: 2021-01-08 11:05:50
 * @FilePath: /animations/lib/main.dart
 * @Description: todo
 */
// import 'package:flame/game.dart';
// import 'package:flutter/material.dart';

// import './example_game.dart';
// import 'second_page.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Testing addingOverlay'),
//         ),
//         body: Container(
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SecondPage()));
//               // Navigator.of(context).push(
//               //   MaterialPageRoute(
//               //     builder: (_) {
//               //       return Scaffold(
//               //         body: SecondPage(),
//               //       );
//               //     },
//               //   ),
//               // );
//               // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
//               //   return SecondPage();
//               // }));
//             },
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
//               width: 50,
//               height: 50,
//               color: Colors.red,
//             ),
//           ),
//         ));
//   }
//   // ExampleGame _myGame;

//   // Widget pauseMenuBuilder(BuildContext buildContext, ExampleGame game) {
//   //   return Center(
//   //     child: Container(
//   //       width: 100,
//   //       height: 100,
//   //       color: const Color(0xFFFF0000),
//   //       child: const Center(
//   //         child: const Text('Paused'),
//   //       ),
//   //     ),
//   //   );
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: const Text('Testing addingOverlay'),
//   //     ),
//   //     body: _myGame == null
//   //         ? const Text('Wait')
//   //         : GameWidget<ExampleGame>(
//   //             game: _myGame,
//   //             overlayBuilderMap: {
//   //               "PauseMenu": pauseMenuBuilder,
//   //             },
//   //             initialActiveOverlays: const ['PauseMenu'],
//   //           ),
//   //     floatingActionButton: FloatingActionButton(
//   //       onPressed: () => newGame(),
//   //       child: const Icon(Icons.add),
//   //     ),
//   //   );
//   // }

//   // void newGame() {
//   //   setState(() {
//   //     _myGame = ExampleGame();
//   //     print('New game created');
//   //   });
//   // }
// }

import 'package:flutter/material.dart';

import 'hero_page.dart';
import 'second_page.dart';
import 'third_page.dart';

void main() => runApp(new PageOne());

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "页面一",

      ///该处需要去掉下面已经指定了第一个页面
//      home: new PageOneDetail(),

      ///注册路由表
      routes: {
        /// '/'是特殊地址，第一个页面
        "/": (context) => PageOneDetail(),
        "/pageTwo": (context) => HomeContent(),
        "/pageHero": (context) => HeroAnimation(),
      },
    );
  }
}

class PageOneDetail extends StatelessWidget {
  ///此处context为MaterialApp下的context
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: RaisedButton(
        onPressed: () {

                  Navigator.push<PageRouteBuilder>(context, PageRouteBuilder(
                      opaque: false,
                      // transitionDuration: Duration(seconds: 4),
                      // reverseTransitionDuration: Duration(seconds: 4),
                      pageBuilder: (BuildContext context, _, __) {
                        return HeroAnimation();
                      },
                      transitionsBuilder: (___, Animation<double> animation, ____, Widget child) {
                        return FadeTransition(
                          opacity: Tween<double>(begin: 0.9, end: 1.0).animate(animation), // animation,
                          child: child,
                          // RotationTransition(
                          //   turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                          //   child: child,
                          // ),
                        );
                      }
                    ));

          ///获取第二个页面返回的数据 相当于Activity 的onActivityResult
          // Navigator.pushNamed(context, "/pageTwo");
          // var pushNamed = await Navigator.pushNamed(context, "/pageTwo");
          // debugPrint(pushNamed);

          // Navigator.pushNamed<String>(context, "/pageTwo").then( (String value){
          //   //处理代码
          // });
        },
        child: Text("点我跳转"),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("第二个页面"),
        ),
        body: RaisedButton(
          onPressed: () {
            //路由pop弹出，结束页面
            Navigator.pop(context, "结束返回");
          },
          child: Text("我是第二个页面"),
        ));
  }
}
