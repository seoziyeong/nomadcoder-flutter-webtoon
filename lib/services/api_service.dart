import 'package:http/http.dart' as http;
import 'package:nomadcoder_flutter_webtoon/models/webtoon_episode_model.dart';
import 'dart:convert';
import 'package:nomadcoder_flutter_webtoon/models/webtoon_model.dart';
import 'package:nomadcoder_flutter_webtoon/models/webtton_detail_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // json 스트링 -> json 자료형으로 변환
      final List<dynamic> webtoons = jsonDecode(response.body);

      // json 자료형 -> 객체로 변환
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // json 스트링 -> json 자료형으로 변환
      final webtoon = jsonDecode(response.body);
      // json 자료형 -> 객체로 변환
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodeById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];

    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // json 스트링 -> json 자료형으로 변환
      final episodes = jsonDecode(response.body);

      // json 자료형 -> 객체로 변환
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
