import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Container()),
      ),
    );
  }
}

// class CuadroInfo extends StatelessWidget {
//   const CuadroInfo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         height: 500,
//         width: 250,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black26,
//                 offset: Offset(3, 5),
//                 blurRadius: 3,
//               ),
//               BoxShadow(
//                 color: Colors.black26,
//                 offset: Offset(-2, -2),
//                 blurRadius: 2,
//               ),
//             ]),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 8.0),
//                 child: SelectableText(
//                   "CA/0032/2023",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const Align(
//                 alignment: Alignment.topCenter,
//                 child: Text(
//                   "Asunto:",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 4,
//                   horizontal: 8,
//                 ),
//                 child: textBoxInfo(),
//               ),
//               const Text(
//                 "Dirigido a:",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 4,
//                   horizontal: 8,
//                 ),
//                 child: textBoxInfo(),
//               ),
//               const Text(
//                 "Fecha de emision:",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 4,
//                   horizontal: 8,
//                 ),
//                 child: textBoxInfo(),
//               ),
//               const Text(
//                 "Tipo de oficio:",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 4,
//                   horizontal: 8,
//                 ),
//                 child: textBoxInfo(),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 177, 30, 30),
//                     foregroundColor: Colors.white,
//                   ),
//                   child: const Text('Descartar'),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 21, 48, 93),
//                     foregroundColor: Colors.white,
//                   ),
//                   child: const Text('Previsualizar'),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 21, 48, 93),
//                     foregroundColor: Colors.white,
//                   ),
//                   child: const Text('Generar y Guardar'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Container textBoxInfo() {
//     return Container(
//       height: 32,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black26),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: const SizedBox(
//           width: double.infinity,
//           child: Center(child: SelectableText("skdvbsadkvjsdb"))),
//     );
//   }
// }
