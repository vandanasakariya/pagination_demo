import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pagination_demo/modal/pagination_modal.dart';

@immutable
abstract class PaginationEvent extends Equatable {
  const PaginationEvent();
}

class PaginationIn extends PaginationEvent {
  const PaginationIn({required this.item, required this.page});
  final String item;
  final String page;
  @override
  List<Object> get props => [item, page];
}

class LoadMoreHomeLanding extends PaginationEvent {
  const LoadMoreHomeLanding({
    required this.page,
    required this.item,
    required this.results,
  });

  final String page;
  final String item;
  final List<PaginationModal> results;

  @override
  List<Object?> get props => [page, results, item];
}
