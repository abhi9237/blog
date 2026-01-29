import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/common_bottom_sheet.dart';

part 'upload_blog_event.dart';
part 'upload_blog_state.dart';

class UploadBlogBloc extends Bloc<UploadBlogEvent, UploadBlogState> {
  UploadBlogBloc() : super(UploadBlogInitial()) {
    on<SelectCategoryEvent>(selectCategory);
    on<UploadBlogVisibilityEvent>(blogVisibility);
    on<UploadBlogImageEvent>(uploadBlogImage);
  }


  void selectCategory(
    SelectCategoryEvent event,
    Emitter<UploadBlogState> emit,
  ) {
    final List updatedCategories = List.from(state.selectedCategory ?? []);

    if (updatedCategories.contains(event.value)) {
      updatedCategories.remove(event.value);
    } else {
      updatedCategories.add(event.value);
    }

    emit(state.copyWith(selectedCategory: updatedCategories));
  }

  void blogVisibility(UploadBlogVisibilityEvent event, Emitter emit) {
    log('${event.value}');
    if (event.value == true) {
      emit(state.copyWith(isVisible: event.value));
    } else {
      emit(state.copyWith(isVisible: event.value));
    }

    // emit(state.copyWith(selectedCategory: updatedCategories));
  }

  Future<void> uploadBlogImage(UploadBlogImageEvent event, Emitter emit) async {
  emit(state.copyWith(blogImage: event.image));
  }
}
