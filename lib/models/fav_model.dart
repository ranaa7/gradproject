
class FavModel {
  String userId;
  List<String> name;


  FavModel({
    required this.userId,
    required this.name,
  });

  factory FavModel.fromJson(Map<String, dynamic> ?json) {
    return FavModel(
        userId: json?['user_id'] ??"",
        name: List.from(json?['name'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name':name
    };
  }
}
