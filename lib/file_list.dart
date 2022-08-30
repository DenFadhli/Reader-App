import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
class FileList extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const FileList({Key? key, required this.files, required this.onOpenedFile})
      : super(key: key);
  @override
  _FileListState createState() => _FileListState();
}
class _FileListState extends State<FileList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Selected Files'),
      ),
      body: ListView.builder(
          itemCount: widget.files.length,
          itemBuilder: (context, index) {
            final file = widget.files[index];
            return buildFile(file);
          }),
    );
    // return Scaffold(
    //   body: Column(
    //     children: <Widget> [
    //       Container(
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           border: Border.all(
    //             color: Colors.transparent,
    //             width: 0,
    //           ),
    //           borderRadius: const BorderRadius.only(
    //             topLeft: Radius.circular(30),
    //             topRight: Radius.circular(30),
    //           ),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.5),
    //               spreadRadius: 5,
    //               blurRadius: 7,
    //               offset: const Offset(0, 2),
    //             ),
    //           ],
    //         ),
    //         child: SingleChildScrollView(
    //           scrollDirection: Axis.vertical,
    //           child: Column(
    //             children: <Widget>[
    //               // ignore: avoid_unnecessary_containers
    //               Container(
    //                   alignment: Alignment.centerLeft,
    //                   margin: const EdgeInsets.all(20),
    //                   child: Column(
    //                     children: [
    //                       Row(
    //                         children: const <Widget>[
    //                           Text(
    //                             "Selected Items",
    //                             style: TextStyle(
    //                               fontFamily: 'RobotoCondensed',
    //                               color: Colors.lightBlueAccent,
    //                               fontWeight: FontWeight.bold,
    //                               fontSize: 20,
    //                             ),
    //                           ),
    //                           Spacer(),
    //                           Icon(
    //                             Icons.history,
    //                             size: 30,
    //                             color: Colors.lightBlueAccent,
    //                           )
    //                         ],
    //                       ),
    //                     ],
    //                   )),
    //               SizedBox(
    //                 height: 94,
    //                 child: ListView.builder(
    //                   itemCount: widget.files.length,
    //                   itemBuilder: (context, index) {
    //                     final file = widget.files[index];
    //                     return buildFile(file);
    //                     // return Card(
    //                     //   // ignore: avoid_unnecessary_containers
    //                     //     child: Container(
    //                     //       margin: const EdgeInsets.all(10),
    //                     //       decoration: BoxDecoration(
    //                     //         color: Colors.white,
    //                     //         border: Border.all(
    //                     //           color: Colors.transparent,
    //                     //           width: 0,
    //                     //         ),
    //                     //         boxShadow: [
    //                     //           BoxShadow(
    //                     //             color: Colors.grey.withOpacity(0.5),
    //                     //             spreadRadius: 2,
    //                     //             blurRadius: 5,
    //                     //             offset: const Offset(0, 1),
    //                     //           ),
    //                     //         ],
    //                     //       ),
    //                     //       // child: Padding(
    //                     //       //     padding: const EdgeInsets.all(10),
    //                     //       //     child: ListTile(
    //                     //       //       title: Text(bulan[index]),
    //                     //       //     )),
    //                     //     ));
    //                   },
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return InkWell(
      onTap: () => widget.onOpenedFile(file),
      child: ListTile(
        // leading: (file.extension == 'jpg' || file.extension == 'png')
        //     ? Image.file(
        //   File(file.path.toString()),
        //   width: 80,
        //   height: 80,
        // )
        //     : Container(
        //   width: 80,
        //   height: 80,
        // ),
        title: Text('${file.name}'),
        subtitle: Text('${file.extension}'),
        trailing: Text(
          '$size',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}