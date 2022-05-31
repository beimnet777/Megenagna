abstract class PressedEvent {}

class Save extends PressedEvent {
  final String email;
  final String name;
  final String phone;
  final String country;
  final String city;
  final String field;
  final String level;
  final String description;

  Save(this.name, this.email, this.phone, this.country, this.city, this.field, this.level, this.description);
}
