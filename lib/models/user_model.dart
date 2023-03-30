class UserModel {
  String userId;
  String name;
  String email;
  String image;
  String vegan;
  String lactose;
  String spicy;

  UserModel({
    required this.name,
    required this.email,
    required this.image,
    required this.userId,
    required this.vegan,
    required this.lactose,
    required this.spicy
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      image: json['image'],
      userId: json['uId'],
      vegan: json['vegan'],
      lactose: json['lactose'],
      spicy: json['spicy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'uId': userId,
      'vegan': vegan,
      'lactose': lactose,
      'spicy': spicy,
    };
  }
}
