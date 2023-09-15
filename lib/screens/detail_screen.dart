import 'package:flutter/material.dart';
import 'package:nomadcoder_flutter_webtoon/models/webtoon_episode_model.dart';
import 'package:nomadcoder_flutter_webtoon/models/webtton_detail_model.dart';
import 'package:nomadcoder_flutter_webtoon/services/api_service.dart';
import 'package:nomadcoder_flutter_webtoon/widgets/episode_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

  // * shared_preference
  // * 브라우저의 로컬스토리지 같은 개념! 저장소를 만든다
  // Obtain shared preferences.
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    // 저장소 가져오기,
    prefs = await SharedPreferences.getInstance();
    // likedToons 를 가져온다
    final likedToons = prefs.getStringList("likedToons");
    if (likedToons != null) {
      // 배열 안에 웹툰의 id값이 있으면 아이콘 토글
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      // likedToons가 없으면, (첫 실행시) likedToons 배열 생성
      await prefs.setStringList("likedToons", []);
    }
  }

  onHeartTap() async {
    final likedToons = prefs.getStringList("likedToons");
    if (likedToons != null) {
      // 배열 안에 웹툰의 id값이 있으면 아이콘 토글
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await prefs.setStringList("likedToons", likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  void initState() {
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodeById(widget.id);

    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          // * widget : 부모 클래스를 뜻함, 부모에서 받아온다~ 이런 뜻 (여기선 DetailScreen)
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 0.5,
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
              isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    // * route시 전환효과 (required tag, 이동전 페이지에도 동일하게 설정)
                    tag: widget.id,
                    child: Container(
                      width: 300,
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
              const SizedBox(
                height: 32,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "${snapshot.data!.genre} / ${snapshot.data!.age}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text("");
                },
              ),
              const SizedBox(
                height: 40,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(
                            episode: episode,
                            webtoonId: widget.id,
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
