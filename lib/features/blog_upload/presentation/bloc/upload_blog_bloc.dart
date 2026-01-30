import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/common_bottom_sheet.dart';
import '../../../../core/common/toast.dart';
import '../../domian/usecases/upload_blog_usecase.dart';

part 'upload_blog_event.dart';
part 'upload_blog_state.dart';

class UploadBlogBloc extends Bloc<UploadBlogEvent, UploadBlogState> {
  UploadBlogUseCase uploadBlogUseCase;
  UploadBlogBloc({required this.uploadBlogUseCase})
    : super(UploadBlogInitial()) {
    on<SelectCategoryEvent>(selectCategory);
    on<UploadBlogVisibilityEvent>(blogVisibility);
    on<UploadBlogImageEvent>(uploadBlogImage);
    on<UploadUserBlogEvent>(uploadUserBlog);
  }

  void selectCategory(
    SelectCategoryEvent event,
    Emitter<UploadBlogState> emit,
  ) {
    final List<String> updatedCategories = List.from(state.selectedCategory ?? []);

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

  void uploadUserBlog(UploadUserBlogEvent event, Emitter emit) {
    if (event.image == null) {
      showToastMessage(event.context, 'Please select image');
    } else if (event.title.isEmpty) {
      showToastMessage(event.context, 'Please enter title');
    } else if (event.category.isEmpty) {
      showToastMessage(event.context, 'Please select category');
    } else if (event.content.isEmpty) {
      showToastMessage(event.context, 'Please enter content');
    } else {
      uploadBlog(
        title: event.title,
        content: event.content,
        image: event.image ?? File(''),
        category: event.category,
        isPublic: event.isPublic,
      );
    }
  }

  Future<void> uploadBlog({
    required String title,
    required String content,
    required File image,
    required List<String> category,
    required bool isPublic,
  }) async {
    var res = await uploadBlogUseCase(
      UploadBlogParams(
        title: title,
        content: content,
        category: category,
        isPublic: isPublic,
        image: image,
      ),
    );

    res.fold(
      (failure) {
        // emit(SignInFailureState(failure.message));
        log('failure.message=>${failure.message}');
      },
      (user) {
        // emit(SignInSuccessState());
      },
    );
  }
}
