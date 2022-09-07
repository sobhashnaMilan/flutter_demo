import 'package:flutter_demo/helper_manager/network_manager/api_constant.dart';
import 'package:flutter_demo/helper_manager/network_manager/remote_services.dart';
import 'package:flutter_demo/models/response_model.dart';
import 'package:flutter_demo/models/user_list_model.dart';
import 'package:flutter_demo/util/app_common_stuffs/string_constants.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:get/get.dart';

class ApiDemoController extends GetxController {
  // var userList = <UserModel>[].obs;
  var isDataLoading = false.obs, homeDataList = <UserListModel>[].obs;
  HomeModelCustom? homeModel;
  var message = StringConstant();

  updateLoadingFlag() {
    isDataLoading.value = !isDataLoading.value;
    update();
  }

  homeDataAPICall({
    required requestParams,
    required onError,
    required pullToRefresh,
  }) async {
    if (!pullToRefresh) updateLoadingFlag();

    // ResponseModel<HomeModel> homeAPIResponse = await sharedServiceManager.createPostRequest(endPoint: APIConstants.homeScreenDataEndPoint, requestParams: requestParams);
    ResponseModel<HomeModelCustom> homeAPIResponse =
        await sharedServiceManager.createGetRequestCustom(
            typeOfEndPoint: ApiType.userList, params: requestParams);

    if (!pullToRefresh) updateLoadingFlag();
    Logger().d("TAG Data = > ${homeAPIResponse}");
    if (homeAPIResponse.status == ApiConstant.statusCodeSuccess) {
      homeDataList.clear();
      homeModel = homeAPIResponse.data;
      homeDataList.value.addAll(homeModel?.data! ?? []);
      update(homeDataList);
    } else {
      onError(homeAPIResponse.message);
    }
  }


/*userAddAPICall({
    required name,
    required job,
    required onSuccess,
    required onError,
    required onRequestTimeOut,
  }) async {
    try {
      http.Response result = await ApiManager.userAddAPICall(
        name: name,
        job: job,
        onRequestTimeOut: onRequestTimeOut,
      );
      if (result.statusCode == created) {
        var response = jsonDecode(result.body);
        Logger().d( "Response -> $response");
        onSuccess("SUCCESS");
      } else {
        var response = jsonDecode(result.body);
        onError(response['message']);
      }
    } catch (e) {
      Logger().d( "Error -> $e");
      onError(AppString().msgSomethingWrong);
    }
  }*/
}
