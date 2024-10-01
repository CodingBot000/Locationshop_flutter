import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location_shop/component/empty_view.dart';
import 'package:location_shop/model/review_data.dart';
import 'package:location_shop/pages/review/review_list_cell.dart';
import 'package:location_shop/repository/respository.dart';
import 'package:location_shop/view_model/review_view_model.dart';

class ReviewWidget extends ConsumerStatefulWidget {
  const ReviewWidget({super.key, required this.id});

  final int id;

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends ConsumerState<ReviewWidget> {

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final viewModel = ref.read(reviewViewModelProviderFamily(widget.id).notifier);
    //   // viewModel.fetchReviewDataListById(widget.id);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final pageState = ref.watch(reviewViewModelProviderFamily(widget.id));
    final reviewDataList = pageState.reviewDataList;

    return reviewDataList.when(data: (data)
    {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ReviewListCell(
            data: data[index],
            onButtonPressed: (ReviewData reviewData) => {},
          );
        },
      );
    }, loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) =>
          Center(child: Text('Error HomeGridWidget: $error')),
    );
  }

}


//
// class ReviewWidget extends StatelessWidget {
//   const ReviewWidget({super.key, required this.id});
//
//   final int id;
//
//   @override
//   Widget build(BuildContext context) {
//     List<ReviewData> list = DataRepository.instance.getReviewDataListById(id);
//     return list.isEmpty
//         ? const EmptyView()
//         : ListView.builder(
//             scrollDirection: Axis.vertical,
//             padding: const EdgeInsets.all(10),
//             itemCount: list.length,
//             itemBuilder: (BuildContext context, int index) {
//               return ReviewListCell(
//                 data: list[index],
//                 onButtonPressed: (ReviewData reviewData) => {},
//               );
//             },
//           );
//   }
// }
