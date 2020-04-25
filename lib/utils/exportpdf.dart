// import 'dart:io';
// import 'dart:typed_data';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';

// Future exportPDF( Uint8List canvas, String fileName, String path) async{
//  final myDir = Directory('/data/user/0/com.example.sqfentity/files/')
//   ..exists().then((isThere) {
//     isThere ? print('DIRECTORYINEXISTENCE!') : Directory('/data/user/0/com.example.sqfentity/files/').create()
//     // The created directory is returned as a Future.
//     .then((Directory directory) {
//       print('SSSPPPPPPPPPPPPPPPPPPPPPPPSSS');
//       print(directory.path);
//   });
//   });
   
//   final pdf = Document();
//   final png = Document();
//   final String extenpdf = '.pdf';
//   final String extenpng = '.png';
//   final filepdf = File(path+fileName+extenpdf);
//   final filepng = File(path+fileName+extenpng);
// final image = PdfImage(
//   pdf.document,
//   image: canvas,
//   width: 50,
//   height: 50,
// );

// pdf.addPage(
//   Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (Context context) {
//         return Center(
//           child: Image(image),
//         );
//         // return Center(
//         //   child: canvas,
//         // ); // Center
//       }));

//       await filepdf.writeAsBytes(pdf.save());
//       // await filepng.writeAsBytes(png.save());

// }