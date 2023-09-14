import 'package:flutter/material.dart';
import 'package:nomadcoder_flutter_webtoon/models/webtoon_episode_model.dart';
import 'package:nomadcoder_flutter_webtoon/models/webtton_detail_model.dart';
import 'package:nomadcoder_flutter_webtoon/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // * argument(데이터 id가 필요)를 요구하는 Future가 widget(부모클래스)의 데이터를 바로 받아올 수 없는 문제
  // * late 처리 해준 후 initState 내에서 api 코드 이어서 작성
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodeById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget
              .title, // * widget : 부모 클래스를 뜻함, 부모에서 받아온다~ 이런 뜻 (여기선 DetailScreen)
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 56,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                // * route시 전환효과 (required tag, 이동전 페이지에도 동일하게 설정)
                tag: widget.id,
                child: Container(
                  width: 375,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 16,
                          offset: const Offset(10, 10),
                          color: Colors.black.withOpacity(0.1),
                        )
                      ]),
                  child: Image.network(widget.thumb),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
