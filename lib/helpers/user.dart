class User {

  User({
    required this.uid,
    required this.unickname,
    required this.upic,
    required this.distance,
  });

  factory User.fromJson(dynamic json) {
    return User(
      uid: json['uid'] ?? -1,
      unickname: json['username'] ?? "未知用户",
      upic: json['upic'] ?? "",
      distance: json['distance'] ?? 0.0,
    );
  }

  int uid;
  String unickname;
  String upic;
  double distance;
  
}