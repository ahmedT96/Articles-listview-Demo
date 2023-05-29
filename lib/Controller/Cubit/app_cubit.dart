import 'package:simple_articles_api/DataSource/ArticleModel.dart';
import 'package:simple_articles_api/DataSource/Dio_Helper.dart';
import 'package:simple_articles_api/DataSource/End_Point.dart';
import 'package:simple_articles_api/DataSource/SearchArticleModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  ArticleModel articleModel = ArticleModel();
  SearchArticleModel searchArticleModel = SearchArticleModel();
  static AppCubit get(context) => BlocProvider.of(context);

  Future<void> getViewedArticle() async {
    await FinalDioHelper.getData(url: viewedUrl).then((value) {
      articleModel = ArticleModel.fromJson(value.data);
      debugPrint(articleModel.results!.first.title);
      emit(GetViewedArticleSuccessState());
    }).catchError((error) {
      debugPrint('$error Error Dio');
      emit(GetViewedArticleErrorState());
    });
  }

  Future<void> getSharedArticle() async {
    await FinalDioHelper.getData(url: sharedUrl).then((value) {
      articleModel = ArticleModel.fromJson(value.data);
      debugPrint(articleModel.results!.first.title);
      emit(GetSharedArticleSuccessState());
    }).catchError((error) {
      debugPrint('$error Error Dio');
      emit(GetSharedArticleErrorState());
    });
  }

  Future<void> getEmailedArticle() async {
    await FinalDioHelper.getData(url: emailedUrl).then((value) {
      articleModel = ArticleModel.fromJson(value.data);
      debugPrint(articleModel.results!.first.title);
      emit(GetEmailedArticleSuccessState());
    }).catchError((error) {
      debugPrint('$error Error Dio');
      emit(GetEmailedArticleErrorState());
    });
  }

  Future<void> getSearchedArticle({required String searchWord}) async {
    await FinalDioHelper.getData(url: fullUrl(type: searchWord)).then((value) {
      searchArticleModel = SearchArticleModel.fromJson(value.data);
      debugPrint(searchArticleModel.response!.docs!.first.sectionName);
      emit(GetSearchedArticleSuccessState());
    }).catchError((error) {
      debugPrint('$error Error Dio');
      emit(GetSearchedArticleErrorState());
    });
  }
}
