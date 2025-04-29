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

class TalwatEQuran extends StatefulWidget {
  @override
  _TalwatEQuranState createState() => _TalwatEQuranState();
}

class _TalwatEQuranState extends State<TalwatEQuran> {
  final List<Surah> surahs = [
    Surah(title: '99 names of Allah', image: AppImages.pic4, audioUrl: 'https://www.naataudio.com/UserFiles/1629399676/audio1629399906.mp3'),
    Surah(title: 'Surah Ad-Duha', image: AppImages.pic6, audioUrl: 'https://server8.mp3quran.net/afs/093.mp3'),
    Surah(title: 'Surah Ar-Rahman', image: AppImages.pic2, audioUrl: 'https://server8.mp3quran.net/afs/055.mp3'),
    Surah(title: 'Surah Al-Baqarah', image: AppImages.pic3, audioUrl: 'https://server8.mp3quran.net/afs/002.mp3'),
    Surah(title: 'Surah Al-Baqarah', image: AppImages.pic4, audioUrl: 'https://server8.mp3quran.net/afs/002.mp3'),
    Surah(title: 'Surah Quraysh', image: AppImages.pic5, audioUrl: 'https://server8.mp3quran.net/afs/106.mp3'),
    Surah(title: 'Surah Al-Asr', image: AppImages.pic6, audioUrl: 'https://server8.mp3quran.net/afs/103.mp3'),
    Surah(title: 'Surah Al-Ikhlas', image: AppImages.pic7, audioUrl: 'https://server8.mp3quran.net/afs/112.mp3'),
    Surah(title: 'Surah Al-Fatiha', image: AppImages.pic6, audioUrl: 'https://server8.mp3quran.net/afs/001.mp3'),
    Surah(title: 'Ayat-ul-kursi', image: AppImages.pic1, audioUrl: 'https://www.nooresunnat.com/Audio/Others/Complete%20Ayat%20ul%20Kursi%20Audio%20Recitation%20With%20Urdu%20Hindi%20Translation.mp3'),
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  int? _currentlyPlayingIndex;

  @override
  void initState() {
    super.initState();
    _audioPlayer.setReleaseMode(ReleaseMode.loop);

    _audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPause(int index) async {
    if (_currentlyPlayingIndex == index) {
      if (_audioPlayer.state == PlayerState.playing) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
    } else {
      await _audioPlayer.stop();
      await _audioPlayer.setSourceUrl(surahs[index].audioUrl);
      await _audioPlayer.resume();
      setState(() {
        _currentlyPlayingIndex = index;
      });
    }
  }

  String formatTime(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
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
          final surah = surahs[index];
          final isPlaying = _currentlyPlayingIndex == index && _audioPlayer.state == PlayerState.playing;
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
                      surah.image,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    surah.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  if (_currentlyPlayingIndex == index)
                    Column(
                      children: [
                        Slider(
                          min: 0,
                          max: _duration.inSeconds > 0 ? _duration.inSeconds.toDouble() : 1,
                          value: _position.inSeconds.toDouble().clamp(0, _duration.inSeconds > 0 ? _duration.inSeconds.toDouble() : 1),
                          onChanged: (value) async {
                            final position = Duration(seconds: value.toInt());
                            await _audioPlayer.seek(position);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatTime(_position)),
                            Text(formatTime(_duration - _position)),
                          ],
                        ),
                      ],
                    ),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 20,
                    child: IconButton(
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      iconSize: 20,
                      onPressed: () => _playPause(index),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
