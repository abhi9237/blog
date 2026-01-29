import 'dart:io';

import 'package:blog/core/common/common_text_form_filled.dart';
import 'package:blog/core/extension/app_extension.dart';
import 'package:blog/core/theme/color_constant.dart';
import 'package:blog/features/blog_upload/presentation/bloc/upload_blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/common/app_font.dart';
import '../../../../core/common/common_bottom_sheet.dart';
import '../../../../core/common/common_button.dart';
import '../widgets/blog_visibilty_widget.dart';
import '../widgets/upload_blog_categories_widget.dart';
import '../widgets/upload_blog_cover_photo_widget.dart';

class UploadBlog extends StatefulWidget {
  const UploadBlog({super.key});

  @override
  State<UploadBlog> createState() => _UploadBlogState();
}

class _UploadBlogState extends State<UploadBlog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController blogContentController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBlogBloc, UploadBlogState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: CommonButton(buttonText: 'Upload'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: CommonButton(
                  buttonText: 'Save/Draft',
                  gradientColors: [
                    ColorConstant.lightGreyColor,
                    ColorConstant.lightGreyColor,
                  ],
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: Icon(Icons.keyboard_backspace_outlined),
                      ),

                      Text(
                        'Upload Blog',
                        style: appStyle(22, fontFamily: FontHelper.natoBold),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          UploadBlogCoverPhotoWidget(
                            imagePath: state.blogImage?.path,
                            onTap: () {
                              showImagePickerBottomSheet(
                                context,
                                onImagePicked: (XFile file) {
                                  context.read<UploadBlogBloc>().add(
                                    UploadBlogImageEvent(File(file.path)),
                                  );
                                },
                                picker: imagePicker,
                              );
                            },
                          ),

                          SizedBox(height: 15),
                          Text(
                            'Title',
                            style: appStyle(
                              16,
                              fontFamily: FontHelper.natoBold,
                            ),
                          ),
                          SizedBox(height: 10),
                          CommonTextFormFilled(
                            hintText: 'Enter title',
                            controller: titleController,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Category',
                            style: appStyle(
                              16,
                              fontFamily: FontHelper.natoBold,
                            ),
                          ),
                          SizedBox(height: 10),
                          UploadBlogCategoriesWidget(
                            selectedCategories: state.selectedCategory ?? [],
                            categories: UploadBlogState.categories,
                            onTap: (v) {
                              context.read<UploadBlogBloc>().add(
                                SelectCategoryEvent(v),
                              );
                            },
                          ),
                          SizedBox(height: 15),

                          Text(
                            'Blog Visibility',
                            style: appStyle(
                              16,
                              fontFamily: FontHelper.natoBold,
                            ),
                          ),
                          SizedBox(height: 5),
                          BlogVisibilityWidget(
                            isVisible: state.isVisible,
                            onChange: (v) {
                              context.read<UploadBlogBloc>().add(
                                UploadBlogVisibilityEvent(v),
                              );
                            },
                          ),

                          SizedBox(height: 15),
                          Text(
                            'Blog content',
                            style: appStyle(
                              16,
                              fontFamily: FontHelper.natoBold,
                            ),
                          ),
                          SizedBox(height: 10),
                          CommonDescriptionTextFormFilled(
                            hintText: 'Enter content',
                            controller: blogContentController,
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
