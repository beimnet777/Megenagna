import 'package:last/employee/data%20provider/employee_local_data_provier.dart';
import 'package:last/employee/models/employee.dart';

class EmployeeRepository {
  EmployeeDataProvider employeeProvider;
  EmployeeRepository({
    required this.employeeProvider,
  });

  create(Employee employee) {
    return this.employeeProvider.createEmployeeProfile(employee);
  }

  get(int id) {
    return this.employeeProvider.getEmployeeProfile(id);
  }

  update(Employee employee) {
    return this.employeeProvider.editEmployeeProfile(employee);
  }

  getByUserId(int id) async {
    List<Employee> allemps = await this.employeeProvider.getAllProfiles();
    for (Employee emp in allemps) {
      if (emp.user == id) {
        return emp;
      }
    }
  }
}
