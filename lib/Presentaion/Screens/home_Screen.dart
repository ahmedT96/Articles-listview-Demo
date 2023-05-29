import 'package:simple_articles_api/Controller/Cubit/app_cubit.dart';
import 'package:simple_articles_api/Presentaion/Screens/Articles_Screen.dart';
import 'package:simple_articles_api/Presentaion/Screens/search_Screen.dart';
import 'package:simple_articles_api/Presentaion/Shared_widgets/compontes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        if (cubit.articleModel.results != null) {
          if (cubit.articleModel.results!.isNotEmpty) {
            // cubit.articleModel.results!.clear();
          }
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Screen'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              mainText(textName: 'Search'),
              mainDivider(),
              mainContainer(
                  context: context,
                  containerName: 'Search Articles',
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  }),
              mainDivider(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              mainText(textName: 'Popular'),
              mainDivider(),
              mainContainer(
                  context: context,
                  containerName: 'Most Viewed',
                  function: () {
                    cubit.getViewedArticle();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticlesScreen(
                                  isSearch: false,
                                )));
                  }),
              mainDivider(),
              mainContainer(
                  context: context,
                  containerName: 'Most Shared',
                  function: () {
                    cubit.getSharedArticle();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticlesScreen(
                                  isSearch: false,
                                )));
                  }),
              mainDivider(),
              mainContainer(
                  context: context,
                  containerName: 'Most Emailed',
                  function: () {
                    cubit.getEmailedArticle();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticlesScreen(
                                  isSearch: false,
                                )));
                  }),
              mainDivider()
            ],
          ),
        );
      },
    );
  }
}
