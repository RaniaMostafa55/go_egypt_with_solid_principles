import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/governments/models/governments_model.dart';
import 'governments_event.dart';
import 'governments_state.dart';

class GovernmentsBloc extends Bloc<GovernmentsEvent, GovernmentsState> {
  GovernmentsBloc() : super(GovernmentsInitial()) {
    on<LoadGovernments>(_onLoadGovernments);
  }

  void _onLoadGovernments(
      LoadGovernments event, Emitter<GovernmentsState> emit) async {
    emit(GovernmentsLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(GovernmentsLoaded(Governorate.governorates));
    } catch (e) {
      emit(GovernmentsError('Failed to load governments'));
    }
  }
}
