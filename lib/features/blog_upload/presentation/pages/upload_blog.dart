import 'package:blog/core/common/common_text_form_filled.dart';
import 'package:blog/core/extension/app_extension.dart';
import 'package:blog/features/blog_upload/presentation/bloc/upload_blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/app_font.dart';
import '../widgets/upload_blog_categories_widget.dart';
import '../widgets/upload_blog_cover_photo_widget.dart';

class UploadBlog extends StatefulWidget {
  const UploadBlog({super.key});

  @override
  State<UploadBlog> createState() => _UploadBlogState();
}

class _UploadBlogState extends State<UploadBlog> {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBlogBloc, UploadBlogState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Upload Blog',
                      style: appStyle(22, fontFamily: FontHelper.natoBold),
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          UploadBlogCoverPhotoWidget(),

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
                            categories: state.category,
                            onTap: (v) {
                              context.read<UploadBlogBloc>().add(SelectCategoryEvent(v));
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
                            controller: titleController,
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
