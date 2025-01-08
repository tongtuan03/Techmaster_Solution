import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AudioTextHighlighter(),
    );
  }
}

class AudioTextHighlighter extends StatefulWidget {
  @override
  _AudioTextHighlighterState createState() => _AudioTextHighlighterState();
}

class _AudioTextHighlighterState extends State<AudioTextHighlighter> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String _imagePath = 'assets/images/james-say-hello-to-lan.jpg';
  final List<List<dynamic>> timestamps = [
    [75, 188, 0, "Chào", 0, 4],
    [275, 388, 0, "Lan", 5, 3],
    [675, 100, 1, "!", 8, 1],
    [1050, 225, 0, "Mình", 10, 4],
    [1287, 188, 0, "là", 15, 2],
    [1487, 388, 0, "James", 18, 5],
    [1975, 213, 1, ",", 23, 1],
    [2187, 213, 0, "đến", 25, 3],
    [2412, 250, 0, "từ", 29, 2],
    [2675, 213, 0, "Hoa", 32, 3],
    [2900, 463, 0, "Kỳ", 36, 2],
    [3375, 100, 1, ".", 38, 1],
    [3762, 175, 0, "Rất", 40, 3],
    [3950, 225, 0, "vui", 44, 3],
    [4187, 200, 0, "được", 48, 4],
    [4400, 163, 0, "gặp", 53, 3],
    [4575, 400, 0, "bạn", 57, 3],
    [4987, 100, 1, ".", 60, 1],
    [5337, 213, 0, "Chào", 62, 4],
    [5612, 250, 0, "James", 67, 5],
    [5900, 50, 1, "!", 72, 1],
    [6787, 213, 0, "Mình", 74, 4],
    [7025, 163, 0, "là", 79, 2],
    [7212, 325, 0, "Lan", 82, 3],
    [7600, 188, 1, ",", 85, 1],
    [7800, 238, 0, "đến", 87, 3],
    [8087, 138, 0, "từ", 91, 2],
    [8250, 200, 0, "Việt", 94, 4],
    [8487, 250, 0, "Nam", 99, 3],
    [8762, 50, 1, ".", 102, 1],
    [9637, 175, 0, "Rất", 104, 3],
    [9862, 225, 0, "vui", 108, 3],
    [10125, 163, 0, "được", 112, 4],
    [10312, 225, 0, "làm", 117, 3],
    [10575, 213, 0, "quen", 121, 4],
    [10825, 188, 0, "với", 126, 3],
    [11050, 288, 0, "bạn", 130, 3],
    [11362, 25, 1, ".", 133, 1],
    [12262, 200, 0, "Bạn", 135, 3],
    [12475, 200, 0, "làm", 139, 3],
    [12687, 275, 0, "nghề", 143, 4],
    [12975, 213, 0, "gì", 148, 2],
    [13200, 388, 0, "vậy", 151, 3],
    [13675, 300, 1, ",", 154, 1],
    [13975, 388, 0, "Lan", 156, 3],
    [14375, 100, 1, "?", 159, 1],
    [14725, 225, 0, "Mình", 161, 4],
    [14975, 150, 0, "là", 166, 2],
    [15212, 113, 0, "cô", 169, 2],
    [15387, 175, 0, "giáo", 172, 4],
    [15612, 200, 0, "dạy", 177, 3],
    [15862, 213, 0, "ngoại", 181, 5],
    [16125, 288, 0, "ngữ", 187, 3],
    [16475, 13, 1, ".", 190, 1],
    [17325, 188, 0, "Còn", 192, 3],
    [17587, 325, 0, "bạn", 196, 3],
    [17925, 25, 1, "?", 199, 1],
    [18800, 213, 0, "Mình", 201, 4],
    [19025, 200, 0, "là", 206, 2],
    [19237, 238, 0, "kỹ", 209, 2],
    [19487, 213, 0, "sư", 212, 2],
    [19712, 250, 0, "hàng", 215, 4],
    [19975, 413, 0, "không", 220, 5],
    [20400, 100, 1, ".", 225, 1],
    [20750, 200, 0, "Nghe", 227, 4],
    [21025, 138, 0, "thú", 232, 3],
    [21175, 188, 0, "vị", 236, 2],
    [21450, 300, 0, "quá", 239, 3],
    [21787, 13, 1, "!", 242, 1],
    [22637, 213, 0, "Bạn", 244, 3],
    [22912, 213, 0, "đến", 248, 3],
    [23137, 175, 0, "Việt", 252, 4],
    [23350, 225, 0, "Nam", 257, 3],
    [23587, 163, 0, "lâu", 261, 3],
    [23812, 225, 0, "chưa", 265, 4],
    [24075, 13, 1, "?", 269, 1],
    [24962, 175, 0, "Mình", 271, 4],
    [25150, 150, 0, "mới", 276, 3],
    [25312, 188, 0, "đến", 280, 3],
    [25512, 213, 0, "đây", 284, 3],
    [25737, 225, 0, "được", 288, 4],
    [25975, 200, 0, "vài", 293, 3],
    [26187, 438, 0, "ngày", 297, 4],
    [26637, 100, 1, ".", 301, 1],
    [26987, 163, 0, "Hy", 303, 2],
    [27187, 213, 0, "vọng", 306, 4],
    [27462, 188, 0, "bạn", 311, 3],
    [27675, 163, 0, "sẽ", 315, 2],
    [27900, 113, 0, "thích", 318, 5],
    [28075, 175, 0, "Việt", 324, 4],
    [28275, 288, 0, "Nam", 329, 3],
    [28587, 25, 1, "!", 332, 1],
    [29500, 213, 0, "Cảm", 334, 3],
    [29725, 188, 0, "ơn", 338, 2],
    [29925, 388, 0, "Lan", 341, 3],
    [30325, 100, 1, "!", 344, 1]
  ];

  int currentIndex = -1;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _startAudio() async {
    const audioPath = "audios/ouput.wav"; // Đường dẫn file audio
    await _audioPlayer.play(AssetSource(audioPath));
    Future.delayed(Duration(microseconds: 5337), () {
      setState(() {
        // Đổi ảnh
        _imagePath = 'assets/images/lan-say-hello-to-james.jpg'; // Đặt ảnh mới
      });
    });
    // Lắng nghe thời gian phát
    _audioPlayer.onPositionChanged.listen((Duration position) {
      int elapsedMilliseconds = position.inMilliseconds;
      for (int i = 0; i < timestamps.length; i++) {
        int start = timestamps[i][0];
        num end = start + timestamps[i][1];
        if (elapsedMilliseconds >= start && elapsedMilliseconds < end) {
          setState(() {
            currentIndex = i;
          });
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String fullText = timestamps.map((e) => e[3]).join(" ");

    return Scaffold(
      appBar: AppBar(title: Text("Audio Text Highlighter")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(_imagePath), // Đường dẫn ảnh từ thư mục assets
            ),
            RichText(
              text: TextSpan(
                children: timestamps.map((data) {
                  final isCurrent = timestamps.indexOf(data) == currentIndex;
                  return TextSpan(
                    text: "${data[3]} ",
                    style: TextStyle(
                      color: isCurrent ? Colors.blue : Colors.black,
                      fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    ),
                  );
                }).toList(),
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startAudio,
              child: Text("Play Audio"),
            ),
          ],
        ),
      ),
    );
  }
}
