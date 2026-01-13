part of 'upload_blog_bloc.dart';

class UploadBlogState extends Equatable {
  final List category = [
    'trending','sports','music','entertainment','technology','song','clothes',
  ];
  final List? selectedCategory;

  UploadBlogState({this.selectedCategory});

  UploadBlogState copyWith(List? selectedCategory) {
    return UploadBlogState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [category, selectedCategory];
}

final class UploadBlogInitial extends UploadBlogState {}
