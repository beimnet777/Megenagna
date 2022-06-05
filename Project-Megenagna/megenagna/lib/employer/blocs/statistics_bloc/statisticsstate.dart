abstract class StatState {}

class Idle extends StatState {}

class Loading extends StatState {}

class LoadingFailed extends StatState {}

class Loaded extends StatState {
  final data;
  Loaded(this.data);
}
