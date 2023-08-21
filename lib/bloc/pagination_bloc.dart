import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_demo/bloc/pagination_event.dart';
import 'package:pagination_demo/bloc/pagination_state.dart';
import 'package:pagination_demo/modal/pagination_modal.dart';
import 'package:pagination_demo/repo/pagination_repo.dart';



class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  final paginationRepo = PaginationRepo();
  PaginationBloc() : super(PaginationLoading()) {
    on<PaginationIn>((event, emit) async {
      emit(PaginationLoading());
      try {
        // PrefObj.preference?.clear();
        var response = await paginationRepo.getPaginationRepoData(
            item: event.item, page: event.page);
        // PrefObj.preference?.put(PrefKeys.HOME_DATA, json.encode(response));
        emit(PaginationLoaded(homeData: response));
      } catch (e) {
        emit(PaginationError());
      }
    });
    on<LoadMoreHomeLanding>((event, emit) async {
      // emit(HomePageLoading());
      try {
        List<PaginationModal> response = await paginationRepo.getPaginationRepoData(
            item: event.item, page: event.page);
        if (response.isEmpty) {
          emit(MaxResultLoaded(
              homeData: List.from(event.results)..addAll(response)));
        } else {
          emit(
              PaginationLoaded(homeData: List.from(event.results)..addAll(response)));
        }
        // PrefObj.preference?.put(PrefKeys.HOME_DATA, json.encode(response));

        // List<HomeDataModel> homeData = response;
        // emit(HomeLoaded(homeData: homeData));
      } catch (e) {
        emit(PaginationError());
      }
    });
  }
}
