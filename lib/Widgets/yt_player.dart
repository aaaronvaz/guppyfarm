import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:guppy_farm/Widgets/yt_button.dart';

class YtPlayer extends StatefulWidget {
  const YtPlayer({super.key});

  @override
  State<YtPlayer> createState() => _YtPlayerState();
}

class _YtPlayerState extends State<YtPlayer> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(
            "https://www.youtube.com/watch?v=9GrQ7sgkAfo",
          )!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        showLiveFullscreenButton: false,
        disableDragSeek: false,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.addListener(() {
        debugPrint("Controller State: ${_controller.value.isReady}");
        if (!_isPlayerReady && _controller.value.isReady) {
          setState(() {
            _isPlayerReady = true;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Join Us On Youtube',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 225,
            width: double.infinity,
            child:
                _isPlayerReady
                    ? YoutubePlayer(
                      controller: _controller,
                      bottomActions: [],
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.blueAccent,
                      onReady: () {
                        setState(() {
                          _isPlayerReady = true;
                        });
                        debugPrint("Player is ready.");
                      },
                    )
                    : Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 225,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
          ),
          const YtButton(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
