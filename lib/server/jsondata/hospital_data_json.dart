
import '../../common/enums.dart';
import '../../common/init_value.dart';
import '../static_server_url_path.dart';

final String hospitalDataJson = '''    
        {
          "hospitals": [
            {
              "id":0,
              "productName": "Re-One",
              "searchQuery": "리원피부과의원",                     
              "region": "${LocationNames.APGUJEONG.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["reone1"]}", "${StaticServerUrlPath.hospitalImgUrlMaps["reone2"]}", "${StaticServerUrlPath.hospitalImgUrlMaps["reone3"]}", "${StaticServerUrlPath.hospitalImgUrlMaps["reone4"]}"],
              "surgeries": [2002, 2004, 2005, 1000, 1001, 1002, 1003, 1004],
              "wish": false
            },
            {
              "id":1,
              "productName": "Chungdam Ace",
              "searchQuery": "청담에이스의원",
              "region": "${LocationNames.APGUJEONG.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["chungdam_ace"]}"],
              "surgeries": [2004, 2005, 1000, 1001, 1002, 1003, 1004],
              "wish": false
            },
            {
            "id":2,
              "productName": "Wanna Plastic Surgery",
              "searchQuery": "워나성형외과의원",
              "region": "${LocationNames.APGUJEONG.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["wanna"]}"],
              "surgeries": [2000, 2001, 2007, 1000, 1001, 1002, 1003, 1004],
              "wish": false
            },
            {
              "id":1001,
              "productName": "Chungdam Oracle",
              "searchQuery": "청담오라클피부과의원",
              "region": "${LocationNames.CHUNGDAM.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["hospital1"]}"],
              "surgeries": [2002, 2003, 2004, 1000, 1001, 1002, 1003, 1004],
              "wish": false
            },
            {
              "id":1002,
              "productName": "Youjins",
                "searchQuery": "브이라인성형외과",
              "region": "${LocationNames.GANGNAM.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["youjins"]}"],
              "surgeries": [1001, 1003, 1004, 2000, 2002, 2003],
              "wish": false
            },
            {
              "id":1003,
              "productName": "Brillyn",
            "searchQuery": "브릴린의원",
              "region": "${LocationNames.APGUJEONG.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["brillyn"]}"],
              "surgeries": [2000, 2001, 2003, 2004, 2007,1000, 1001, 1004],
              "wish": false
            },
            {
              "id":1004,
              "productName": "Boss",
            "searchQuery": "보스의원",
              "region": "${LocationNames.HONGDAE.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["boss"]}"],
              "surgeries": [2000, 2001, 2004, 2005, 1001, 1002, 1003, 1004],
              "wish": false
            },
            {
              "id":1005,
              "productName": "Hospital-5",
            "searchQuery": "청담포레브",
              "region": "${LocationNames.SONGDO.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["vline"]}"],
              "surgeries": [2000,  2003, 2004, 2006, 2007,1000, 1002, 1003, 1004],
              "wish": false
            },
            {
              "id":1006,
              "productName": "Hospital-6",
          "searchQuery": "청담포레브",
              "region": "${LocationNames.MYUNGDONG.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["vline"]}"],
              "surgeries": [2001, 2002, 2003, 2006, 2007,1000, 1001, 1004],
              "wish": false
            },
            {
              "id":1007,
              "productName": "Hospital-7",
             "searchQuery": "청담포레브",
              "region": "${LocationNames.MYUNGDONG.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["hospital1"]}"],
              "surgeries": [2000, 2001, 2005, 2006, 2007,1000, 1002, 1003, 1004],
              "wish": false
            },
            {
              "id":1008,
              "productName": "Hospital-8",
           "searchQuery": "청담포레브",
              "region": "${LocationNames.APGUJEONG.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["youjins"]}"],
              "surgeries": [2000, 2001, 2002, 2005, 2006, 2007,1000, 1003, 1004],
              "wish": false
            },
            {
              "id":1009,
              "productName": "Hospital-9",
          "searchQuery": "청담포레브",
              "region": "${LocationNames.APGUJEONG.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["brillyn"]}"],
              "surgeries": [2000, 2001, 2002, 1002, 1003],
              "wish": false
            },
            {
              "id":1010,
              "productName": "Hospital-10",
              "searchQuery": "청담포레브",
              "region": "${LocationNames.CHUNGDAM.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["boss"]}"],
              "surgeries": [2002, 2003, 2004, 2005, 1000, 1001],
              "wish": false
            },
            {
              "id":1011,
              "productName": "Hospital-11",
              "searchQuery": "청담포레브",
              "region": "${LocationNames.CHUNGDAM.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["vline"]}"],
              "surgeries": [2000, 2001, 2005, 2006, 2007,1001, 1002, 1003],
              "wish": false
            },
            {
              "id":1012,
              "productName": "Hospital-12",
            "searchQuery": "청담포레브",
              "region": "${LocationNames.GANGNAM.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["hospital1"]}"],
              "surgeries": [2003, 2004, 2005, 2007,1000, 1001],
              "wish": false
            },
            {
              "id":1013,
              "productName": "Hospital-13",
          "searchQuery": "청담포레브",
              "region": "${LocationNames.GANGNAM.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["youjins"]}"],
              "surgeries": [2000, 2001, 2002, 2003, 2007,1000, 1001, 1002,1004],
              "wish": false
            },
            {
              "id":1014,
              "productName": "Hospital-14",
            "searchQuery": "청담포레브",
              "region": "${LocationNames.HONGDAE.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["brillyn"]}"],
              "surgeries": [2000,  2003, 2004, 2005, 2006, 2007,1000,  1003, 1004],
              "wish": false
            },
            {
              "id":1015,
              "productName": "Hospital-15",
            "searchQuery": "청담포레브",
              "region": "${LocationNames.GANGNAM.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["boss"]}"],
              "surgeries": [2000, 2004, 2005, 2006, 2007,1000,  1004],
              "wish": false
            },
            {
              "id":1016,
              "productName": "Hospital-16",
            "searchQuery": "청담포레브",
              "region": "${LocationNames.HONGDAE.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["vline"]}"],
              "surgeries": [ 2002, 2003, 2004, 2005, 1000, 1001, 1002, 1004],
              "wish": false
            },
            {
              "id":1017,
              "productName": "Hospital-17",
           "searchQuery": "청담포레브",
              "region": "${LocationNames.HONGDAE.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["hospital1"]}"],
              "surgeries": [2000, 2001, 2002, 2003, 2007,1000, 1001, 1002, 1003, 1004],
              "wish": false
            },
            {
              "id":1018,
              "productName": "Hospital-18",
                 "searchQuery": "청담포레브",
              "region": "${LocationNames.MYUNGDONG.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["youjins"]}"],
              "surgeries": [2004, 2005, 2006, 2007,1000, 1001],
              "wish": false
            },
            {
              "id":1019,
              "productName": "Hospital-19",
            "searchQuery": "청담포레브",
              "region": "${LocationNames.MYUNGDONG.value}",
              "images": ["${StaticServerUrlPath.hospitalImgUrlMaps["brillyn"]}"],
              "surgeries": [2000, 2001, 2005, 2006, 2007,1000, 1003, 1004],
              "wish": false
            }
          ]
        }
    ''';
