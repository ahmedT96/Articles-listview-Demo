part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class GetViewedArticleSuccessState extends AppState {}

class GetViewedArticleErrorState extends AppState {}

class GetSharedArticleSuccessState extends AppState {}

class GetSharedArticleErrorState extends AppState {}

class GetEmailedArticleSuccessState extends AppState {}

class GetEmailedArticleErrorState extends AppState {}

class GetSearchedArticleSuccessState extends AppState {}

class GetSearchedArticleErrorState extends AppState {}
