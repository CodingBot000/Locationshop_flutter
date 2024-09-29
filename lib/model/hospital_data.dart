class HospitalData {
  final int id;
  final String productName;
  final String searchQuery;
  final String region;
  final List<String> images;
  final List<int> surgeries;
  final bool wish;

  HospitalData({
    required this.id,
    required this.productName,
    required this.searchQuery,
    required this.region,
    required this.images,
    required this.surgeries,
    required this.wish,
  });


  factory HospitalData.fromJson(Map<String, dynamic> json) {
    return HospitalData(
      id: json['id'],
      productName: json['productName'],
      searchQuery: json['searchQuery'],
      region: json['region'],
      images: List<String>.from(json['images']),
      surgeries: List<int>.from(json['surgeries']),
      wish: json['wish'],
    );
  }
}

class HospitalDatas {
  final List<HospitalData> datas;

  HospitalDatas({required this.datas});

  factory HospitalDatas.fromJson(Map<String, dynamic> json) {
    var hospitalsJson = json['hospitals'] as List;
    List<HospitalData> hospitalList = hospitalsJson.map((hospital) => HospitalData.fromJson(hospital)).toList();

    return HospitalDatas(datas: hospitalList);
  }
}
