class ReviewData {
  final int id;
  final int hospitalId;
  final List<int> surgeryId;
  final String reviewImg;
  final String userId;
  final String reviewDesc;

  ReviewData({
    required this.id,
    required this.hospitalId,
    required this.surgeryId,
    required this.reviewImg,
    required this.userId,
    required this.reviewDesc,
  });


  factory ReviewData.fromJson(Map<String, dynamic> json) {
    return ReviewData(
      id: json['id'],
      hospitalId: json['hospital_id'],
      surgeryId: List<int>.from(json['surgeryId']),
      reviewImg: json['reviewImg'],
      userId: json['userId'],
      reviewDesc: json['reviewDesc'],
    );
  }
}

class ReviewDatas {
  final List<ReviewData> datas;

  ReviewDatas({required this.datas});

  factory ReviewDatas.fromJson(Map<String, dynamic> json) {
    var reviewsJson = json['reviews'] as List;
    List<ReviewData> reviewList = reviewsJson.map((review) => ReviewData.fromJson(review)).toList();

    return ReviewDatas(datas: reviewList);
  }
}
