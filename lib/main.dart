// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _message = '';

//   Future<void> _getData() async {
//     // Replace this URL with the URL of your API endpoint
//     final response = await http.get(
//         Uri.parse('https://www.boleto.softwaregc.com/public/api/auth/logout'),
//         headers: {
//           'Authorization':
//               'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTJiNGJmNWE4MjgwOWEzNjRhYWZlNDYwMGQwZjZlOWY2MTk5MTg1NzBmZTU2ZDg0YjVjZjA4NWRhYjgwYWNlNGI1ZjQwNDNlZDNmMWQ3Y2MiLCJpYXQiOjE2Nzk1ODk4NDgsIm5iZiI6MTY3OTU4OTg0OCwiZXhwIjoxNzExMjEyMjQ4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.NIc_wxHIpU84IBHOpvwtS-aPLd7k2Jqlck7Z6SzYqm7NHxpMpmY6t_iScWAT_PKugx2UCphd7ZtDRgBISv4QTzHoJDOfPw61nb_aJuoCvQ59JNmTf5ilgnXG5O1UsboZ9CmIZpr2Fp8YtHpWXrFVRSxKzY9TLHyc3KREELBKhN5j1r4xUnnelKhLWN_wNyrC3wTidjKv1QjsoMTCjL8SismJ1pAyoeYoffg7Lmq892vcL9EzUaDfojBqbjskg_0bSGi1gposLclYpSfdJE1s7i-hQWYamoTn_HnfSr_3Ma4GFANXqwjJZl_gNkN3l1xVfDcF4L4LBmezGgrRNv_iw820cbF6Lym0PPb4I9JETxj2kNLRcxvQOPibumCczAkYosHmNUQr_uh3_JaG5sgYJWBHmcLNh_FgLbdBKOv2Rn5rrBJ3Kvfodl0qygr2fCr6n5sF0BZsOuyhlBVx2jVXiSbvV8XHtweE3RFdpCWMxYNPKKG9w2a053FcTePnPD2eOhnnBNpvEsfbP0lfmGwXtyPNey_IReeJ0FTNTMC3eSRRd6vtX16sKF5JuvecOzkGDAbdQroJtToPU8XiAFnVPbvZ4k-4wvAMvkxJ7GtjlveR9EXIu2cDaVQKBoXTpO1THYJpqk6I6SPFKEzwqeHngdIcwsWJDORlqGGiFXVSfkU'
//         });
//     final data = jsonDecode(response.body);
//     setState(() {
//       _message = data['message'];
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'QR Code Consuming API',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('QR Code Data Json'),
//         ),
//         body: Center(
//           child: QrImage(
//             data: 'message: $_message',
//             version: QrVersions.auto,
//             size: 200.0,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _token = '';

  Future<void> _getData() async {
    // Replace this URL with the URL of your API endpoint
    final response = await http.get(
        Uri.parse(
            'https://www.boleto.softwaregc.com/public/api/auth/boletos_validar'),
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWNlZjFlMTM5MjI5NjU5Njk2NmJjMzE0NTk4OTkxZDdjNjEyMTBiZDAxZmMzODdmMWEzNzA5MzY1OGQ5OGFmMGVkNGFhNGUwZGVmYTBlMDkiLCJpYXQiOjE2Nzk2MDczMTUsIm5iZiI6MTY3OTYwNzMxNSwiZXhwIjoxNzExMjI5NzE1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.eI6cbUp6hSKqQ7nty9SDnd8tbTlMGTVTXeHvTTCyah4_FoRKYHrd0sbXWdfqGYQlQ3A4GJpH-9bl3-lyUfRQe-thrBOkJzxcRpPai9EQt3NuEFSwgtQ9h7I46-eNLdH5kEs3sZSerd4CLjkZ2WLBUKJ6V0rDpaJYjp9jeluuwfgdZVObV-u0bXse7Sviht3TpZTmZu04D-Pq-Z65EqdBJaxKKE3jl7TOGZXZk0dHgxtz4Dbom03g9nWKtrlgSgzH9DxWV0sEiWzXKMGZGRiavYcb5a6CyP0TxgFVA5No5n18JHG3yGUOCyU4ak6QedSpMWtaO8_YvyHHYF04vVnH3MMWQd8frUbbBNxln2e3nq50TXO-CX7aWeXFMQ8q1GxgQIyyYNtrV4nekaK3kvLID2uMwTXottFrmhWhBCEkr8d4cfekvv2ud7l1VcoDtaQa2k7h4py_K9MW35RCrsO2mKaHmECCZ9vUTmpb1MVmUdEkKcBQDDLgzw1GI_bPl2nH1ZFmPsyGGEcYpd5OMzwBLGcJUyOrDRKZ4NRG5T2bvH0rbAkxds03V5Oy0UJxRoNGqigHIlq2fBqCgxYYlQEvXjz6Dum57A0P0h29sBeVDkQuwMU7svFMbB8hwXSz1OeRCBXzjIaqGUs4bsIPEwzvFzFwnQPt213SFW05pr4zQ9E'
        });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      _token = data['token'];
    } else {
      print('ERROR FALLO');
    }
  }

  @override
  void initState() {
    setState(() {
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('QR Code Example'),
        ),
        body: Center(
          child: QrImage(
            data: 'Token: $_token',
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
