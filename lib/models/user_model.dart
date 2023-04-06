// class UserModel {
//   String userId;
//   String name;
//   String email;
//   String image;
//   String vegan;
//   String lactose;
//   String spicy;
//   // String low_cholestrol;
//   // String low_protein;
//   // String high_protein;
//   // String low_carbs;
//   // String healthy;
//
//   UserModel({
//     required this.name,
//     required this.email,
//     required this.image,
//     required this.userId,
//     required this.vegan,
//     required this.lactose,
//     required this.spicy,
//     // required this.low_cholestrol,
//     // required this.low_protein,
//     // required this.high_protein,
//     // required this.low_carbs,
//     // required this.healthy,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       name: json['name'],
//       email: json['email'],
//       image: json['image'],
//       userId: json['uId'],
//       vegan: json['vegan'],
//       lactose: json['lactose'],
//       spicy: json['spicy'],
//       // low_cholestrol: json['preference']['low_cholestrol'],
//       // low_protein:json['preference']['low_protein'],
//       // high_protein: json['preference']['High_protein'],
//       // low_carbs: json['preference']['very_low_carbs'],
//       // healthy: json['preference']['Healthy'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'email': email,
//       'image': image,
//       'uId': userId,
//       'vegan': vegan,
//       'lactose': lactose,
//       'spicy': spicy,
//       // 'low_cholestrol':low_cholestrol,
//       // 'low_protein':low_protein,
//       // 'High_protein':high_protein,
//       // 'very_low_carbs':low_carbs,
//       // 'Healthy':healthy
//     };
//   }
// }

class UserModel {
  String userId;
  String name;
  String email;
  String image;
  List preference;

  UserModel({
    required this.name,
    required this.email,
    required this.image,
    required this.userId,
    required this.preference,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      image: json['image'],
      userId: json['uId'],
      preference: json['preference'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'uId': userId,
      'preference': preference,
    };
  }
}
