import 'package:get/get.dart';

class TableController extends GetxController{

  var isAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataColumnList = [
    {
      "headerName" : "PartsId",
    },
    {
      "headerName" : "CreatedAt",
    },
    {
      "headerName" : "Priority",
    },
    {
      "headerName" : "Requested By Name",
    },
    {
      "headerName" : "request Type",
    },
    {
      "headerName" : "Item Name",
    },
    {
      "headerName" : "Status Name",
    },
    {
      "headerName" : "PO Number",
    },

  ].obs;

  var dataRowList = [
    {
      "prId": 6460,
      "partsRequestID": 1044,
      "createdAt": "02/01/2024 01:38:32 AM",
      "priority": "",
      "requestedByName": "F10solutions, F10solutions",
      "requestType": "",
      "itemName": "",
      "statusName": "User Entry",
      "poNumber": ""
    },
    {
      "prId": 6459,
      "partsRequestID": 1043,
      "createdAt": "01/30/2024 01:29:43 AM",
      "priority": "",
      "requestedByName": "F10solutions, F10solutions",
      "requestType": "",
      "itemName": "",
      "statusName": "Processing",
      "poNumber": ""
    },
    {
      "prId": 6447,
      "partsRequestID": 1031,
      "createdAt": "01/23/2024 10:40:22 PM",
      "priority": "",
      "requestedByName": "F10solutions, F10solutions",
      "requestType": "",
      "itemName": "",
      "statusName": "User Entry",
      "poNumber": ""
    },
  ].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}