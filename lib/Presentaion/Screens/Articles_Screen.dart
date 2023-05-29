import 'package:simple_articles_api/Controller/Cubit/app_cubit.dart';
import 'package:simple_articles_api/Presentaion/Shared_widgets/compontes.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key, required this.isSearch}) : super(key: key);
  final bool isSearch;
  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text('Articles'),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  if (cubit.articleModel.results != null) {
                    cubit.articleModel.results!.clear();
                  }
                  if (cubit.searchArticleModel.response != null) {
                    cubit.searchArticleModel.response!.docs!.clear();
                  }
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ConditionalBuilder(
                builder: (context) => ListView.separated(
                    itemBuilder: (context, index) => widget.isSearch == false
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              mainText(
                                  textName: cubit
                                      .articleModel.results![index].title!),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  cubit.articleModel.results![index]
                                      .publishedDate!,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              mainText(
                                  textName: cubit.searchArticleModel.response!
                                      .docs![index].sectionName!),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  cubit.searchArticleModel.response!
                                      .docs![index].pubDate!
                                      .split('T')[0],
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                              )
                            ],
                          ),
                    separatorBuilder: (context, index) => mainDivider(),
                    itemCount: widget.isSearch == false
                        ? cubit.articleModel.results!.length
                        : cubit.searchArticleModel.response!.docs!.length),
                condition: widget.isSearch == false
                    ? cubit.articleModel.results != null &&
                        cubit.articleModel.results!.isNotEmpty
                    : cubit.searchArticleModel.response != null &&
                        cubit.searchArticleModel.response!.docs!.isNotEmpty,
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ));
      },
    );
  }
}
