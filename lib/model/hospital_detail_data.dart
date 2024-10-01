class HospitalDetail {
  final int id;
  final String tel;
  final String kakaotalk;
  final String homepage;
  final String instagram;
  final String facebook;
  final String blog;
  final String youtube;
  final String tiktok;
  final String snapchat;
  final String map;
  final String searchQuery;

  HospitalDetail({
    required this.id,
    required this.tel,
    required this.kakaotalk,
    required this.homepage,
    required this.instagram,
    required this.facebook,
    required this.blog,
    required this.youtube,
    required this.tiktok,
    required this.snapchat,
    required this.map,
    required this.searchQuery,
  });

  factory HospitalDetail.fromJson(Map<String, dynamic> json) {
    return HospitalDetail(
      id: json['id'],
      tel: json['tel'],
      kakaotalk: json['kakaotalk'],
      homepage: json['homepage'],
      instagram: json['instagram'],
      facebook: json['facebook'],
      blog: json['blog'],
      youtube: json['youtube'],
      tiktok: json['tiktok'],
      snapchat: json['snapchat'],
      map: json['map'],
      searchQuery: json['searchQuery'],
    );
  }
}

class HospitalDetailResponse {
  final List<HospitalDetail> datas;

  HospitalDetailResponse({required this.datas});

  factory HospitalDetailResponse.fromJson(Map<String, dynamic> json) {
    var detailsJson = json['details'] as List;
    List<HospitalDetail> detailList = detailsJson.map((detail) => HospitalDetail.fromJson(detail)).toList();

    return HospitalDetailResponse(datas: detailList);
  }
}
