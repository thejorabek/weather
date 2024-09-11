import 'package:flutter_bloc/flutter_bloc.dart';
import 'popup_event.dart';
import 'popup_state.dart';

class PopupBloc extends Bloc<PopupEvent, PopupState> {
  PopupBloc() : super(const PopupState(selectedItem: 'Item 1')) {
    on<SelectItemEvent>((event, emit) {
      emit(PopupState(selectedItem: event.selectedItem));
    });
  }
}