
import 'package:last/employee/data%20provider/ApplicationProvider.dart';
import 'package:last/employee/data%20provider/EmployerProvider.dart';
import 'package:last/employee/models/Employer.dart';
import 'package:last/employee/models/applications.dart';
import 'package:last/employee/models/jobs.dart';
import 'package:last/employee/repository/job_local_repository.dart';

class ApplicationRepository {
  final ApplicationProvider appProvider;
  final EmployerProvider employerProvider;
  final JobRepository jobRepository;

  ApplicationRepository(
      this.appProvider, this.employerProvider, this.jobRepository);

  create(Application app, int id) {
    print("in repo");
    return this.appProvider.createApplication(app);
  }

  getApplicationByApplier(int job, int user) async {
    List<Application> appList = await this.appProvider.getAllApplications();

    for (Application app in appList) {
      if (app.job == job && app.user == user) {
        return app;
      }
    }
    return null;
  }

  getApplicationById(int id) async {
    List<Application> filteredApp = [];
    List<Employer> filterEmp = [];
    List<Job> filterJob = [];
    List all = [];

    List<Application> appList = await this.appProvider.getAllApplications();

    for (Application app in appList) {
      if (app.user == id) {
        filteredApp.add(app);
      }
    }

    for (Application app in filteredApp) {
      print("in loop");
      Job job = await this.jobRepository.getJobById(app.job);
      filterJob.add(job);
      Employer emp = await this.employerProvider.getEmployer(job.user);
      filterEmp.add(emp);
    }

    all.add(filteredApp);
    all.add(filterJob);
    all.add(filterEmp);

    return all;
  }
}
