import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeBlocSuccessEvent extends HomeBlocEvent {
  HomeBlocSuccessEvent();
}

class HomeBlocInitialEvent extends HomeBlocEvent {}
