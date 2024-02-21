import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/module/search_screen.dart';
import 'package:news_application/shared/components/components.dart';
import 'package:news_application/shared/cubit/news_cubit.dart';
import 'package:news_application/shared/cubit/news_state.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.appbarTitle[cubit.currentIndex]),
            backgroundColor: cubit.bottomNavBarColor[cubit.currentIndex],
            leading: const Icon(Icons.newspaper),
            actions: [
              IconButton(
                onPressed: () =>
                    pushToPage(context: context, screenName: SearchScreen()),
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavBarItem,
            onTap: (index) => cubit.changeBottomNavBarIndex(index),
            currentIndex: cubit.currentIndex,
            backgroundColor: cubit.bottomNavBarColor[cubit.currentIndex],
          ),
          body: cubit.screenList[cubit.currentIndex],
        );
      },
    );
  }
}
