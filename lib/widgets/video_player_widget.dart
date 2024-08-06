// ignore_for_file: use_colored_box

import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;

  VideoPlayerWidget({required this.url});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  final FijkPlayer player = FijkPlayer();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    player
      ..setDataSource(widget.url, autoPlay: true)
      ..setLoop(0)
      ..addListener(_playerValueListener);
  }

  void _playerValueListener() {
    if (player.value.state == FijkState.started) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Theme.of(context).colorScheme.background,
                child: FijkView(
                  player: player,
                  fit: FijkFit.cover,
                  panelBuilder: (FijkPlayer player, FijkData data,
                      BuildContext context, Size viewSize, Rect texturePos) {
                    return Container();
                  },
                ),
              ),
            ),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    player
      ..removeListener(_playerValueListener)
      ..release();
    super.dispose();
  }
}
