import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

import 'open_pdf_util.dart';
import 'open_pdf.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  double? _height, _width;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var whatsNewList;

  @override
  void initState() {
    debugPrint("AllNews");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: _height,
          width: _width,
          // decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topLeft,
          //         end: Alignment.bottomRight,
          //         colors: [Color(0xFF4fbcf4), Color(0xFFf4fcff)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  var file = await OpenPdfUtil().loadPdfFromNetwork("abc.pdf");
                  final _extension = path.extension(file.path);
                  String url = "abc.pdf";
                  print("url: $url file: $file extension: $_extension");
                  // setState(() {});
                  Future.delayed(Duration(milliseconds: 0), () {
                    _extension != ".pdf"
                        ? Text("Not Available")
                        : Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OpenPDF(
                                file: file,
                                url: url,
                              ),
                            ),
                          );
                  });
                },
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 10, top: 15, bottom: 8),
                    child: Text("Open PDF")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
