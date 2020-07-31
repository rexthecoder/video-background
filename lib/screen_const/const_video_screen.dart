import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Starter function for backgroud video controller 
Widget videoScreen(VideoPlayerController controller) {
  return SizedBox.expand(
    child: FittedBox(
      fit: BoxFit.fill,
      child:SizedBox(          
        width: controller.value.size?.width ?? 0,
        height: controller.value.size?.height ?? 0,
        child: VideoPlayer(controller),
      ),
    ),
  );
}

        