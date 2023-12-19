class ExperienceWeek {
  int experience;
  String obtainedDate;

  ExperienceWeek({
    required this.experience,
    required this.obtainedDate,
  });

  factory ExperienceWeek.fromJson(Map<String, dynamic> json) => ExperienceWeek(
        experience: json["experience"] as int,
        obtainedDate: json["obtainedDate"] as String,
      );

  Map<String, dynamic> toJson() => {
        "experience": experience,
        "obtainedDate": obtainedDate,
      };
}
