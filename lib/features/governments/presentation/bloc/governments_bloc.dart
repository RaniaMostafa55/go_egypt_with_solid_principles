import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_governments.dart';
import 'governments_event.dart';
import 'governments_state.dart';

class GovernmentsBloc extends Bloc<GovernmentsEvent, GovernmentsState> {
  final GetGovernments getGovernments;

  GovernmentsBloc({required this.getGovernments}) : super(GovernmentsInitial()) {
    on<LoadGovernments>(_onLoadGovernments);
  }

  Future<void> _onLoadGovernments(
    LoadGovernments event,
    Emitter<GovernmentsState> emit,
  ) async {
    emit(GovernmentsLoading());
    try {
      final governments = await getGovernments();
      emit(GovernmentsLoaded(governments));
    } catch (e) {
      emit(GovernmentsError(e.toString()));
    }
  }
}
