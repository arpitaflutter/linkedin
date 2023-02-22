import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:linkedin/model.dart';

class data extends StatefulWidget {
  const data({Key? key}) : super(key: key);

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {

  final GlobalKey globalKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    Postmodel p1 = ModalRoute.of(context)!.settings.arguments as Postmodel;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Post"),
          centerTitle: true,
          backgroundColor: Colors.cyan.shade700,
          actions: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {
                  captureImage();
                }, icon: Icon(Icons.save),
              ),
            )
          ],
        ),
        body: RepaintBoundary(
          key: globalKey,
          child: Container(
              height: 400,width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.cyan.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child:Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       CircleAvatar(radius: 50,backgroundImage: FileImage(File("${p1.path}")),),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${p1.n1}",style: TextStyle(fontSize: 20)),
                            SizedBox(height: 5,),
                            Text("${p1.c1} | ${p1.q1}",style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Center(child: Text("${p1.q1}",style: TextStyle(fontSize: 25),textAlign: TextAlign.justify))
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

  void captureImage() async{

     RenderRepaintBoundary? boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;

     final ui.Image? image = await boundary?.toImage();

     final ByteData? byteData = await image!.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes = byteData!.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(pngBytes,name: "My Post.png",quality: 50);
    print(result);
  }

}