import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

// StatelessWidget을 상속받아 위젯화
// 모든 앱의 기본 UI 설정: CupertinoApp or MaterialApp 중에 선택 (apple or google)
// 모든 화면은 Scaffold(구조)를 가져야 함
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Hey, Berry",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          )),
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 120,
              ),
              Text(
                "Total Balance",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "\$5 184 482",
                style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF2B33A),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 40,
                      ),
                      child: Text(
                        "Transfer",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
