import 'package:blog/features/home/presentation/bloc/home_bloc.dart';
import 'package:blog/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_event.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getHomeBlogData();
  }

  Future<void> getHomeBlogData() async {
    context.read<HomeBloc>().add(HomeBlocInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeBocState>(
      builder: (context, state) {
        return Column(children: [HomeAppBarWidget(), HomeDataWidget(

          allBlogList: state.getAllBlogs ??[],

        )]);
      },
    );
  }
}
