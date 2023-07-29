import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

class AdminService {
  final path = FlutterConfig.get('API_PATH');

  // Upload CSV
  Future uploadCSV(buildingId, file) async {
    var url = Uri.parse('$path/UM/read-CSV');
    final request = http.MultipartRequest(
      'POST',
      url,
    );

    request.fields['buildingid'] = buildingId;
    request.files.add(
      await http.MultipartFile.fromPath('excel', file),
    );

    final response = await request.send();
    if (response.statusCode == 200) {
      final resp = await http.Response.fromStream(response);
      var status = json.decode(resp.body)['status'];
      var message = json.decode(resp.body)['message'];
      var body = json.decode(resp.body)['data'];
      return [status, message, body];
    } else {
      return "Couldn't connect to the server, failed to fetch API!";
    }
  }

  // Read All Resident
  Future readAllResident(buildingId) async {
    var url = Uri.parse('$path/UM/see-all-resident?buildingid=$buildingId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      var message = json.decode(response.body)['message'];
      var body = json.decode(response.body)['data'];
      return [status, message, body];
    } else {
      return "Couldn't connect to the server, failed to fetch API!";
    }
  }

  // Delete Resident
  Future deleteResident(residentiId) async {
    var url = Uri.parse('$path/UM/delete-resident');
    final response = await http.delete(url, body: {
      'residentid': residentiId,
    });
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      var message = json.decode(response.body)['message'];
      var body = json.decode(response.body)['data'];
      return [status, message, body];
    } else {
      return "Couldn't connect to the server, failed to fetch API!";
    }
  }
}
