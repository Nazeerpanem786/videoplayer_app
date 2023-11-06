
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayerScreen extends StatefulWidget{



  @override
  State<VideoPlayerScreen> createState() =>  _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>{

  late VideoPlayerController _controller;

  late Future<void> _initVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
    _initVideoPlayerFuture = _controller.initialize();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(
       title: const Text('Butterfly Video',style: TextStyle(color: Colors.black87),
       ),
       centerTitle: true,
     ),
     body: FutureBuilder(
       future: _initVideoPlayerFuture,
       builder:(context,snapshot){
         if(snapshot.connectionState == ConnectionState.done){
           return AspectRatio(
               aspectRatio: _controller.value.aspectRatio,
             child: VideoPlayer(_controller),
           );
         }else{
           return const Center(
             child: CircularProgressIndicator(),
           );
         }
       },
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         setState(() {
           if(_controller.value.isPlaying){
             _controller.pause();
           }else{
             _controller.play();
           }
         });
       },
       child: Icon(_controller.value.isPlaying? Icons.pause : Icons.play_arrow)
      ),
    );
  }


}

