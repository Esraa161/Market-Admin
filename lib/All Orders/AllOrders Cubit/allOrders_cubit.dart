import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_admin/shared/network/end_points.dart';
import 'package:market_admin/shared/network/remote/dio_helper.dart';

import '../All Orders Model/allOrdersModel.dart';
import 'allOrders_states.dart';

class allOrdersCubit extends Cubit<allOrdersState> {
  allOrdersCubit() :super(allOrdersInitialState());
  static allOrdersCubit get(context) => BlocProvider.of(context);

  AllOrdersModel ? allOrdersModel;

  void getallOrders(){
    emit(allOrdersLoadingState());
    DioHelper.getData(
        url:allOrders,
        query: {
          'api_token':'ThPhwWvddWnX8cSjmiZTQ7yry0XrBfYKsN9A5LDcvUypHCwaNMCfWFhpB1SR',
         // DioHelper.getToken(),
          'pickup':1,
          'delivery':1

        }
    ).then((value) {
print(value) ;
print("....................................................................");
      allOrdersModel = AllOrdersModel.fromJson(value.data);
      print(value.data);
      emit(allOrdersSuccessState(allOrdersModel!));
    });/*.catchError((error){
      print(error.toString());
      emit(allOrdersErrorState(error.toString()));
    });*/
  }

}

class MyCubit extends Cubit<List<String>> {
  MyCubit() : super([]);

  Future<void> fetchData() async {
    // Code to fetch data goes here
    emit(['Item 1', 'Item 2', 'Item 3']);
  }
}



