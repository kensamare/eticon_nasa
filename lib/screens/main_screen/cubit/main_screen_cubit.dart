import 'package:eticon_api/api_errors.dart';
import 'package:eticon_api/eticon_api.dart';
import 'package:eticon_nasa/models/apod_model.dart';
import 'package:eticon_nasa/screens/main_screen/cubit/main_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenLoadingState());

  Future<void> getData() async {
    try {
      Map<String, dynamic> response = await Api.get(
          method: 'planetary/apod',
          query: {'api_key': 'hTyuBrb3xGcFIbQkGlsb8aMPurTJjQKuB20eAe65'});
      emit(MainScreenLoadedState(result: ApodModel.fromJson(response)));
    } on APIException catch (error) {
      if(error.code == 0){
        emit(MainScreenErrorState(errorMsg: 'No Internet connection'));
      }else{
        emit(MainScreenErrorState(errorMsg: 'Ups...'));
      }
    }
  }
}

