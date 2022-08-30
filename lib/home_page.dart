import 'dart:io';

import 'package:flutter/services.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reader_app/file_list.dart';

List<String> imgList = [
  'assets/images/carousel1.png',
  'assets/images/carousel2.png',
  'assets/images/carousel3.png',
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  // List<String> bulan = [
  //   "Januari",
  //   "Februari",
  //   "Maret",
  //   "April",
  //   "Mei",
  //   "Juni",
  //   "Juli",
  //   "Agustus",
  //   "September",
  //   "Oktober",
  //   "November",
  //   "Desember"
  // ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final List<Widget> imageSliders = imgList
  // ignore: avoid_unnecessary_containers
      .map((item) =>
      SizedBox(
        // ignore: avoid_unnecessary_containers
        width: double.infinity,
        height: double.infinity,
        // ignore: avoid_unnecessary_containers
        child: Stack(
          children: <Widget>[
            Image.asset(
              item,
              fit: BoxFit.cover,
              width: 1000,
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ))
      .toList();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        actions: [
          Expanded(
            child: CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1,
              ),
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(25, 50, 25, 25),
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    fileDoc();
                  },
                  child: Image.asset(
                    'assets/images/vscode-icons_file-type-word2.png',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 50, 25, 25),
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    filePpt();
                  },
                  child: Image.asset(
                    'assets/images/vscode-icons_file-type-powerpoint2.png',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 50, 25, 25),
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    fileXls();
                  },
                  child: Image.asset(
                    'assets/images/vscode-icons_file-type-excel2.png',
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                margin: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    filePdf();
                  },
                  child: Image.asset(
                    'assets/images/vscode-icons_file-type-pdf2.png',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                margin: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    fileTxt();
                  },
                  child: Image.asset(
                    'assets/images/vscode-icons_file-type-text.png',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                margin: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    fileAny();
                  },
                  child: Image.asset(
                    'assets/images/vscode-icons_default-folder-opened.png',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          // ignore: avoid_unnecessary_containers
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     border: Border.all(
          //       color: Colors.transparent,
          //       width: 0,
          //     ),
          //     borderRadius: const BorderRadius.only(
          //       topLeft: Radius.circular(30),
          //       topRight: Radius.circular(30),
          //     ),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.withOpacity(0.5),
          //         spreadRadius: 5,
          //         blurRadius: 7,
          //         offset: const Offset(0, 2),
          //       ),
          //     ],
          //   ),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.vertical,
          //     child: Column(
          //       children: <Widget>[
          //         // ignore: avoid_unnecessary_containers
          //         Container(
          //             alignment: Alignment.centerLeft,
          //             margin: const EdgeInsets.all(20),
          //             child: Column(
          //               children: [
          //                 Row(
          //                   children: const <Widget>[
          //                     Text(
          //                       "Selected Items",
          //                       style: TextStyle(
          //                         fontFamily: 'RobotoCondensed',
          //                         color: Colors.lightBlueAccent,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 20,
          //                       ),
          //                     ),
          //                     Spacer(),
          //                     Icon(
          //                       Icons.history,
          //                       size: 30,
          //                       color: Colors.lightBlueAccent,
          //                     )
          //                   ],
          //                 ),
          //               ],
          //             )),
          //         SizedBox(
          //           height: 94,
          //           child: ListView.builder(
          //             itemCount: bulan.length,
          //             itemBuilder: (context, index) {
          //               return Card(
          //                   // ignore: avoid_unnecessary_containers
          //                   child: Container(
          //                 margin: const EdgeInsets.all(10),
          //                 decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   border: Border.all(
          //                     color: Colors.transparent,
          //                     width: 0,
          //                   ),
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: Colors.grey.withOpacity(0.5),
          //                       spreadRadius: 2,
          //                       blurRadius: 5,
          //                       offset: const Offset(0, 1),
          //                     ),
          //                   ],
          //                 ),
          //                 child: Padding(
          //                     padding: const EdgeInsets.all(10),
          //                     child: ListTile(
          //                       title: Text(bulan[index]),
          //                     )),
          //               ));
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  FilePickerResult? result;
  PlatformFile? file;

  void fileDoc() async {
    result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['doc', 'docx'],
        allowMultiple: true
    );
    if (result == null) return;
    loadSelectedFiles(result!.files);
    await saveFilePermanently(file!);
  }

  void filePpt() async {
    result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['ppt', 'pptx'],
        allowMultiple: true
    );
    if (result == null) return;
    loadSelectedFiles(result!.files);
    await saveFilePermanently(file!);
  }

  void fileXls() async {
    result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xls', 'xlsx'],
        allowMultiple: true
    );
    if (result == null) return;
    loadSelectedFiles(result!.files);
    await saveFilePermanently(file!);
  }

  void filePdf() async {
    result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: true
    );
    if (result == null) return;
    loadSelectedFiles(result!.files);
    await saveFilePermanently(file!);
  }

  void fileTxt() async {
    result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt'],
        allowMultiple: true
    );
    if (result == null) return;
    loadSelectedFiles(result!.files);
    await saveFilePermanently(file!);
  }

  void fileAny() async {
    result = await FilePicker.platform.pickFiles(
        allowMultiple: true
    );
    if (result == null) return;
    loadSelectedFiles(result!.files);
    await saveFilePermanently(file!);
  }

  void loadSelectedFiles(List<PlatformFile> files) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>
            FileList(files: files, onOpenedFile: viewFile))
    );
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
  // getCard() {
  //   return Container(
  //       margin: const EdgeInsets.all(10),
  //       decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(8),
  //           boxShadow: const [
  //             BoxShadow(
  //               color: Color.fromRGBO(0, 64, 101, 0.15),
  //               spreadRadius: 1,
  //               blurRadius: 8,
  //               offset: Offset(0, 2), // changes position of shadow
  //             ),
  //           ]),
  //       padding: const EdgeInsets.all(15),
  //       height: 90,
  //       width: double.infinity,
  //       child: Row(
  //         children: <Widget>[
  //           Padding(
  //               padding: const EdgeInsets.only(left: 5, right: 5),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: const <Widget>[
  //                   Text("01:53PM"),
  //                   Text("01:53PM"),
  //                   // Text(
  //                   //     "7/1, 2nd block more adress etc."),
  //                 ],
  //               )),
  //           Padding(
  //               padding: const EdgeInsets.only(left: 5, right: 5),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: <Widget>[
  //                   Padding(
  //                       padding: const EdgeInsets.only(top: 3),
  //                       child: getDot(true)),
  //                   getDot(false),
  //                   getDot(false),
  //                   getDot(false),
  //                   getDot(false),
  //                   Padding(
  //                       padding: const EdgeInsets.only(bottom: 3),
  //                       child: getDot(true)),
  //                 ],
  //               )),
  //           Padding(
  //               padding: const EdgeInsets.only(left: 5, right: 5),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: const <Widget>[
  //                   Text("333 Prospect St, Niagara Falls, NY 14303"),
  //                   Text("333 Prospect St, Niagara Falls, NY 14303"),
  //                 ],
  //               ))
  //         ],
  //       ));


// Widget getDot(bool isBig) {
//   return Container(
//       margin: const EdgeInsets.only(top: 3),
//       width: isBig ? 8 : 4,
//       height: isBig ? 8 : 4,
//       decoration: BoxDecoration(
//           color: Colors.green, borderRadius: BorderRadius.circular(15.0)));
// }

// class ItemCard extends StatelessWidget {
//   final String title;
//   const ItemCard({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: BoxDecoration(
//         color:
//             Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
//         boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 20),
//         ],
//       ),
//       child: Center(
//         child: Text(title),
//       ),
//     );
//   }
// }
