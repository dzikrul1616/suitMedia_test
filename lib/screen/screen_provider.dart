import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia_test/config/api.dart';
import 'package:suitmedia_test/model/data.dart';
import 'package:suitmedia_test/screen/screen_2_page.dart';
import 'package:suitmedia_test/screen/screen_3_page.dart';

class ScreenProvider extends ChangeNotifier {
  ScreenProvider() {
    getApi();
  }

  final key = GlobalKey<FormState>();
  List<Data> data = [];
  bool isDisposed = false;
  bool isLoading = true;
  bool get _isLoading => isLoading;
  TextEditingController nameController = TextEditingController();
  TextEditingController sentenceController = TextEditingController();
  String resultMessage = '';

  Future<void> refreshData() async {
    await getApi();
    notifyListeners();
  }

  Future<void> getApi() async {
    if (isDisposed) return;
    isLoading = true;
    final url = Uri.parse(ApiConfig.baseUrl);
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        if (isDisposed) return;
        isLoading = false;
        List request = jsonDecode(response.body)['data'];
        data = request.toList().map((item) => Data.fromJson(item)).toList();
        print(data);
        print('Berhasil getApi ${response.statusCode}');
        notifyListeners();
      } else {
        isLoading = true;
        if (isDisposed) return;
        print('Error getApi ${response.statusCode}');
      }
    } catch (e) {
      print('Error getApi ${e}');
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  check(context) {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      checkPalindrome(context);
    }
  }

  checkNext(context) {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      if (resultMessage == 'isPalindrome') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Screen2Page(
                      name: '',
                      user: nameController.text,
                    )));
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(resultMessage),
              actions: [
                TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  void checkPalindrome(context) {
    String sentence = sentenceController.text.toLowerCase().replaceAll(' ', '');
    String reversedSentence =
        String.fromCharCodes(sentence.runes.toList().reversed);
    if (sentence == reversedSentence) {
      resultMessage = 'isPalindrome';

      notifyListeners();
    } else {
      resultMessage = 'not palindrome';

      notifyListeners();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(resultMessage),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
