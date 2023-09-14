import 'package:flutter/material.dart';
import 'package:nomadcoder_flutter_webtoon/screens/home.screen.dart';

void main() {
  runApp(const App());
}

// StatelessWidget을 상속받아 위젯화
// 모든 앱의 기본 UI 설정: CupertinoApp or MaterialApp 중에 선택 (apple or google)
// 모든 화면은 Scaffold(구조)를 가져야 함
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      // home: Scaffold(
      //   backgroundColor: const Color(0xFF181818),
      //   body: Container(),
      //   // 세로 스크롤
      // ),
    );
  }
}
