// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email_address {
    return Intl.message(
      'Email Address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get please_enter_your_full_name {
    return Intl.message(
      'Please enter your full name',
      name: 'please_enter_your_full_name',
      desc: '',
      args: [],
    );
  }

  /// `First letter should be capitalized`
  String get first_letter_should_be_capitalized {
    return Intl.message(
      'First letter should be capitalized',
      name: 'first_letter_should_be_capitalized',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get please_enter_a_valid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'please_enter_a_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain at least 6 characters`
  String get password_should_contain_at_least_6_characters {
    return Intl.message(
      'Password should contain at least 6 characters',
      name: 'password_should_contain_at_least_6_characters',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get Please_confirm_your_password {
    return Intl.message(
      'Please confirm your password',
      name: 'Please_confirm_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords don't match`
  String get Passwords_dont_match {
    return Intl.message(
      'Passwords don\'t match',
      name: 'Passwords_dont_match',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get Success {
    return Intl.message(
      'Success',
      name: 'Success',
      desc: '',
      args: [],
    );
  }

  /// `account created successfully`
  String get account_created_successfully {
    return Intl.message(
      'account created successfully',
      name: 'account_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get Phone_Number {
    return Intl.message(
      'Phone Number',
      name: 'Phone_Number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get Please_enter_a_valid_phone_number {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'Please_enter_a_valid_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get Please_enter_your_phone_number {
    return Intl.message(
      'Please enter your phone number',
      name: 'Please_enter_your_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Suggested Places to Visit`
  String get suggested_places_to_visit {
    return Intl.message(
      'Suggested Places to Visit',
      name: 'suggested_places_to_visit',
      desc: '',
      args: [],
    );
  }

  /// `Popular Places`
  String get popular_places {
    return Intl.message(
      'Popular Places',
      name: 'popular_places',
      desc: '',
      args: [],
    );
  }

  /// `Governments of Egypt`
  String get governments_of_egypt {
    return Intl.message(
      'Governments of Egypt',
      name: 'governments_of_egypt',
      desc: '',
      args: [],
    );
  }

  /// `Landmarks`
  String get landmarks {
    return Intl.message(
      'Landmarks',
      name: 'landmarks',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Profile has successfully updated`
  String get profile_has_successfully_updated {
    return Intl.message(
      'Profile has successfully updated',
      name: 'profile_has_successfully_updated',
      desc: '',
      args: [],
    );
  }

  /// `Current Language`
  String get current_language {
    return Intl.message(
      'Current Language',
      name: 'current_language',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bottom_navigation_home {
    return Intl.message(
      'Home',
      name: 'bottom_navigation_home',
      desc: '',
      args: [],
    );
  }

  /// `Governments`
  String get bottom_navigation_governments {
    return Intl.message(
      'Governments',
      name: 'bottom_navigation_governments',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get bottom_navigation_favorites {
    return Intl.message(
      'Favorites',
      name: 'bottom_navigation_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get bottom_navigation_profile {
    return Intl.message(
      'Profile',
      name: 'bottom_navigation_profile',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
