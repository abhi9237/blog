part of 'upload_blog_bloc.dart';

class UploadBlogState extends Equatable {
  // Static categories (not part of state)
  static const List categories = [
    'trending',
    'sports',
    'music',
    'entertainment',
    'technology',
    'song',
    'clothes',
  ];
  final File? blogImage;
  final List selectedCategory;
  final bool isVisible;

  const UploadBlogState({
    this.selectedCategory = const [],
    this.isVisible = true,
    this.blogImage,
  });

  UploadBlogState copyWith({
    List? selectedCategory,
    bool? isVisible,
    File? blogImage,
  }) {
    return UploadBlogState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isVisible: isVisible ?? this.isVisible,
      blogImage: blogImage ?? this.blogImage,
    );
  }

  @override
  List<Object?> get props => [
    blogImage,
    selectedCategory,
    isVisible,
    categories,
  ];
}

class UploadBlogInitial extends UploadBlogState {
  const UploadBlogInitial() : super();
}
