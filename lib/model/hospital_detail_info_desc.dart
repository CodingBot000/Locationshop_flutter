class HospitalDetailInfoDesc {
  final int id;
  final List<String> doctors;
  final String descAddress;
  final String openingHour;
  final String facilities;
  final String etc;

  HospitalDetailInfoDesc({
    required this.id,
    required this.doctors,
    required this.descAddress,
    required this.openingHour,
    required this.facilities,
    required this.etc,
  });

  factory HospitalDetailInfoDesc.fromJson(Map<String, dynamic> json) {
    return HospitalDetailInfoDesc(
      id: json['id'],
      doctors: List<String>.from(json['doctors']),
      descAddress: json['descAddress'],
      openingHour: json['openingHour'],
      facilities: json['facilities'],
      etc: json['etc'],
    );
  }
}

class DetailHospitalInfoDescResponse {
  final List<HospitalDetailInfoDesc> datas;

  DetailHospitalInfoDescResponse({required this.datas});

  factory DetailHospitalInfoDescResponse.fromJson(Map<String, dynamic> json) {
    var detailsJson = json['detailsdesc'] as List;
    List<HospitalDetailInfoDesc> detailList = detailsJson.map((detail) => HospitalDetailInfoDesc.fromJson(detail)).toList();

    return DetailHospitalInfoDescResponse(datas: detailList);
  }
}
