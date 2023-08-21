
import 'package:equatable/equatable.dart';
import 'package:pagination_demo/modal/pagination_modal.dart';

abstract class PaginationState extends Equatable {
  const PaginationState();

  List<PaginationModal>? getHomeData();
}

class PaginationLoading extends PaginationState {
  @override
  List<PaginationModal>? getHomeData() => null;

  @override
  List<Object> get props => [];
}

class PaginationLoaded extends PaginationState {
  const PaginationLoaded({required this.homeData});
  @override
  List<PaginationModal> getHomeData() => homeData;

  final List<PaginationModal> homeData;

  @override
  List<Object> get props => [homeData];
}

class PaginationError extends PaginationState {
  @override
  List<PaginationModal>? getHomeData() => null;

  @override
  List<Object> get props => [];
}

// ============================= Use For No More Data In Pagination  ============================= //

class MaxResultLoaded extends PaginationState {
  const MaxResultLoaded({required this.homeData});

  @override
  List<PaginationModal>? getHomeData() => homeData;

  final List<PaginationModal> homeData;
  @override
  List<Object> get props => [homeData];
}

class ChangeState extends PaginationState {
  const ChangeState({required this.homeData});
  @override
  List<PaginationModal> getHomeData() => homeData;

  final List<PaginationModal> homeData;

  @override
  List<Object> get props => [homeData];
}
