import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_egypt_with_firebase/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:go_egypt_with_firebase/core/blocs/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_firebase/core/core_cubits/language_cubit.dart';
import 'package:go_egypt_with_firebase/core/theme/theme.dart';
import 'package:go_egypt_with_firebase/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:go_egypt_with_firebase/features/auth/data/repository/auth_repository_impl.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/usecases/login_usecase.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/usecases/signup_usecase.dart';
import 'package:go_egypt_with_firebase/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:go_egypt_with_firebase/features/auth/presentation/views/login_page.dart';
import 'package:go_egypt_with_firebase/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:go_egypt_with_firebase/features/favorites/presentation/bloc/favorites_event.dart';
import 'package:go_egypt_with_firebase/features/governments/injection_container.dart';
import 'package:go_egypt_with_firebase/features/governments/presentation/bloc/governments_bloc.dart';
import 'package:go_egypt_with_firebase/features/home/data/data_source/cards_local_data_source.dart';
import 'package:go_egypt_with_firebase/features/home/data/data_source/places_local_data_source.dart';
import 'package:go_egypt_with_firebase/features/home/data/repositories/cards_repository_impl.dart';
import 'package:go_egypt_with_firebase/features/home/data/repositories/places_repository_impl.dart';
import 'package:go_egypt_with_firebase/features/home/domain/usecases/get_cards.dart';
import 'package:go_egypt_with_firebase/features/home/domain/usecases/get_places.dart';
import 'package:go_egypt_with_firebase/generated/l10n.dart';

import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/home/presentation/bloc/places_bloc.dart';

class GoEgyptApp extends StatelessWidget {
  const GoEgyptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
              loginUseCase: LoginUseCase(AuthRepositoryImpl(
                  authDataSource: RemoteAuthDataSourceImpl())),
              signupUseCase: SignUpUseCase(AuthRepositoryImpl(
                  authDataSource: RemoteAuthDataSourceImpl())),
              logoutUseCase: LogoutUseCase(AuthRepositoryImpl(authDataSource:RemoteAuthDataSourceImpl() ))),
        ),
        BlocProvider(
          create: (context) => PlacesBloc(
              getPlacesUseCase: GetPlacesUseCase(
                  placesRepository: PlacesRepositoryImplementation(
                      placesLocalDataSource: PlacesLocalDataSourceImpl())),
              getCardsUseCase: GetCardsUseCase(
                  cardsRepository: CardsRepositoryImplementation(
                      cardsLocalDataSource: CardsLocalDataSourceImpl()))),
        ),
        BlocProvider(
          create: (context) => sl<GovernmentsBloc>(),
        ),
        BlocProvider(
          // create: (context) => ProfileBloc ()..add(LoadProfile()),
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => sl<FavoritesBloc>()
            ..add(
              LoadFavorites(),
            ),
        ),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                // ------------- Localization -------------
                locale: locale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                // ------------- Localization -------------
                debugShowCheckedModeBanner: false,
                theme: light,
                darkTheme: dark,
                themeMode:
                    (state is DarkModeState) ? ThemeMode.dark : ThemeMode.light,
                // home: SignUpPage(),
                home: LoginPage(),
              );
            },
          );
        },
      ),
    );
  }
}
