import 'package:equatable/equatable.dart';

abstract class PopupEvent extends Equatable {
  const PopupEvent();
  
  @override
  List<Object> get props => [];
}

class SelectItemEvent extends PopupEvent {
  final String selectedItem;

  const SelectItemEvent(this.selectedItem);

  @override
  List<Object> get props => [selectedItem];
}