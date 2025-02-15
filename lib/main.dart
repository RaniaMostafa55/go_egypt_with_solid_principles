import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/core/blocs/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_firebase/features/favorites/injection_container.dart';
import 'package:go_egypt_with_firebase/firebase_options.dart';
import 'package:go_egypt_with_firebase/go_egypt_app.dart';
import 'package:go_egypt_with_firebase/features/governments/injection_container.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  initGovernmentsDependencies();
  initFavoritesDependencies();
  
  runApp(
    BlocProvider(
      create: (context) => ThemeBloc()..add(DetectTheme()),
      child: GoEgyptApp(),
    ),
  );
}
