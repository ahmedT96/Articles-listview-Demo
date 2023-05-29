import 'package:simple_articles_api/Controller/Cubit/app_cubit.dart';
import 'package:simple_articles_api/Presentaion/Screens/Articles_Screen.dart';
import 'package:simple_articles_api/Presentaion/Shared_widgets/textFormfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);
  final searchController = TextEditingController();

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search Screen'),
            centerTitle: true,
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 50,
                ),
                MyTextFormField(
                  readOnly: false,
                  control: widget.searchController,
                  type: TextInputType.text,
                  isPassword: false,
                  hint: 'Search article here ....',
                  suffix: Icons.search,
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  onTap: () {},
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.getSearchedArticle(
                          searchWord: widget.searchController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ArticlesScreen(
                                    isSearch: true,
                                  )));
                    },
                    child: const Text('Search',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
