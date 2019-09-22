import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stegify/flutter_stegify.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: StegifyWidget(),
      ),
    );
  }
}

class StegifyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StegifyState();
  }
}

class StegifyState extends State<StegifyWidget> {
  bool decode;
  Image image;

  @override
  void initState() {
    decode = false;
    _copyImageFromAsset("street.jpeg");
    _copyImageFromAsset("lake.jpeg");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 10),
      CupertinoButton(
        color: Colors.blue,
        child: Text(
          this.decode ? "Decode lake from street" : "Encode lake into street",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          Directory directory = await getApplicationDocumentsDirectory();
          File streetImage = File(directory.path + "/street.jpeg");
          File lakeImage = File(directory.path + "/lake.jpeg");

          if (this.decode) {
            // Decode result.jpeg into ../decoded.jpeg (should be lake image)
            // Here in decode we specify the result file extension explicitly.
            await Stegify.decode(directory.path + "/result.jpeg",
                directory.path + "/decoded.jpeg");

            setState(() {
              this.decode = !this.decode;
              // Display the decoded image (should be lake image)
              image = Image.file(File(directory.path + "/decoded.jpeg"));
            });
          } else {
            // Encode lake image into the street image and save it under ../result.jpeg
            // the .jpeg extension comes from the carrier's extension (street.jpeg)
            await Stegify.encode(
                streetImage.path, lakeImage.path, directory.path + "/result");

            setState(() {
              this.decode = !this.decode;
              // Display the encoded image (should be street image with lake image hidden in it)
              image = Image.file(File(directory.path + "/result.jpeg"));
            });
          }
        },
      ),
      SizedBox(height: 10),
      Center(
        child: image,
      ),
      SizedBox(height: 10),
      Text(
        this.decode
            ? "Result street image with lake image hidden in it"
            : "Result lake image extracted from street image encoded with it",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ]);
  }

  void _copyImageFromAsset(String imageName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    ByteData data = await rootBundle.load("assets/" + imageName);
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    File(directory.path + "/" + imageName).writeAsBytes(bytes);
  }
}
