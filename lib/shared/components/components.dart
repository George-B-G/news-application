import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_application/module/web_view_screen.dart';

pushToPage({
  required context,
  required Widget screenName,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screenName,
      ),
    );

Widget conditinalItemBuilder({
  required List data,
  bool isSearch =false,
}) =>
    ConditionalBuilder(
      condition: data.isNotEmpty,
      fallback: (context) => isSearch
          ? Container()
          : const Center(child: CircularProgressIndicator()),
      builder: (context) => ListView.separated(
        itemCount: data.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) =>
            buildContentItem(dataLst: data, index: index, context: context),
      ),
    );

Widget buildContentItem({
  required List dataLst,
  required int index,
  required context,
}) =>
    ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(dataLst[index]['source_icon'] ??
            'https://cdn-icons-png.flaticon.com/128/4131/4131677.png'),
      ),
      title: Text(dataLst[index]['title']),
      subtitle: Text(dataLst[index]['pubDate']),
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SizedBox(
            height: 400,
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    dataLst[index]['image_url'] ??
                        'https://cdn-icons-png.flaticon.com/128/4131/4131677.png',
                    width: double.infinity,
                    height: 100,
                  ),
                  Text(
                    dataLst[index]['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    dataLst[index]['description'] ?? 'Has no Discription',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      dataLst[index]['link'],
                      style: const TextStyle(color: Colors.blue),
                    ),
                    onTap: () => pushToPage(
                      context: context,
                      screenName: WebViewScreen(
                        url: dataLst[index]['link'],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
