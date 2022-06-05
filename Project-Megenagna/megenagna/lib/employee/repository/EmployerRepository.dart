import 'package:last/employee/data%20provider/EmployerProvider.dart';

class EmployerRepository {
  EmployerProvider empProv;
  EmployerRepository({
    required this.empProv,
  });

  get(int id) {
    return this.empProv.getEmployer(id);
  }
}
