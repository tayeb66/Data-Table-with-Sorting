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
      "prId": 64460,
      "partsRequestID": 1044,
      "createdAt": "02/01/2024 01:38:32 AM",
      "priority": "Ground",
      "requestedByName": "F10solutions, F10solutions",
      "requestType": "First",
      "itemName": "Item1",
      "statusName": "User Entry",
      "poNumber": "001"
    },
    {
      "prId": 6459,
      "partsRequestID": 1043,
      "createdAt": "01/30/2024 01:29:43 AM",
      "priority": "Test",
      "requestedByName": "F10solutions, F10solutions",
      "requestType": "Second",
      "itemName": "Item2",
      "statusName": "Processing",
      "poNumber": "002"
    },
    {
      "prId": 6447,
      "partsRequestID": 1031,
      "createdAt": "01/23/2024 10:40:22 PM",
      "priority": "Urgent",
      "requestedByName": "F10solutions, F10solutions",
      "requestType": "Thrird",
      "itemName": "Item3",
      "statusName": "User Entry",
      "poNumber": "003"
    },
  ].obs;
  var searchList = [].obs;
  var foundResult = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchList = dataRowList;
    foundResult = searchList;
  }

  void runFilter({value}) {
    if(value.toString().isEmpty){
      searchList = dataRowList;
    }else{
       searchList.value = dataRowList.where((element) =>
           element["prId"].toString().toLowerCase().contains(value.toString().toLowerCase())).toList();
    }
  }
}