class Application {
  final int job;
  final int app_experience_years;
  final double gpa;
  final String degree;
  final int user;
  final String sex;
  final int age;
  final int status;

  Application(
    this.job,
    this.app_experience_years,
    this.gpa,
    this.degree,
    this.user,
    this.sex,
    this.age,
    this.status,
  );

  factory Application.fromJsonApp(Map<String, dynamic> json) {
    var tempgpa = json["fields"]["gpa"];
    var tempDegree = json["fields"]["degree"];
    var tempSex = json["fields"]["sex"];
    var tempexp = json["fields"]["experience"];
    var tempAge = json["fields"]["age"];
    var tempStat = json["fields"]["status"];
    var tempJob = json["fields"]["job"];
    var tempUser = json["fields"]["user"];

    Application job = Application(tempJob, tempexp, tempgpa, tempDegree,
        tempUser, tempSex, tempAge, tempStat);
    return job;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> employeeJson = {
      "gpa": this.gpa,
      "degree": this.degree,
      "sex": this.sex,
      "experience": this.app_experience_years,
      "age": this.age,
      "status": this.status,
      "job": this.job,
      "user": this.user
    };
    return employeeJson;
  }
}
