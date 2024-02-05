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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 40.0,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "Search",
                  suffixIcon: Icon(Icons.search)
                ),
                onChanged: (value){
                  controller.runFilter(value: value);
                },
                onTap: (){},
              ),
            ),
            const SizedBox(height: 20.0,),
            SingleChildScrollView(
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
                                print("ascending11 : ${controller.isAscending}");
                                controller.searchList.sort((a,b) =>
                                    b["prId"].toString().compareTo(a["prId"].toString()));
                              }else{
                                print("ascending11 : ${controller.isAscending}");
                                controller.searchList.sort((a,b) =>
                                    a["prId"].toString().compareTo(b["prId"].toString()));
                              }
                            }else if(columnIndex == 1){
                              if(ascending){
                                print("ascending11 : ${controller.isAscending}");
                                controller.searchList.sort((a,b) =>
                                    a["createdAt"].toString().compareTo(b["createdAt"].toString()));
                              }else{
                                print("ascending11 : ${controller.isAscending}");
                                controller.searchList.sort((a,b) =>
                                    b["createdAt"].toString().compareTo(a["createdAt"].toString()));
                              }
                            }else if(columnIndex == 2){
                              if(ascending){
                                controller.searchList.sort((a,b) =>
                                    a["priority"].toString().compareTo(b["priority"].toString()));
                              }else{
                                controller.searchList.sort((a,b) =>
                                    b["priority"].toString().compareTo(a["priority"].toString()));
                              }
                            }else if(columnIndex == 3){
                              if(ascending){
                                controller.searchList.sort((a,b) =>
                                    a["requestedByName"].toString().compareTo(b["requestedByName"].toString()));
                              }else{
                                controller.searchList.sort((a,b) =>
                                    b["requestedByName"].toString().compareTo(a["requestedByName"].toString()));
                              }
                            }else if(columnIndex == 4){
                              if(ascending){
                                controller.searchList.sort((a,b) =>
                                    a["requestType"].toString().compareTo(b["requestType"].toString()));
                              }else{
                                controller.searchList.sort((a,b) =>
                                    b["requestType"].toString().compareTo(a["requestType"].toString()));
                              }
                            }else if(columnIndex == 5){
                              if(ascending){
                                controller.searchList.sort((a,b) =>
                                    a["itemName"].toString().compareTo(b["itemName"].toString()));
                              }else{
                                controller.searchList.sort((a,b) =>
                                    b["itemName"].toString().compareTo(a["itemName"].toString()));
                              }
                            }else if(columnIndex == 6){
                              if(ascending){
                                controller.searchList.sort((a,b) =>
                                    a["statusName"].toString().compareTo(b["statusName"].toString()));
                              }else{
                                controller.searchList.sort((a,b) =>
                                    b["statusName"].toString().compareTo(a["statusName"].toString()));
                              }
                            }else if(columnIndex == 7){
                              if(ascending){
                                controller.searchList.sort((a,b) =>
                                    a["poNumber"].toString().compareTo(b["poNumber"].toString()));
                              }else{
                                controller.searchList.sort((a,b) =>
                                    b["poNumber"].toString().compareTo(a["poNumber"].toString()));
                              }
                            }
                          },

                          label: Row(children: [Obx(() => Text(controller.dataColumnList[index]["headerName"].toString())),const Icon(Icons.arrow_upward,size: 16.0,)],),
                        ),
                    ],
                    rows: [
                      for(int index = 0; index < controller.searchList.length; index++)
                        DataRow(
                            cells: [
                              DataCell(Obx(() => Text(controller.searchList[index]["prId"].toString()))),
                              DataCell(Obx(() => Text(controller.searchList[index]["createdAt"].toString()))),
                              DataCell(Obx(() => Text(controller.searchList[index]["priority"].toString()))),
                              DataCell(Obx(() => Text(controller.searchList[index]["requestedByName"].toString()))),
                              DataCell(Obx(() => Text(controller.searchList[index]["requestType"].toString()))),
                              DataCell(Obx(() => Text(controller.searchList[index]["itemName"].toString()))),
                              DataCell(Obx(() => Text(controller.searchList[index]["statusName"].toString()))),
                              DataCell(Obx(() => Text(controller.searchList[index]["poNumber"].toString()))),
                            ]
                        ),
                    ]
                );
              }),
            )
          ],
        ),
      ),
    );
  }

}

