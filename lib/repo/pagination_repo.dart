
import 'package:pagination_demo/modal/pagination_modal.dart';
import 'package:pagination_demo/service/pagination_service.dart';

class PaginationRepo {
  Future getPaginationRepoData({required String page, required String item}) async {
    final homeService = PaginationService();

    List<PaginationModal> result =
        await homeService.gePaginationData(item: item, page: page);
    return result;
  }
}
