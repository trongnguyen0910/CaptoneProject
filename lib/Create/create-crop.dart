import 'dart:convert';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/utils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../Personal/voice_to_text_provider.dart';
import 'package:myapp/Create/create.dart' as CustomCreate;
class CreateCrop extends StatefulWidget {
  @override
  State<CreateCrop> createState() => _CreateCropState();
}

class _CreateCropState extends State<CreateCrop> {
  final _varietynameController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? image;
  late TextEditingController _currentController;
  bool _isListening = false;
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;

  _createcrop() async {
    var varietyname = _varietynameController.text;
    var description = _descriptionController.text;
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://fruitseasonms.azurewebsites.net/api/crop-varieties'),
    );
    request.headers['accept'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $accessToken';
    request.fields['CropVarietyName'] = varietyname;
    request.fields['Description'] = description;
print('Headers: ${request.headers}');
print('Request data - Variety Name: $varietyname, Description: $description');

    var imageFile = File(image!.path);
    var imageStream = http.ByteStream(imageFile.openRead());
    var imageLength = await imageFile.length();

    var multipartFile = http.MultipartFile(
      'UploadFile',
      imageStream,
      imageLength,
      filename: imageFile.path,
      contentType: MediaType('image', 'png'),
    );
    request.files.add(multipartFile);
    print('Filename: ${multipartFile.filename}');
    print('Content Type: ${multipartFile.contentType}');
    
    print('varietyname: $varietyname');
    print('description: $description');
  

    try {
      var response = await request.send();
      var statusCode = response.statusCode;
      print('Status code: $statusCode');

     
      if (response.statusCode == 200) {
        print('ok');
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green, // Màu nền màu xanh
          content: AwesomeSnackbarContent(
            title: 'Success', // Tiêu đề thành công
            message: 'Operation was successful', // Tin nhắn thành công
            contentType: ContentType.success, // Loại snackbar thành công
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        Future.delayed(Duration(seconds: 2), () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomCreate.Create()),
          );
        });
      } else if (response.statusCode != 200) {
          var responseString = await response.stream.bytesToString();
          var responseBody = json.decode(responseString);
          var errorMessage = responseBody['errors'];
          String errorContent = errorMessage.toString(); 
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error',
              message: errorContent,
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          print('Response body: $responseString');
          print('Error 400: $errorMessage');
        } else {
          print('Error: ${response.statusCode}');
        }
      } catch (e) {
      print('Exception: $e');
    }
  }
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
   @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      // Cập nhật kết quả nhận diện giọng nói vào TextField hiện tại được chọn
      _currentController.text = result.recognizedWords;
    });
  }

  void _onTextFieldTapped(TextEditingController controller) {
    // Cập nhật biến theo dõi TextField hiện tại được chọn
    _currentController = controller;
    // Bắt đầu hoặc dừng nhận diện giọng nói tùy thuộc vào trạng thái
    if (_speechEnabled) {
      _stopListening();
    } else if (_speechEnabled) {
      _startListening();
    }
  }

  void _toggleListening() {
    if (_isListening) {
      _stopListening();
    } else {
      _startListening();
    }

    setState(() {
      _isListening = !_isListening;
    });
  }

  @override
  Widget build(BuildContext context) {
    VoiceToTextProvider voiceToTextProvider =
        Provider.of<VoiceToTextProvider>(context);
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
       appBar: AppBar(
          title: Text('Tạo mới loại cây', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
        ),
         floatingActionButton: voiceToTextProvider.isVoiceToTextEnabled
            ? FloatingActionButton(
                onPressed: _toggleListening,
                tooltip: 'Listen',
                child: Icon(
                  _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                ),
              )
            : null,
        body: SingleChildScrollView(
      child: Container(
        // createcroppfz (3154:3209)
        width: double.infinity,
        height: 806 * fem,
        decoration: BoxDecoration(
          color: Color(0xfff4f5f9),
        ),
        child: Stack(
          children: [
            Positioned(
              // bodyqzQ (3154:3211)
              left: 18 * fem,
              top: 308 * fem,
              child: Container(
                width: 392.88 * fem,
                height: 502.71 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // detailYP2 (3154:3213)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0.88 * fem, 120.7 * fem),
                      width: 392 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // nameFHS (3154:3224)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 25 * fem),
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 14 * fem, 18 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // autogroup5vrpAHv (LtKm1Qis7xiVU76N9K5Vrp)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 14 * fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Tên loại cây',
                                            labelStyle: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.45 * fem,
                                            ),
                                            suffixText: '*',
                                            suffixStyle: TextStyle(
                                              color: Color(0xffe74c3c),
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.45 * fem,
                                            ),
                                          ),
                                          controller: _varietynameController,
                                            onTap: () => _onTextFieldTapped(
                                                    _varietynameController),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // descriptionhMi (3154:3219)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 14 * fem, 14 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupphrabhz (LtKkgfm6GiHtyDQTRtPhRA)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 14 * fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Mô tả',
                                            labelStyle: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.45 * fem,
                                            ),
                                            suffixText: '*',
                                            suffixStyle: TextStyle(
                                              color: Color(0xffe74c3c),
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.45 * fem,
                                            ),
                                          ),
                                          controller: _descriptionController,
                                            onTap: () => _onTextFieldTapped(
                                                    _descriptionController),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _createcrop();
                      },
                      child: Container(
                        // primarybuttonoyi (3152:2964)
                        margin: EdgeInsets.fromLTRB(
                            0.03 * fem, 0 * fem, 0 * fem, 0 * fem),
                        width: double.infinity,
                        height: 62.01 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff6cc51d),
                          borderRadius: BorderRadius.circular(5 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f6cc51d),
                              offset: Offset(0 * fem, 10 * fem),
                              blurRadius: 4.5 * fem,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Lưu',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              // rectangle59rSC (3152:3005)
              left: 0 * fem,
              top: 52 * fem,
              child: GestureDetector(
                onTap: () {
                  // Add your onTap functionality here
                  pickImage(); // For example, call the pickImage function when tapped
                },
                child: Align(
                  child: image != null
                      ? Image.file(
                          image!,
                          width: 128,
                          height: 128,
                          fit: BoxFit.cover,
                        )
                      : SizedBox(
                          width: 428 * fem,
                          height: 200 * fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5 * fem),
                            child: Image.asset(
                              'assets/mobile/images/add-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
