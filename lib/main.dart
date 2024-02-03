import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_data_table/table_controller.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends GetView<TableController> {

  @override
  final TableController controller = Get.put(TableController());
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TableController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text("Data Table"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx((){
          return DataTable(
              sortAscending: controller.isAscending.value,
              sortColumnIndex: controller.sortColumnIndex.value,
              showCheckboxColumn: true,
              columns: [
                for(int index = 0; index < controller.dataColumnList.length; index++)
                  DataColumn(
                    onSort: (columnIndex, ascending) {
                      controller.isAscending.value = ascending;
                      controller.sortColumnIndex.value = columnIndex;
                      if(columnIndex == 0){
                        if(ascending){
                          controller.dataRowList.sort((a,b) =>
                              b["prId"].toString().compareTo(a["prId"].toString()));
                        }else{
                          controller.dataRowList.sort((a,b) =>
                              a["prId"].toString().compareTo(b["prId"].toString()));
                        }
                      }else if(columnIndex == 1){
                        if(ascending){
                          print("ascending : $ascending");
                          controller.dataRowList.sort((a,b) =>
                              a["createdAt"].toString().compareTo(b["createdAt"].toString()));
                        }else{
                          print("ascending : $ascending");
                          controller.dataRowList.sort((a,b) =>
                              b["createdAt"].toString().compareTo(a["createdAt"].toString()));
                        }
                      }
                    },

                    label: Obx(() => Text(controller.dataColumnList[index]["headerName"].toString())),
                  ),
              ],
              rows: [
                for(int index = 0; index < controller.dataRowList.length; index++)
                  DataRow(
                      cells: [
                        DataCell(Obx(() => Text(controller.dataRowList[index]["prId"].toString()))),
                        DataCell(Obx(() => Text(controller.dataRowList[index]["createdAt"].toString()))),
                        DataCell(Obx(() => Text(controller.dataRowList[index]["priority"].toString()))),
                        DataCell(Obx(() => Text(controller.dataRowList[index]["requestedByName"].toString()))),
                        DataCell(Obx(() => Text(controller.dataRowList[index]["requestType"].toString()))),
                        DataCell(Obx(() => Text(controller.dataRowList[index]["itemName"].toString()))),
                        DataCell(Obx(() => Text(controller.dataRowList[index]["statusName"].toString()))),
                        DataCell(Obx(() => Text(controller.dataRowList[index]["poNumber"].toString()))),
                      ]
                  ),
              ]
          );
        }),
      ),
    );
  }
}

