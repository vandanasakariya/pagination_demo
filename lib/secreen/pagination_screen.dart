import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_demo/bloc/pagination_bloc.dart';
import 'package:pagination_demo/bloc/pagination_event.dart';
import 'package:pagination_demo/bloc/pagination_state.dart';
import 'package:pagination_demo/modal/pagination_modal.dart';

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({super.key});

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  static const pageSize = 15;
  List<PaginationModal> homeDataModelList = [];
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => PaginationBloc()
            ..add(
                PaginationIn(item: pageSize.toString(), page: page.toString())),
          child: BlocBuilder<PaginationBloc, PaginationState>(
            builder: (context, state) {
              if (state is PaginationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PaginationError) {
                return const Text( 'Something went Worng');
              } else if (state is PaginationLoaded) {
                 return NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          if (scrollInfo.metrics.pixels ==
                                  scrollInfo.metrics.maxScrollExtent &&
                              scrollInfo is ScrollEndNotification) {
                            page = page + 1;
                            if (state is! MaxResultLoaded) {
                              BlocProvider.of<PaginationBloc>(context).add(
                                  LoadMoreHomeLanding(
                                      page: page.toString(),
                                      results: state.getHomeData(),
                                      item: pageSize.toString()));
                            }
                          }
                          return false;
                        },
                        child: dataList(state.getHomeData()));
              }
               return  dataList(homeDataModelList);
            },
          ),
        ),
      ),
    );
  }

  Widget dataList(List<PaginationModal> modalData) {
    return ListView.builder(
      itemCount: modalData.length,
      itemBuilder: (context, index) {
        final paginationModalData = modalData[index];
        print("aaaaaaaaaaa=========${modalData[index].name}");

      
      return    Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.book, size: 50),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        paginationModalData.name ??"",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(paginationModalData.description ?? '',
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      Row(
                        children: [
                          const Text('<>'),
                          const SizedBox(width: 5),
                          Text(paginationModalData.language ?? ''),
                          const SizedBox(width: 5),
                          const Icon(Icons.bug_report),
                          const SizedBox(width: 5),
                          Text(paginationModalData.forksCount.toString()),
                          const SizedBox(width: 5),
                          const Icon(Icons.face),
                          const SizedBox(width: 5),
                          Text(paginationModalData.watchersCount.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.black)
          ],
        );
       
      },
    );
  }
}
