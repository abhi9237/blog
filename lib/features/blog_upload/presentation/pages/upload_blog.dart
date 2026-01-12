
import 'package:blog/core/common/common_text_form_filled.dart';
import 'package:blog/core/extension/app_extension.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/common/app_font.dart';

class UploadBlog extends StatefulWidget {
  const UploadBlog({super.key});

  @override
  State<UploadBlog> createState() => _UploadBlogState();
}

class _UploadBlogState extends State<UploadBlog> {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('Upload Blog',
                  style: appStyle(22,fontFamily:FontHelper.natoBold,)),
            ),
            SizedBox(height: 20,),
            Text('Title',
                style: appStyle(16,fontFamily:FontHelper.natoBold,)),
            SizedBox(height: 10,),
            CommonTextFormFilled(hintText: 'Enter title', controller: titleController),
            SizedBox(height: 20,),
            Text('Description',
                style: appStyle(16,fontFamily:FontHelper.natoBold,)),
            SizedBox(height: 10,),
            CommonDescriptionTextFormFilled(hintText: 'Enter description', controller: titleController),

          ],
        ),
      ),
    );
  }
}

