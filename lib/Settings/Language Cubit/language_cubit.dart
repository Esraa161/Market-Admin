import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';
import 'package:market_admin/Settings/Language%20Cubit/language_cach_helper.dart';
import 'package:market_admin/Settings/Language%20Cubit/language_states.dart';

class LanguageCubit extends Cubit<languageStates>{
  LanguageCubit():super(languageInitialState());

  Future<void>getSavedLanguage()async{
     final String cachhedLanguageCode =
     await LanguageCacheHelper().getCachedLanguageCode();
     emit(changeLanguageState(locale: Locale(cachhedLanguageCode)));
  }
  Future<void>changeLanguage(String languageCode)async{
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(changeLanguageState(locale: Locale(languageCode)));
  }
 // void toArabic()=>emit(selectedLanguageState(Locale('ar')));

 // void toEnglish()=>emit(selectedLanguageState(Locale('en')));
}

class RadioListTileCubit extends Cubit<int> {
  RadioListTileCubit() : super(0);

  void selectItem(int index) {
    emit(index);
  }
}