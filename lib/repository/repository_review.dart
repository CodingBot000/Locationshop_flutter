import 'package:location_shop/datasource/datasource_review.dart';

import '../model/review_data.dart';

class RepositoryReview {
  final DataSourceReview _dataSourceReview = DataSourceReview();

  Future<List<ReviewData>> getReviewAllDataList() async {
    return await _dataSourceReview.getReviewAllDataList();
  }

  Future<List<ReviewData>> getReviewDataListById(int id) async {
    return await _dataSourceReview.getReviewDataListById(id);
  }

}