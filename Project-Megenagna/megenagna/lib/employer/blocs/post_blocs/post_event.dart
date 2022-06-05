abstract class PostEvent {}

class PostPressed extends PostEvent {
  final String jobTitle;
  final String experience;
  final String salary;
  final String jobBenefit;
  final String jobDescription;
  final String skill;

  PostPressed(this.jobTitle, this.experience, this.salary,this.jobBenefit , this.jobDescription,
      this.skill);
}
