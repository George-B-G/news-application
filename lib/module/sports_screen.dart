import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/shared/components/components.dart';
import 'package:news_application/shared/cubit/news_cubit.dart';
import 'package:news_application/shared/cubit/news_state.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var sportsLst = NewsCubit.get(context).apiSportsList;
        return conditinalItemBuilder(data: sportsLst);
      },
    );
  }
}
