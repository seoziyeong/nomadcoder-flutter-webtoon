class WebtoonDetailModel {
  final String title, about, genre, age;

  // named constructor
  // fetching data와 맞게 초기화
  // Dart에서의 json 자료형 :  json을 다루기 위해 Map<String, dynamic> 이라는 자료형을 사용 (key는 무조건 String, 값은 자료형이 정해져있지 않기 때문)
  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        about = json["about"],
        genre = json["genre"],
        age = json["age"];
}
