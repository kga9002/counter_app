import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const AudioWidget());

final player = AudioPlayer();

class AudioWidget extends StatefulWidget {
  const AudioWidget({super.key});

  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  PlayerState _playerState = PlayerState.stopped;
  double _currentSliderValue = 0;
  Duration _totalDuration = Duration.zero;
  Duration _currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    player.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        _playerState = s;
      });
      print('현재 플레이어 상태 (UI 업데이트용): $_playerState'); // 디버깅
    });

    player.onDurationChanged.listen((Duration d) {
      setState(() {
        _totalDuration = d;
      });
    });

    player.onPositionChanged.listen((Duration p) {
      setState(() {
        _currentPosition = p;
        if (_totalDuration.inSeconds > 0) {
          _currentSliderValue =
              _currentPosition.inSeconds.toDouble() /
              _totalDuration.inSeconds.toDouble();
        }
      });
    });
    player.onPlayerComplete.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _currentPosition = Duration.zero;
        _currentSliderValue = 0.0;
      });
    });
  }

  toggleMusic() async {
    try {
      if (_playerState == PlayerState.playing) {
        await player.pause();
        print('음악 일시정지됨');
      } else if (_playerState == PlayerState.paused) {
        await player.resume();
        print('음악 이어서 재생됨');
      } else {
        await player.play(
          UrlSource(
            "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
          ),
        );
        print('음악 재생 시작됨');
      }
    } catch (e) {
      print('재생/일시정지 오류: $e');
    }
  }

  Future<void> _stopMusic() async {
    try {
      await player.stop();
      setState(() {
        _currentPosition = Duration.zero;
        _currentSliderValue = 0.0;
      });
      print('음악 정지됨');
    } catch (e) {
      print('정지 오류: $e');
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MP3 플레이어")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 1,
              activeColor: Colors.blue,
              onChanged: (double newValue) {
                setState(() {
                  _currentSliderValue = newValue;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: toggleMusic,
                  child: Icon(
                    _playerState == PlayerState.playing
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.blue,
                  ),
                ),
                ElevatedButton(
                  onPressed: _stopMusic,
                  child: Icon(Icons.stop, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
