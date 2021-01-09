/*
 * @Author: zlei
 * @Date: 2021-01-07 11:42:59
 * @LastEditors: zlei
 * @LastEditTime: 2021-01-07 16:57:15
 * @FilePath: /animations/lib/second_page.dart
 * @Description: todo
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Testing addingOverlay'),
        ),
        body: Container(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {


                    //               Navigator.of(context).push(MaterialPageRoute(
                    // builder: (BuildContext context) => SecondPage()));
                  Navigator.of(context).pop();
                },
                child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              ),
              Text('sfdafsdfasfdsf'),
            ],
          ),
        ),
      );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }
}
