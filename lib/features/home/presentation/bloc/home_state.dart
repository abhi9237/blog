import 'package:equatable/equatable.dart';

import '../../../../model/blog_model.dart';

class HomeBocState extends Equatable {
  final List<BlogModel>? getAllBlogs;

  const HomeBocState({this.getAllBlogs = const []});

  HomeBocState copyWith({List<BlogModel>? getAllBlogs}) {
    return HomeBocState(getAllBlogs: getAllBlogs ?? this.getAllBlogs);
  }

  @override
  List<Object?> get props => [getAllBlogs];
}

class HomeBlocInitialState extends HomeBocState {}

class HomeBlocLoadingState extends HomeBocState {}

class HomeBlocSuccessState extends HomeBocState {}

class HomeBlocFailureState extends HomeBocState {
  final String message;
  const HomeBlocFailureState(this.message);
}
