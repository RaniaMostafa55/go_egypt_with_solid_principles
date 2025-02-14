import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/constants.dart';
import 'package:go_egypt_with_firebase/core/helpers/shared_pref_helper.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en')) {
    _loadCurrentLocale();
  }

  Future<void> _loadCurrentLocale() async {
    try {
      final currentLocale =
          await SharedPrefHelper.getString(SharedPrefKeys.currentLocale) ??
              'en';
      emit(Locale(currentLocale));
    } catch (e) {
      emit(const Locale('en')); // Default fallback locale
    }
  }

  Future<void> toggleLanguage() async {
    try {
      final newLocale = state.languageCode == 'en' ? 'ar' : 'en';
      await SharedPrefHelper.setData(SharedPrefKeys.currentLocale, newLocale);
      emit(Locale(newLocale));
    } catch (e) {
      // Handle potential errors
    }
  }
}
