import 'package:flutter/material.dart';
import 'package:nomadcoder_flutter_webtoon/widgets/button.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  //
  // 상태변경할 데이터 준비, final 붙이지 않음
  int counter = 0;

  // 함수 작성, setState로 상태변경 로직 작성
  // setState가 있어야 화면에 상태변경된 것이 반영됨
  // setState 안에 코드를 안써도 반영 되지만, 가독성을 위해 되도록 안에 작성
  void onClicked() {
    setState(() {
      counter = counter + 1;
    });
  }

  List<int> numbers = [];

  void onClicked2() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text("nothing"),
              TextButton(
                onPressed: toggleTitle,
                child: const Text("TOGGLE TITLE"),
              ),
              const Text(
                "click count",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "$counter", // * 데이터
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              IconButton(
                iconSize: 40,
                onPressed: onClicked, // * trigger
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              for (var n in numbers) Text("$n"),
              IconButton(
                iconSize: 40,
                onPressed: onClicked2, // * trigger
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  // * widget life sycle
  // * initState > build > dispose

  // initState : 상태 초기화 메소드, build 전 실행됨
  // 부모 요소에 의존하는 데이터를 초기화해야 하는 경우
  @override
  void initState() {
    super.initState();
  }

  // dispose : 위젯이 스크린에서 제거될 때 호출되는 메서드
  @override
  void dispose() {
    super.dispose();
  }

  // 화면에 ui 그려지는 단계
  @override
  Widget build(BuildContext context) {
    return Text(
      "Theme 상속받은 Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
