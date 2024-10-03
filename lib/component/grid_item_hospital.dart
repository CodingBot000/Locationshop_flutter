
import 'package:flutter/material.dart';
import 'package:location_shop/common/constants.dart';

class GridItemHospital extends StatelessWidget {
  const GridItemHospital({super.key, required this.imagePath, required this.name});
  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        // child: Image.network(DataRepository.newBeautyList[index].images[0])
        // Image.network(
        //   src: imagePath
        //   // height: Constants.screenWidth / 2 ,
        //   // fit: BoxFit.cover,
        // ),
        children: [
          Image.asset(
            imagePath,
            width: Dimens.gridImageSize,
            height: Dimens.gridImageSize,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.error,
                size: Dimens.gridImageSize,
                color: Colors.red,
              );
            },
          ),
          const SizedBox(height: 3,),
         Text(
              name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis, // 텍스트가 길 경우 생략 부호 추가
              maxLines: 1, // 최대 줄 수 설정
              textAlign: TextAlign.center, // 텍스트 중앙 정렬
            ),
      ],
    );
  }
}
