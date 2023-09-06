class User {
  late int id;
  late String email;
  late String username;
  late String mobile;


  User();

  User.fromMap(Map<String, dynamic> documentMap) {
    email = documentMap['email'];
    username = documentMap['username'];
    mobile = documentMap['mobile'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic> {};
    map['email'] = email;
    map['username'] = username;
    map['mobile'] = mobile;
    return map;
  }
}
