import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/module/web_view_screen.dart';
import 'package:news_application/shared/components/components.dart';
import 'package:news_application/shared/cubit/news_cubit.dart';
import 'package:news_application/shared/cubit/news_state.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var businessLst = NewsCubit.get(context).apiBusinessList;
        return conditinalItemBuilder(data: businessLst);
      },
    );
  }
}
