import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoPlaying extends StatefulWidget {
  const VideoPlaying({Key? key}) : super(key: key);

  @override
  State<VideoPlaying> createState() => _VideoPlayingState();
}

class _VideoPlayingState extends State<VideoPlaying> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/Prosthetic_Arm.mp4')
          ..initialize().then((_) {
            print('initialize');
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                  ),
                ),
                _controller.value.isPlaying
                    ? Container()
                    : Positioned.fill(
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                          child: Icon(
                            Icons.play_arrow,
                            size: 50.h,
                            color: Colors.white,
                          ),
                        ),
                      )
              ],
            ),
          )
        : const SizedBox(child: Text('No  Video'));
  }
}
