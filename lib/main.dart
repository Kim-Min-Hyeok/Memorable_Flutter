import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memorable/services/documentService.dart';
import 'package:memorable/controllers/DocumentController.dart';
import 'package:memorable/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // DocumentService 초기화
  await Get.putAsync(() => DocumentService().init());
  
  // DocumentController 초기화
  Get.put(DocumentController());

  runApp(MyApp());
}