import 'package:news_app/souces/data/models/source.dart';

abstract class SourcesStates {}
class SourcesInitial extends SourcesStates {}
class GetSourcesLouding extends SourcesStates {}
class GetSourcesSuccess extends SourcesStates {
  final List<Source> sources ;
  bool isLoding = false;

  GetSourcesSuccess(this.sources);
}
class GetSourcesError extends SourcesStates {
  final String errormessage;

  GetSourcesError(this.errormessage);
}
