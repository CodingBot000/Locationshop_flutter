
class SectionData {
  final int id;
  final String headerText;
  final List<SectionSubData> items;
  final bool isOpened;

  SectionData({
    required this.id,
    required this.headerText,
    this.items = const [],
    this.isOpened = false,
  });
}

class SectionSubData {
  final int id;
  final String subText;
  final bool isMenuEnable;

  SectionSubData({
    required this.id,
    this.subText = "",
    this.isMenuEnable = true,
  });
}
