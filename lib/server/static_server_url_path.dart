class StaticServerUrlPath {
  static const String imgOnlinePath_Prefix =
      "https://tqyarvckzieoraneohvv.supabase.co/storage/v1/object/public/hospitalstatic";
  static const String subpath_images_path = "/staticdata/images/";
  static const String surgeryImgPath =
      "$imgOnlinePath_Prefix${subpath_images_path}surgery";
  static const String hospitalImgPath =
      "$imgOnlinePath_Prefix${subpath_images_path}hospitalimg";
  static const String eventsImgPath =
      "$imgOnlinePath_Prefix${subpath_images_path}events";
  static const String doctorsImgPath =
      "$imgOnlinePath_Prefix${subpath_images_path}doctors";

  void getPrintResUrlsForDebug() {
    String filteringDebugText = "getPrintResUrlsForDebug-";
    print("$filteringDebugText[surgeryImgMaps]");

    printDebug(surgeryImgMaps);

    print("$filteringDebugText[hospitalImgUrlMaps]");
    printDebug(hospitalImgUrlMaps);

    print("$filteringDebugText[eventsImgUrlMaps]");
    printDebug(eventsImgUrlMaps);

    print("$filteringDebugText[doctorsImgUrlMaps]");
    printDebug(doctorsImgUrlMaps);
  }

  void printDebug(Map<String, String> map) {
    map.forEach((key, value) {
      print('key: $key, value: $value');
    });
  }

  static const Map<String, String> surgeryImgMaps = {
    "surgery_acne": "$surgeryImgPath/surgery_acne.png",
    "surgery_body": "$surgeryImgPath/surgery_body.png",
    "surgery_botox": "$surgeryImgPath/surgery_botox.png",
    "surgery_lifting": "$surgeryImgPath/surgery_lifting.png",
    "surgery_pigmentation": "$surgeryImgPath/surgery_pigmentation.png",
    "surgery_pore": "$surgeryImgPath/surgery_pore.png",
    "surgery_skinbooster": "$surgeryImgPath/surgery_skinbooster.png",
  };

  static const Map<String, String> hospitalImgUrlMaps = {
    "reone1": "$hospitalImgPath/hospital_reone.png",
    "reone2": "$hospitalImgPath/hospital_reone2.png",
    "reone3": "$hospitalImgPath/hospital_reone3.png",
    "reone4": "$hospitalImgPath/hospital_reone4.png",
    "chungdam_ace": "$hospitalImgPath/hospital_chungdam_ace.png",
    "wanna": "$hospitalImgPath/hospital_wanna_plastic_surgery.png",
    "youjins": "$hospitalImgPath/hospital2_youjins.png",
    "hospital1": "$hospitalImgPath/hospital1.png",
    "brillyn": "$hospitalImgPath/hospital3_brillyn.png",
    "boss": "$hospitalImgPath/hospital4_boss.png",
    "vline": "$hospitalImgPath/hospital5_vline.png",
  };

  static const Map<String, String> eventsImgUrlMaps = {
    "event_1": "$eventsImgPath/event_1.png",
    "event_2": "$eventsImgPath/event_2.png",
    "event_3": "$eventsImgPath/event_3.png",
    "event_4": "$eventsImgPath/event_4.png",
    "event_5": "$eventsImgPath/event_5.png",
    "event_6": "$eventsImgPath/event_6.png",
    "event_7": "$eventsImgPath/event_7.png",
    "event_8": "$eventsImgPath/event_8.png",
    "event_9": "$eventsImgPath/event_9.png",
    "event_10": "$eventsImgPath/event_10.png",
    "event_11": "$eventsImgPath/event_11.png",
  };

  static const Map<String, String> doctorsImgUrlMaps = {
    "doctor_reone1": "$doctorsImgPath/doctor_reone1.png",
    "doctor_reone2": "$doctorsImgPath/doctor_reone2.png",
    "doctor_reone3": "$doctorsImgPath/doctor_reone3.png",
    "doctor_wanna1": "$doctorsImgPath/doctor_wanna1.png",
    "doctor_temp0": "$doctorsImgPath/doctor_temp0.png",
    "doctor_temp1": "$doctorsImgPath/doctor_temp1.png",
    "doctor_temp2": "$doctorsImgPath/doctor_temp2.png",
    "doctor_temp3": "$doctorsImgPath/doctor_temp3.png",
    "doctor_temp4": "$doctorsImgPath/doctor_temp4.png",

    "doctor_temp5": "$doctorsImgPath/doctor_temp4.png",
    "doctor_temp6": "$doctorsImgPath/doctor_temp4.png",
    "doctor_temp7": "$doctorsImgPath/doctor_temp4.png",
    "doctor_temp8": "$doctorsImgPath/doctor_temp4.png",

  };
}
