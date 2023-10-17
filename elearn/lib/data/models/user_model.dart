//data model for new user
class NewUser {
  String fname;
  String email;
  final int type;
  String? photoUrl;

  NewUser(
      {required this.fname,
      required this.email,
      required this.type,
      this.photoUrl});

  static NewUser fromJson(Map json) {
    return NewUser(
        fname: json['fname'],
        email: json['email'],
        type: json['type'],
        photoUrl: json['photourl'] ?? '');
  }

  static Map<String, dynamic> toJson(NewUser user) {
    return {
      'fname': user.fname,
      'email': user.email,
      'type': user.type,
      'photourl': user.photoUrl ?? ''
    };
  }
}
