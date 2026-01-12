import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upload_blog_event.dart';
part 'upload_blog_state.dart';

class UploadBlogBloc extends Bloc<UploadBlogEvent, UploadBlogState> {
  UploadBlogBloc() : super(UploadBlogInitial()) {
    on<UploadBlogEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
