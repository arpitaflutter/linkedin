import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkedin/model.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  TextEditingController txtname = TextEditingController();
  TextEditingController txtusrid = TextEditingController();
  TextEditingController txtcname = TextEditingController();
  TextEditingController txtqts = TextEditingController();

  String image = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("LinkedIn post"),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15,),
                CircleAvatar(
                  backgroundImage: FileImage(File("$image")),backgroundColor: Colors.cyan,radius: 50,
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: () async{
                  ImagePicker p2 = ImagePicker();
                  XFile? xfile = await p2.pickImage(source: ImageSource.gallery);

                  setState(() {
                    image = xfile!.path;
                  });
                },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan.shade700,fixedSize: Size.fromHeight(50),),
                    child: Text("Gallery",style: TextStyle(fontSize: 20),)),
                SizedBox(height: 15,),
                TextField(
                  controller: txtname,
                  decoration: InputDecoration(
                    hintText: "Name:",
                    border: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txtcname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Comapany name:",
                    disabledBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txtusrid,
                  decoration: InputDecoration(
                    hintText: "User ID:",
                    border: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txtqts,
                  decoration: InputDecoration(
                    hintText: "Quotes:",
                    border: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed:  () {
                  Postmodel p1 = Postmodel(n1 : txtname.text, c1: txtcname.text, q1: txtqts.text, i1: txtusrid.text,path: image);

                  Navigator.pushNamed(context, 'data',arguments: p1);
                },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan.shade700,fixedSize: Size.fromHeight(50),),
                    child: Text("Generate post",style: TextStyle(fontSize: 20),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}