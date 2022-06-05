import 'package:last/employer/blocs/post_blocs/post_event.dart';
import 'package:last/employer/data_provider/Job_provider.dart';
import 'package:last/employer/models/application.dart';

import '../models/job.dart';

class JobRepository {
  final JobProvider appProvider;
  JobRepository(this.appProvider);

  Future create(PostPressed post) async {
    return this.appProvider.createJob(post);
  }

  Future getJobStats(int id) async {
    return this.appProvider.getStatus(id);
  }

  Future getAllJobs(int id) async {
    List<Job> jobs = await this.appProvider.getAllJobs(id);
    return jobs;
  }

  Future<List<Application>> getAllApplicants(int id) async {
    List<Application> applicants = await this.appProvider.getApplicants(id);
    return applicants;
  }
}
