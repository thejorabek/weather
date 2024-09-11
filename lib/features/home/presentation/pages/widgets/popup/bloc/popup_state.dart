import 'package:equatable/equatable.dart';

class PopupState extends Equatable {
  final String selectedItem;

  const PopupState({required this.selectedItem});

  @override
  List<Object> get props => [selectedItem];
}