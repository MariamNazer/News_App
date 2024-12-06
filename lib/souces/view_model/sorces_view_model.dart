import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/service_locator.dart';
import 'package:news_app/souces/repositories/sources_repository.dart';
import 'package:news_app/souces/view_model/sources_states.dart';

class SorcesViewModel extends Cubit<SourcesStates> {
  late final SourcesRepository repository;
  SorcesViewModel() : super(SourcesInitial()) {
    repository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }

  Future<void> getSources(String categoryID) async {
    emit(GetSourcesLouding());
    try {
      final sources = await repository.getSources(categoryID);
      emit(GetSourcesSuccess(sources));
    } catch (error) {
      emit(GetSourcesError(error.toString()));
    }
  }
}
