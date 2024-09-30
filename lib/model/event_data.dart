class EventData {
  final int id;
  final String eventDateFrom;
  final String eventDateTo;
  final int hospitalId;
  final String eventName;
  final String eventImg;
  final List<int> surgeryIds;
  final String desc;

  EventData({
    required this.id,
    required this.eventDateFrom,
    required this.eventDateTo,
    required this.hospitalId,
    required this.eventName,
    required this.eventImg,
    required this.surgeryIds,
    required this.desc,
  });

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      id: json['id'],
      eventDateFrom: json['eventDateFrom'],
      eventDateTo: json['eventDateTo'],
      hospitalId: json['hospital_id'],
      eventName: json['eventName'],
      eventImg: json['eventImg'],
      surgeryIds: List<int>.from(json['surgeryIds']),
      desc: json['desc'],
    );
  }
}

class EventsResponse {
  final List<EventData> datas;

  EventsResponse({required this.datas});

  factory EventsResponse.fromJson(Map<String, dynamic> json) {
    var eventsJson = json['events'] as List;
    List<EventData> eventsList = eventsJson.map((event) => EventData.fromJson(event)).toList();

    return EventsResponse(datas: eventsList);
  }
}
