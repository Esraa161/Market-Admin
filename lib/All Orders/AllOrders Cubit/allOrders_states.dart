import '../All Orders Model/allOrdersModel.dart';

abstract class allOrdersState{}

class allOrdersInitialState extends allOrdersState{}

class allOrdersLoadingState extends allOrdersState{}

class allOrdersSuccessState extends allOrdersState{
  AllOrdersModel allOrdersModel;
  allOrdersSuccessState(this.allOrdersModel);

}

class allOrdersErrorState extends allOrdersState{
  final String error;
  allOrdersErrorState(this.error);
}

