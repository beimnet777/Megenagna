abstract class CreateProfileEvent {}

class CreateProfilePressed extends CreateProfileEvent {
  final String name;
  final String companyFunction;
  final String city;
  final String sub_string;

  CreateProfilePressed(
      this.name, this.companyFunction, this.city, this.sub_string);
}
