// // import 'package:flutter/material.dart';
// //
// // class DefaultButton extends StatelessWidget {
// //   const DefaultButton({
// //     required this.text,
// //     required this.press,
// //   });
// //
// //   final String text;
// //   final Function press;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       child: TextButton(
// //         style: TextButton.styleFrom(
// //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //           fixedSize: const Size(250, 50),
// //           primary: Colors.white,
// //           backgroundColor: const Color.fromRGBO(255, 108, 0, 1.0),
// //         ),
// //         onPressed: () => press(),
// //         child: Text(
// //           text,
// //           style: const TextStyle(
// //             fontSize: 22,
// //             color: Colors.white,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
//
// class DefaultButton extends StatelessWidget {
//   const DefaultButton({
//     required this.text,
//   });
//
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: TextButton(
//         style: TextButton.styleFrom(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//           fixedSize: const Size(250, 50),
//           primary: Colors.white,
//           backgroundColor: const Color.fromRGBO(255, 108, 0, 1.0),
//         ),
//         onPressed: null, // Remove the onPressed callback
//         child: Text(
//           text,
//           style: const TextStyle(
//             fontSize: 22,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
