import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../models/news.dart';

class ImageInput extends StatefulWidget{

  final Function setImage;
  final News product;

  ImageInput(this.setImage, this.product);



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput>{

  File _imageFile;

  void _getImage(BuildContext context, ImageSource source){
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image){
      setState(() {
        _imageFile = image;
      });
      widget.setImage(image);

    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        OutlineButton(
          borderSide: BorderSide(color: Colors.purple[700],
          width: 2.5,
          ),
            onPressed: () {
            _getImage(context, ImageSource.camera);
            },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.camera_alt, color: Colors.purple[700],),
              SizedBox(
                width: 5.0,
              ),
              Text('Add Image', style: TextStyle(color:Colors.purple[700],),)
            ],
          ),
        ),
        SizedBox(height: 10.0),
        _imageFile == null ? Text('Please add an Image')
            :Image.file(_imageFile,

          height: 400.0,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topCenter,
        )
      ],
    ) ;
  }
}