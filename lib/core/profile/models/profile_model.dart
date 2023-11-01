class UserProfileModel {
  int id;
  String email;
  String firstName;
  String lastName;
  String urlPhoto;
  int roleId;
  String roleName;
  bool status;
  String birthdate;
  dynamic registrationDate;
  Statistic statistic;

  UserProfileModel.empty() // this is a constructor for create a empty object
      : id = 0,
        email = '',
        firstName = '',
        lastName = '',
        urlPhoto = '',
        roleId = 0,
        roleName = '',
        status = false,
        birthdate = '',
        registrationDate = '',
        statistic = Statistic(
          lessonsCompleted: 0,
          acumulatedExperience: 0,
          dayStreak: 0,
          emeralds: 0,
          remainingLive: 0,
        );

  UserProfileModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.urlPhoto,
    required this.roleId,
    required this.roleName,
    required this.status,
    required this.birthdate,
    required this.registrationDate,
    required this.statistic,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: int.parse(json["id"].toString()),
        email: json["email"].toString(),
        firstName: json["firstName"].toString(),
        lastName: json["lastName"].toString(),
        urlPhoto: json["urlPhoto"].toString(),
        roleId: int.parse(json["roleId"].toString()),
        roleName: json["roleName"].toString(),
        status: bool.parse(json["status"].toString()),
        birthdate: json["birthdate"].toString(),
        registrationDate: json["registrationDate"],
        statistic:
            Statistic.fromJson(json["statistic"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "urlPhoto": urlPhoto,
        "roleId": roleId,
        "roleName": roleName,
        "status": status,
        "birthdate": birthdate,
        "registrationDate": registrationDate,
        "statistic": statistic.toJson(),
      };
}

class Statistic {
  int lessonsCompleted;
  int acumulatedExperience;
  int dayStreak;
  int emeralds;
  int remainingLive;

  Statistic({
    required this.lessonsCompleted,
    required this.acumulatedExperience,
    required this.dayStreak,
    required this.emeralds,
    required this.remainingLive,
  });

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        lessonsCompleted: int.parse(json["lessonsCompleted"].toString()),
        acumulatedExperience:
            int.parse(json["acumulatedExperience"].toString()),
        dayStreak: int.parse(json["dayStreak"].toString()),
        emeralds: int.parse(json["emeralds"].toString()),
        remainingLive: int.parse(json["remainingLive"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "lessonsCompleted": lessonsCompleted,
        "acumulatedExperience": acumulatedExperience,
        "dayStreak": dayStreak,
        "emeralds": emeralds,
        "remainingLive": remainingLive,
      };
}
