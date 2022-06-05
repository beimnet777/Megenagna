import 'package:last/employee/data%20provider/EmployerProvider.dart';
import 'package:last/employee/data%20provider/job_provider.dart';
import 'package:last/employee/models/Employer.dart';
import 'package:last/employee/models/jobs.dart';

class JobRepository {
  JobProvider jobProvider;
  EmployerProvider employerProvider;
  JobRepository({
    required this.jobProvider,
    required this.employerProvider,
  });

  get() async {
    List<Job> jobs = await this.jobProvider.getAllJobs();
    print("==================================");
    print(jobs);
    print("==================================");
    List<Employer> employers = [];
    List all = [];
    for (Job job in jobs) {
      print("*****************************************");
      Employer emp = await this.employerProvider.getEmployer(job.user);
      print("*****************************************");
      employers.add(emp);
      print(emp);
    }

    all.add(jobs);
    all.add(employers);
    print(all);
    return all;
  }

  getJobById(int id) async {
    List<Job> jobs = await this.jobProvider.getAllJobs();
    for (Job job in jobs) {
      if (job.id == id) {
        print("got it");
        return job;
      }
    }
  }
}
