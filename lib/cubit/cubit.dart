import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metal_price_market/cubit/states.dart';
import 'package:metal_price_market/network/dio_helper.dart';

class MainCubit extends Cubit<States> {
  MainCubit() : super(InitialState());

  static MainCubit get(context) => BlocProvider.of(context);
  double? goldD;

  int? goldI;

  double? silverD;

  int? silverI;

  getGoldPrice() {
    DioHelper.getData('XAU/USD')
        .then((value) {
          goldD = value.data['price'];
          print(goldD);
          emit(GetGoldPricesState());
        })
        .catchError((error) {
          print(error.toString());
        });
  }

  getSilverPrice() {
    DioHelper.getData('XAG/USD')
        .then((value) {
          silverD = value.data['price'];
          print(silverD);
          emit(GetSilverPricesState());
        })
        .catchError((error) {
          print(error.toString());
        });
    goldI = goldD?.toInt();
    silverI = silverD?.toInt();
  }
}
