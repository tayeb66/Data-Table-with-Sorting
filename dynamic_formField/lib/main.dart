import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends GetView<FormController> {

  FormController controller = Get.put(FormController());
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FormController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Textfield"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}

class FormController extends GetxController{
  var formList = [].obs;
  var number = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  addForm({i}){
    formList.addIf(true, formList[i]);
  }
}

