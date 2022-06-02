class UserProfile {
  final int id;
  final String employee_name;
  final employee_age;
  final String employee_specialization;
  final String employee_description;
  final employee_gpa;
  final String employee_degree_name;
  final String sex;
  final String image;

  UserProfile(
      this.id,
      this.employee_name,
      this.employee_age,
      this.employee_specialization,
      this.employee_description,
      this.employee_gpa,
      this.employee_degree_name,
      this.sex,
      this.image);

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
        json['id'],
        json['employee_name'],
        json['employee_age'],
        json['employee_specialization'],
        json['employee_description'],
        json['employee_gpa'],
        json['employee_degree_name'],
        json['sex'],
        json['image']);
  }
  Map<String, dynamic> jsonify() {
    return <String, dynamic>{
      'user': this.id,
      'employee_name':this.employee_name,
      'employee_age':this.employee_age,
      'employee_specialization': this.employee_specialization,
      'employee_description':this.employee_description,
      'employee_gpa':this.employee_gpa,
      'employee_degree_name':this.employee_degree_name,
      'sex':this.sex,
      'image':this.image


    };
  }
}
