import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/layout/home_layout.dart';
import 'package:news_application/shared/cubit/bloc_observer.dart';
import 'package:news_application/shared/cubit/news_cubit.dart';
import 'package:news_application/shared/cubit/news_state.dart';
import 'package:news_application/shared/network/remote/dio_helper.dart';
import 'package:news_application/shared/style/style.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getApiDataFunction(category: 'world'),
      child: BlocConsumer<NewsCubit, NewsAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'News application',
            theme: buildLightTheme(),
            darkTheme: buildDarkTheme(),
            home: const HomeLayout(),
          );
        },
      ),
    );
  }
}
