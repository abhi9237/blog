import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'upload_blog_event.dart';
part 'upload_blog_state.dart';

class UploadBlogBloc extends Bloc<UploadBlogEvent, UploadBlogState> {
  UploadBlogBloc() : super(UploadBlogInitial()) {
    on<SelectCategoryEvent>(selectCategory);
  }
  void selectCategory(SelectCategoryEvent event, Emitter emit) {
    if (state.selectedCategory != null &&
        state.selectedCategory!.contains(event.value)) {
      state.selectedCategory?.remove(event.value);
      emit(state.copyWith(state.selectedCategory));
    } else {
      log('event.value==>${event.value}');
      state.selectedCategory?.add(event.value);
    emit(state.copyWith(state.selectedCategory));
    }
  }
}
