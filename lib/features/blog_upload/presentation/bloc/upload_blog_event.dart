part of 'upload_blog_bloc.dart';

@immutable
abstract class UploadBlogEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectCategoryEvent extends UploadBlogEvent {
  final String value;
  SelectCategoryEvent(this.value);
}

class UploadBlogVisibilityEvent extends UploadBlogEvent {
  final bool value;
  UploadBlogVisibilityEvent(this.value);
}

class UploadBlogImageEvent extends UploadBlogEvent {
 final File image;

  UploadBlogImageEvent(this.image);
}
