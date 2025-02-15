import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/usecases/login_usecase.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/usecases/logout_usecase.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/usecases/signup_usecase.dart';
import 'package:go_egypt_with_firebase/features/auth/presentation/auth_bloc/auth_event.dart';
import 'package:go_egypt_with_firebase/features/auth/presentation/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  LoginUseCase loginUseCase ;
  SignUpUseCase signupUseCase ;
  LogoutUseCase logoutUseCase;
  AuthBloc({
    required this.loginUseCase,
    required this.signupUseCase,
    required this.logoutUseCase
}):super(AuthInitial()){
    on<SignupRequested>((event,Emitter<AuthState>emit)async{
      emit(AuthLoading());
      final result = await signupUseCase.signUp(event.signUpEntity);
    result.fold(
          (failure) => emit(AuthError( message: failure.message)),
          (user) => emit(AuthAuthenticated()),
        );
    });

    on<LoginRequested>((event,Emitter<AuthState>emit)async{
      emit(AuthLoading());
      final result = await loginUseCase.execute(event.loginEntity);
      result.fold(
            (failure) => emit(AuthError( message: failure.message)),
            (user) => emit(AuthAuthenticated()),
      );
    });
    on<LogoutRequested>((event, emit)async{
      final result = await logoutUseCase.execute();
      result.fold(
            (failure) => emit(AuthError( message: failure.message)),
            (_) => emit(AuthUnauthenticated()),
      );
    });

  }
}