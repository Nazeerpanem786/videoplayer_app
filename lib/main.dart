
import 'package:flutter/material.dart';
import 'package:videoplayer_app/VideoPlayerScreen.dart';


void main(){
  runApp( MyApp());
}

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: VideoPlayerScreen(),
   );
  }

}
