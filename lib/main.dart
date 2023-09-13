import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
