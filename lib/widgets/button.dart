import 'package:flutter/material.dart';

// 위젯 쉽게 만드는 단축키
// st > Flutter Stateless Widget 선택 후 class 이름 설정
// 직접 쓰는 게 익숙해질 때 까지 사용하지 말자!
// 직접 쓸 때 build 정도는..? 🥹

// * 재사용 버튼
class Button extends StatelessWidget {
  // 위젯이 사용될 떄 받을 값 constructor
  final String text;
  final Color bgColor;
  final Color textColor;

  const Button({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  // return 에 위젯 ui 넣어주고, 데이터 대입
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 44,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
