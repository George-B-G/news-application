import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/shared/components/components.dart';
import 'package:news_application/shared/cubit/news_cubit.dart';
import 'package:news_application/shared/cubit/news_state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            toolbarHeight: 100,
            title: _searchTextField(
              textEditingController: searchController,
              onchangeFunction: (String value) =>
                  cubit.getSearchNews(searchValue: value),
            ),
          ),
          body: conditinalItemBuilder(data: cubit.searchList, isSearch: true),
        );
      },
    );
  }

  Widget _searchTextField({
    required TextEditingController textEditingController,
    required Function onchangeFunction,
  }) =>
      TextFormField(
        controller: textEditingController,
        onChanged: (value) => onchangeFunction(value),
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          isDense: true,
          hintText: 'search for something..',
          hintStyle: const TextStyle(
            color: Colors.black45,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.black45,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
      );
}
