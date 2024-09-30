class SurgeryData {
  final int id;
  final String surgeryName;
  final List<String> surgeryImgs;
  final String surgeryDesc;

  SurgeryData({
    required this.id,
    required this.surgeryName,
    required this.surgeryImgs,
    required this.surgeryDesc,
  });

  factory SurgeryData.fromJson(Map<String, dynamic> json) {
    return SurgeryData(
      id: json['id'],
      surgeryName: json['surgeryName'],
      surgeryImgs: List<String>.from(json['surgeryImgs']),
      surgeryDesc: json['surgeryDesc'],
    );
  }
}

class SurgeryDataResponse {
  final List<SurgeryData> datas;

  SurgeryDataResponse({required this.datas});

  factory SurgeryDataResponse.fromJson(Map<String, dynamic> json) {
    var surgeryJson = json['surgery'] as List;
    List<SurgeryData> surgeryList =
        surgeryJson.map((surgery) => SurgeryData.fromJson(surgery)).toList();

    return SurgeryDataResponse(datas: surgeryList);
  }
}
