import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_doctor/screens/home/result.dart';

Future<void> uploadImageToAPI(BuildContext context, imageFile) async {
  final url = Uri.parse('http://plantdoctorapi.aswinsudheer.me/predict');
  late String result;
  try {
    final request = http.MultipartRequest('POST', url);
    request.files.add(
      http.MultipartFile(
        'image',
        imageFile.readAsBytes().asStream(),
        imageFile.lengthSync(),
        filename: 'image.jpg',
      ),
    );

    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      print(response.body);
      final decodedResponse = json.decode(response.body);
      result = decodedResponse['predicted_class'];
    } else {
      print('API request failed with status code: ${response.statusCode}');
      result = response.statusCode.toString();
    }
    Navigator.pop(context); //pop loading screen
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => DisplayResult(apiResponse: result,image: imageFile,),
      )  
    );
  } catch (exception) {
    print('Error uploading the image: $exception');
  }
}
