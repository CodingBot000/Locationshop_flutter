import 'package:flutter/material.dart';
import 'package:location_shop/component/empty_view.dart';
import 'package:location_shop/model/review_data.dart';
import 'package:location_shop/pages/review/review_list_cell.dart';
import 'package:location_shop/repository/respository.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.id});

  final int id;
  
  @override
  Widget build(BuildContext context) {
    List<ReviewData> list = DataRepository.instance.getReviewDataListById(id);
    return list.isEmpty
        ? const EmptyView()
        : ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(10),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ReviewListCell(
                data: list[index],
                onButtonPressed: (ReviewData reviewData) => {},
              );
            },
          );
  }
}
