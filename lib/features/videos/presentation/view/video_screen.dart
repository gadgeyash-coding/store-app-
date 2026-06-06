import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy video data
    final List<Map<String, String>> videoData = [
      {
        'url': 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        'name': 'Velvet & Oak',
        'location': 'Austin, TX',
        'products': '142',
        'likes': '4.2k'
      },
      {
        'url': 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        'name': 'Maple & Pine',
        'location': 'Seattle, WA',
        'products': '98',
        'likes': '2.5k'
      },
      {
        'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
        'name': 'Cedar & Stone',
        'location': 'Denver, CO',
        'products': '210',
        'likes': '5.1k'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoData.length,
        itemBuilder: (context, index) {
          return VideoItem(data: videoData[index]);
        },
      ),
    );
  }
}

class VideoItem extends StatefulWidget {
  final Map<String, String> data;
  const VideoItem({super.key, required this.data});

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;
  bool _initialized = false;
  bool _isLiked = false; // State to track like

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.data['url']!))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _initialized = true;
          });
          _controller.setLooping(true);
          _controller.play();
          _controller.setVolume(0); // Muted by default
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Video Player
        _initialized
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.orange),
              ),

        // Overlay Gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.transparent,
                Colors.black.withOpacity(0.6),
              ],
            ),
          ),
        ),

        // Play/Pause Toggle on Tap
        GestureDetector(
          onTap: () {
            setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });
          },
          child: Container(
            color: Colors.transparent,
            child: !_controller.value.isPlaying && _initialized
                ? const Center(
                    child: Icon(Icons.play_arrow, color: Colors.white54, size: 80),
                  )
                : const SizedBox.shrink(),
          ),
        ),

        // Back Button
        Positioned(
          top: 50,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
            onPressed: () {},
          ),
        ),

        // Bottom Content
        Positioned(
          bottom: 30,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Vendor Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Vendor Image
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.yellow, width: 2),
                                image: const DecorationImage(
                                  image: NetworkImage('https://via.placeholder.com/150'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.data['name']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, color: Colors.white, size: 12),
                                    Text(
                                      ' ${widget.data['location']} • ${widget.data['products']} Products',
                                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Action Icons
                  Column(
                    children: [
                      const Icon(Icons.send_outlined, color: Colors.white, size: 28),
                      const SizedBox(height: 20),
                      // Interactive Like Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLiked = !_isLiked;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                _isLiked ? Icons.favorite : Icons.favorite_border,
                                color: _isLiked ? Colors.red : Colors.white,
                                size: 24,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.data['likes']!,
                                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Shop Now Button
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white38),
                ),
                child: const Center(
                  child: Text(
                    'Shop Now',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
