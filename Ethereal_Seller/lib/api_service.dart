import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/user.dart';

class ApiService {
  static String url(int nrResults) {
    return 'https://api.randomuser.me/?results=$nrResults&format=json&exc=picture';
  }

  static Future<List<User>> getUsers({int nrUsers = 1}) async {
    try {
      final response = await http.get(
          Uri.parse(
            url(nrUsers),
          ),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        // Copied from their website incase of incorrect response
        Map data = [
          {
            "gender": "female",
            "name": {"title": "Miss", "first": "Jennie", "last": "Nichols"},
            "location": {
              "street": {
                "number": 8929,
                "name": "Valwood Pkwy",
              },
              "city": "Billings",
              "state": "Michigan",
              "country": "United States",
              "postcode": "63104",
              "coordinates": {"latitude": "-69.8246", "longitude": "134.8719"},
              "timezone": {"offset": "+9:30", "description": "Adelaide, Darwin"}
            },
            "email": "jennie.nichols@example.com",
            "login": {
              "uuid": "7a0eed16-9430-4d68-901f-c0d4c1c3bf00",
              "username": "yellowpeacock117",
              "password": "addison",
              "salt": "sld1yGtd",
              "md5": "ab54ac4c0be9480ae8fa5e9e2a5196a3",
              "sha1": "edcf2ce613cbdea349133c52dc2f3b83168dc51b",
              "sha256":
                  "48df5229235ada28389b91e60a935e4f9b73eb4bdb855ef9258a1751f10bdc5d"
            },
            "dob": {"date": "1992-03-08T15:13:16.688Z", "age": 30},
            "registered": {"date": "2007-07-09T05:51:59.390Z", "age": 14},
            "phone": "(272) 790-0888",
            "cell": "(489) 330-2385",
            "id": {"name": "SSN", "value": "405-88-3636"},
            "picture": {
              "large": "https://randomuser.me/api/portraits/men/75.jpg",
              "medium": "https://randomuser.me/api/portraits/med/men/75.jpg",
              "thumbnail":
                  "https://randomuser.me/api/portraits/thumb/men/75.jpg"
            },
            "nat": "US",
            "info": {
              "seed": "56d27f4a53bd5441",
              "results": 1,
              "page": 1,
              "version": "1.4"
            }
          }
        ] as Map;
        print(data);
        Iterable list = data["results"];
        List<User> users = list.map((l) => User.fromJson(l)).toList();
        return users;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
