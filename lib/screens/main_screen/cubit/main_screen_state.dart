import 'package:eticon_nasa/models/apod_model.dart';

abstract class MainScreenState {}

class MainScreenLoadingState extends MainScreenState {}

class MainScreenLoadedState extends MainScreenState {
  final ApodModel result;

  MainScreenLoadedState({required this.result});
}

class MainScreenErrorState extends MainScreenState {
  final String errorMsg;

  MainScreenErrorState({required this.errorMsg});
}
