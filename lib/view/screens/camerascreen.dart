import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:gradproject/provider/search_provider.dart';
import 'package:gradproject/view/screens/camerascreen.dart';
import 'package:gradproject/view/screens/recommendation_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tflite/tflite.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';

class Camerascreen extends StatefulWidget {
   Camerascreen({Key? key}) : super(key: key);
  final user =FirebaseAuth.instance.currentUser;
  @override
  State<Camerascreen> createState() => CamerascreenState();
}

class CamerascreenState extends State<Camerascreen> {
  //Variables
  late Future<File> imageFile;
  bool _loading = true;
  late File _image;
  String result = '';
  late ImagePicker imagePicker;

  //Functions
  // List<double> imagemean=[0.485, 0.456, 0.406];
  // List<double> imagestd = [0.229, 0.224, 0.225];

// selecting photo
  selectPhoto() async {
    var image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
      _loading = false; //temp change later
    }

    setState(() {
      _loading; //temp change later
      _image;
      doImageClassification();
    });

    /* final PickedFile =  await imagePicker.pickImage(source: ImageSource.gallery);
    if(PickedFile != null )
      {
        _image = File(PickedFile.path);
        img.Image? image = img.decodeImage(_image.readAsBytesSync());
        img.Image resizedImage = img.copyResize(image!, width: 224, height: 224);
        Float32List input = Float32List(224*224*3);
        int pixelIndex = 0;
        for(int i =0; i<224; i++)
          {
            for(int j=0; j<224; j++)
              {
                int pixel= resizedImage.getPixel(j,i);
                input[pixelIndex++]= (img.getRed(pixel) - imagemean[0] / imagestd[0];
                input[pixelIndex++]= (img.getGreen(pixel) - imagemean[1] / imagestd[1];
                input[pixelIndex++]= (img.getBlue(pixel) - imagemean[2] / imagestd[2];

              }
      }  */

  }

// capture from camera
  capturePhoto() async {
    var image = await imagePicker.pickImage(source: ImageSource.camera);

    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
      _loading = false; //temp change later
    }

    setState(() {
      _image;
      _loading; //temp change later
      doImageClassification();
    });
  }

// load model
  loadDataModel() async {
    print("load model");

    var result = await Tflite.loadModel(
        model: 'assets/mobilenet_model.tflite',
        labels: 'assets/labels.txt',
        numThreads: 1,
        useGpuDelegate: false);
    print(result);
    //print(output);
  }

  // prediction
  doImageClassification() async {
    print("image classify");
    var recognition = await Tflite.runModelOnImage(
        path: _image.path,
        imageMean:  127.5,
        imageStd:  127.5,
        numResults: 1,
        threshold: 0.5,
        asynch: true);

    print(recognition?.length.toString());
    //print(recognition);

    setState(() {
      result = '';
    });

    // result = recognition[0]['label'];

    recognition?.forEach((element) {
      setState(() {
        print(element.toString());
        result += element['label'];
        print(result);
      });
    });

    /*  if(_image == null)
      return;
    final List<dynamic>? output= await Tflite.runModelOnImage(path: _image!.path, numResults: 1, imageStd: [58.395, 57.12, 57.375], threshold: 0.5, imageMean: [123.68, 116.78, 103.94]);
  */
  }



  // initilaizing

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    loadDataModel();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context).getuser();
    var provider1 = Provider.of<AuthProvider>(context);
    return Consumer<Searchprovider>(builder: (context,provider,child)
    {
     return Scaffold(
        body: Container(
          height: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.deepPurple[50],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: _loading == true
                      ? null //show nothing if no picture selected
                      : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          /*MediaQuery
                          .of(context)
                          .size
                          .width * 0.5,*/
                          width: 250,
                          /*MediaQuery
                          .of(context)
                          .size
                          .width * 0.5,*/
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              _image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Divider(
                          height: 25,
                          thickness: 1,
                        ),
                        // ignore: unnecessary_null_comparison
                        result != null
                            ? Text(
                          'The ingredient is: ${result + ' '}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                            : Container(),
                        Divider(
                          height: 25,
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: capturePhoto,
                      child: Container(
                        width: 224,
                        /*MediaQuery
                        .of(context)
                        .size
                        .width - 200,*/
                        alignment: Alignment.center,
                        padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: AlignmentDirectional.topStart,
                                end: AlignmentDirectional.bottomEnd,
                                colors: [
                                  Colors.cyan.shade100,
                                  Colors.deepPurple.shade50,
                                  Colors.purple.shade200
                                ]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Take A Photo',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: selectPhoto,
                      child: Container(
                        width: /*MediaQuery
                        .of(context)
                        .size
                        .width - 200,*/ 224,
                        alignment: Alignment.center,
                        padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: AlignmentDirectional.topStart,
                                end: AlignmentDirectional.bottomEnd,
                                colors: [
                                  Colors.cyan.shade100,
                                  Colors.deepPurple.shade50,
                                  Colors.purple.shade200
                                ]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Pick From Gallery',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        List key = provider1.model.preference;
                        provider.getAllSearchrecipe(result, key);
                        Navigator.of(context).push(MaterialPageRoute(builder:(context)=> RecommendedScreen()
                        ));
                      },
                      child: Container(
                        width: 224,
                        alignment: Alignment.center,
                        padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: AlignmentDirectional.topStart,
                                end: AlignmentDirectional.bottomEnd,
                                colors: [
                                  Colors.cyan.shade100,
                                  Colors.deepPurple.shade50,
                                  Colors.purple.shade200
                                ]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Recommendation meals',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    );
  }
}
