import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: NativePluginWidget(),
    );
  }
}

class NativePluginWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NativePluginWidgetState();
  }
}
class NativePluginWidgetState extends State<NativePluginWidget>{
  XFile? _image;

  Future getGalleryImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
  Future getCameraImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker '),),
      body: Container(
        color: Colors.purple,
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           ElevatedButton(
               onPressed: getGalleryImage,
               child: Text(
                 'gallery'
               )
           ),
              Center(
                child: _image == null
                    ? Text(
                  'No Image'
                )
                    :CircleAvatar(
                  backgroundImage: FileImage(File(_image!.path)),
                  radius: 100,
                )
              ),
              ElevatedButton(
                  onPressed: getCameraImage,
                  child: Text(
                      'camera'
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}


