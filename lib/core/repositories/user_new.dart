class UserNew {
  String email;
  String firstname;
  String lastName;
  String password;
  String dateBirthday;
  String photoUrl;

  UserNew({
    this.email = '',
    this.firstname = '',
    this.lastName = '',
    this.password = '',
    this.dateBirthday = '',
    this.photoUrl = '',
  });

  factory UserNew.fromJson(Map<String, dynamic> json) => UserNew(
        email: json['email'].toString(),
        firstname: json['firstName'].toString(),
        lastName: json['lastName'].toString(),
        password: json['password'].toString(),
        dateBirthday: json['birthday'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'firstName': firstname,
        'lastName': lastName,
        'password': password,
        'birthday': dateBirthday,
      };
}
