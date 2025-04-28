import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../utilis/Constants/app_colors.dart';
import '../../utilis/Constants/app_images.dart';

class Surah {
  final String title;
  final String image;
  final String audioUrl;

  Surah({required this.title, required this.image, required this.audioUrl});
}

class TalwatEQuran extends StatelessWidget {
  final List<Surah> surahs = [

    Surah(title: '99 names of Allah',
        image: AppImages.pic4,
        audioUrl: 'https://www.naataudio.com/UserFiles/1629399676/audio1629399906.mp3'),

    Surah(
      title: 'Surah Ad-Duha',
      image: AppImages.pic6,
      audioUrl: 'https://server8.mp3quran.net/afs/093.mp3',
    ),
    Surah(
      title: 'Surah Ar-Rahman',
      image: AppImages.pic2,
      audioUrl: 'https://server8.mp3quran.net/afs/055.mp3',
    ),
    Surah(
      title: 'Surah Al-Baqarah',
      image: AppImages.pic3,
      audioUrl: 'https://server8.mp3quran.net/afs/002.mp3',
    ),
    Surah(
      title: 'Surah Al-Baqarah',
      image: AppImages.pic4,
      audioUrl: 'https://server8.mp3quran.net/afs/002.mp3',
    ),
    Surah(
      title: 'Surah Quraysh',
      image: AppImages.pic5,
      audioUrl: 'https://server8.mp3quran.net/afs/106.mp3',
    ),
    Surah(
      title: 'Surah Al-Asr',
      image: AppImages.pic6,
      audioUrl: 'https://server8.mp3quran.net/afs/103.mp3',
    ),
    Surah(
      title: 'Surah Al-Ikhlas',
      image: AppImages.pic7,
      audioUrl: 'https://server8.mp3quran.net/afs/112.mp3',
    ),
    Surah(title: 'Surah Al-Fatiha',
        image: AppImages.pic6,
        audioUrl: 'https://server8.mp3quran.net/afs/001.mp3'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        backgroundColor: AppColors.background1,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Tilawat-e-Quran',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: surahs.length,
        itemBuilder: (context, index) {
          return SurahPlayerWidget(surah: surahs[index]);
        },
      ),
    );
  }
}

class SurahPlayerWidget extends StatefulWidget {
  final Surah surah;
  const SurahPlayerWidget({required this.surah});

  @override
  _SurahPlayerWidgetState createState() => _SurahPlayerWidgetState();
}

class _SurahPlayerWidgetState extends State<SurahPlayerWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.setSourceUrl(widget.surah.audioUrl);

    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() => isPlaying = state == PlayerState.playing);
    });

    _audioPlayer.onDurationChanged.listen((d) {
      setState(() => duration = d);
    });

    _audioPlayer.onPositionChanged.listen((p) {
      setState(() => position = p);
    });
  }

  String formatTime(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.surah.image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.surah.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble().clamp(0, duration.inSeconds.toDouble()),
              onChanged: (value) async {
                await _audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position)),
                Text(formatTime(duration - position)),
              ],
            ),
            CircleAvatar(
              radius: 20,
              child: IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 20,
                onPressed: () async {
                  if (isPlaying) {
                    await _audioPlayer.pause();
                  } else {
                    await _audioPlayer.resume();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
