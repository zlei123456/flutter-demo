/*
 * @Author: zlei
 * @Date: 2021-01-07 15:31:51
 * @LastEditors: zlei
 * @LastEditTime: 2021-01-07 15:37:30
 * @FilePath: /animations/lib/first_page.dart
 * @Description: todo
 */
// /*
//  * @Author: zlei
//  * @Date: 2021-01-07 15:31:51
//  * @LastEditors: zlei
//  * @LastEditTime: 2021-01-07 15:37:08
//  * @FilePath: /animations/lib/first_page.dart
//  * @Description: todo
//  */

// import 'package:flutter/material.dart';

// import 'second_page.dart';

// class FirstPage extends StatefulWidget {
//   @override
//   _FirstPageState createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("第一个页面"),
//       ),
//       body: Container(
//         child: Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (BuildContext context) => SecondPage()));

//                 // Navigator.of(context).pop();
//               },
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
//                 width: 50,
//                 height: 50,
//                 color: Colors.red,
//               ),
//             ),
//             Text('sfdafsdfasfdsf'),
//           ],
//         ),
//       ),
//     );
//   }
// }
