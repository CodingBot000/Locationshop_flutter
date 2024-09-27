
import '../static_server_url_path.dart';

final String eventDataJson = '''
        {
          "events": [
            {
              "id":0,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1,
              "eventName": "예쁘니깐 울랄라",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_1"]}",
              "surgeryIds": [0, 1,2,3],
              "desc": " 0 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail descriptiondetail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":1,
              "eventDateFrom": "2024-04-14",
              "eventDateTo": "2024-05-14",
              "hospital_id": 1,
              "eventName": "너이뻐 근데 더 이쁠래",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_2"]}",
              "surgeryIds": [0, 1,2],
              "desc": " 1 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail descriptiondetail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":2,
              "eventDateFrom": "2024-07-14",
              "eventDateTo": "2024-09-24",
              "hospital_id": 1,
              "eventName": "Awesome Beauty",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_3"]}",
              "surgeryIds": [0, 3],
              "desc": " 2 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail descriptiondetail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":3,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-13",
              "hospital_id": 2,
              "eventName": "2번 이벤트1",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_4"]}",
              "surgeryIds": [0, 1],
              "desc": " 3 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":4,
              "eventDateFrom": "2024-06-14",
              "eventDateTo": "2024-07-14",
              "hospital_id": 2,
              "eventName": "이벤트1",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [0, 2, 4],
              "desc": " 4 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":5,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 3,
              "eventName": "이벤트1",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [0, 1,2,3,5],
              "desc": " 5 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":6,
              "eventDateFrom": "2024-07-14",
              "eventDateTo": "2024-08-24",
              "hospital_id": 2,
              "eventName": "이벤트1",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_7"]}",
              "surgeryIds": [0, 1,2,3,5 , 6,7,8],
              "desc": " 6 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":7,
              "eventDateFrom": "2024-10-04",
              "eventDateTo": "2024-11-14",
              "hospital_id": 3,
              "eventName": "The K",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_8"]}",
              "surgeryIds": [1,2,3,4,5],
              "desc": " 7 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":8,
              "eventDateFrom": "2024-05-14",
              "eventDateTo": "2024-08-14",
              "hospital_id": 1,
              "eventName": "K-Pop and K-Beauty",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_9"]}",
              "surgeryIds": [0,1,2,3,4,5],
              "desc": " 8 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":9,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 2,
              "eventName": "K-Beauty Beautiful",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_10"]}",
              "surgeryIds": [0,1,2,5],
              "desc": " 9 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":10,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 3,
              "eventName": "K-Beauty festival",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_11"]}",
              "surgeryIds": [0,1,2,3,5,7,8],
              "desc": " 10 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":11,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1,
              "eventName": "We are the one",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [0,1,2,5],
              "desc": " 11 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":12,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 3,
              "eventName": "Eye",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [1000],
              "desc": " 12 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },


            {
              "id":12,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 3,
              "eventName": "Eye",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [1000],
              "desc": " 12 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":13,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1,
              "eventName": "Eye",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [1000],
              "desc": " 13 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":14,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1,
              "eventName": "Eye",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [1000],
              "desc": " 14 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":15,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1,
              "eventName": "Eye",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [1000],
              "desc": " 15 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },


            {
              "id":16,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 3,
              "eventName": "Nose",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [1001],
              "desc": " 16 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":17,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 3,
              "eventName": "Nose",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [1001],
              "desc": " 17 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":18,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 3,
              "eventName": "Nose",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [1001],
              "desc": " 18 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":19,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 3,
              "eventName": "Nose",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [1001],
              "desc": " 19 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },


            {
              "id":20,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 3,
              "eventName": "Bimaxillary operation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_2"]}",
              "surgeryIds": [1002],
              "desc": " 20 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":21,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1,
              "eventName": "Bimaxillary operation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_1"]}",
              "surgeryIds": [1002],
              "desc": " 21 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
                               {
              "id":22,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 2,
              "eventName": "Bimaxillary operation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_3"]}",
              "surgeryIds": [1002],
              "desc": " 22 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
             {
              "id":23,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1,
              "eventName": "Liposuction",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_6"]}",
              "surgeryIds": [1003],
              "desc": " 23 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
             {
              "id":24,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 2,
              "eventName": "Liposuction",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_2"]}",
              "surgeryIds": [1003],
              "desc": " 24 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":25,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 3,
              "eventName": "Liposuction",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_2"]}",
              "surgeryIds": [1003],
              "desc": " 25 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":26,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1001,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_3"]}",
              "surgeryIds": [1004],
              "desc": " 25 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },

              {
              "id":27,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1000,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_1"]}",
              "surgeryIds": [1004],
              "desc": " 26 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":28,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1002,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 26 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
             {
               "id":29,
               "eventDateFrom": "2024-03-14",
               "eventDateTo": "2024-04-14",
               "hospital_id": 1001,
               "eventName": "Hair transplantation",
               "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_4"]}",
               "surgeryIds": [1004],
               "desc": " 27 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
             },
             
             {
              "id":30,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1003,
              "eventName": "Liposuction",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_2"]}",
              "surgeryIds": [1003],
              "desc": " 25 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":31,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1004,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_3"]}",
              "surgeryIds": [1004],
              "desc": " 25 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },

              {
              "id":32,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1004,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_1"]}",
              "surgeryIds": [1004],
              "desc": " 26 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":33,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1005,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 26 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            
            {
              "id":34,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1006,
              "eventName": "Liposuction",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_2"]}",
              "surgeryIds": [1003],
              "desc": " 25 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":35,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1007,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_3"]}",
              "surgeryIds": [1004],
              "desc": " 35 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },

              {
              "id":36,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1008,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_1"]}",
              "surgeryIds": [1004],
              "desc": " 36 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":37,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1009,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            
            
            
            {
              "id":38,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1009,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":39,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1009,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":40,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1009,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            
            {
              "id":41,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1010,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":42,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1011,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },{
              "id":43,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1012,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":44,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1013,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":45,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1015,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":46,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1017,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":47,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1019,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":48,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1018,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },{
              "id":49,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1009,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            },
            {
              "id":50,
              "eventDateFrom": "2024-03-14",
              "eventDateTo": "2024-04-14",
              "hospital_id": 1011,
              "eventName": "Hair transplantation",
              "eventImg": "${StaticServerUrlPath.eventsImgUrlMaps["event_5"]}",
              "surgeryIds": [1004],
              "desc": " 37 detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description\\n detail description"
            }
          ]
        }
    ''';
