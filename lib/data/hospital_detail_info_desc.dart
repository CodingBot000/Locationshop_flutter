class DetailHospitalInfoDesc {
  final int id;
  final List<String> doctors;
  final String descAddress;
  final String openingHour;
  final String facilities;
  final String etc;

  DetailHospitalInfoDesc({
    required this.id,
    required this.doctors,
    required this.descAddress,
    required this.openingHour,
    required this.facilities,
    required this.etc,
  });

  factory DetailHospitalInfoDesc.fromJson(Map<String, dynamic> json) {
    return DetailHospitalInfoDesc(
      id: json['id'],
      doctors: List<String>.from(json['doctors']),
      descAddress: json['descAddress'],
      openingHour: json['openingHour'],
      facilities: json['facilities'],
      etc: json['etc'],
    );
  }
}

class DetailHospitalInfoDescList {
  final List<DetailHospitalInfoDesc> datas;

  DetailHospitalInfoDescList({required this.datas});

  factory DetailHospitalInfoDescList.fromJson(Map<String, dynamic> json) {
    var detailsJson = json['detailsdesc'] as List;
    List<DetailHospitalInfoDesc> detailList = detailsJson.map((detail) => DetailHospitalInfoDesc.fromJson(detail)).toList();

    return DetailHospitalInfoDescList(datas: detailList);
  }
}
