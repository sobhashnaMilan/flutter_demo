import 'package:flutter_demo/util/import_export_util.dart';

import '../../controllers/api_demo_controller.dart';
import '../../util/remove_glow_effect.dart';
import '../common/home_screen.dart';

class ApiDemo extends StatefulWidget {
  const ApiDemo({Key? key}) : super(key: key);

  @override
  State<ApiDemo> createState() => _ApiDemoState();
}

class _ApiDemoState extends State<ApiDemo> {
  ApiDemoController controller = ApiDemoController();

  @override
  void initState() {
    super.initState();
    homeDataAPICall();
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context)
        ? DeviceType.mobile
        : DeviceType.desktop;

    return Scaffold(
      appBar: AppBarComponent.buildAppbarForHome(
        titleWidget: Text(
          StringConstant.btnApiDemo.tr,
          textDirection: TextDirection.ltr,
          style: deviceType == DeviceType.mobile
              ? white100Medium22TextStyle(context)
              : white100Medium10TextStyle(context),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(
            CommonStyle.setDynamicWidth(context: context, value: 0.02),
            CommonStyle.setDynamicHeight(context: context, value: 0.01),
            CommonStyle.setDynamicWidth(context: context, value: 0.02),
            CommonStyle.setDynamicHeight(context: context, value: 0.01),
          ),
          child: Obx(
            () => controller.isDataLoading.value
                ? CommonStyle.displayLoadingIndicator(deviceType)
                : buildBodySection(deviceType),
          )),
    );
  }

  /// list view builder

  Widget buildBodySection(DeviceType type) {
    return RefreshIndicator(
      onRefresh: () => homeDataAPICall(pullToRefresh: true),
      child: Stack(
        children: [
          buildLoadNoDataSection(type),
          controller.homeDataList.isEmpty
              ? Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: CommonStyle.setDynamicHeight(
                            context: context,
                            value: type == DeviceType.mobile ? 0.2 : 0.05),
                      ),
                      child: ScrollConfiguration(
                        behavior: RemoveGlowEffect(),
                        child: ListView(),
                      ),
                    ),
                    CommonStyle.loadNoDataView(
                        context: context, deviceType: type),
                  ],
                )
              : type == DeviceType.mobile
                  ? buildItemList()
                  : buildItemListWeb(),
        ],
      ),
    );
  }

  Widget buildItemList() {
    return Padding(
      padding: EdgeInsets.only(
        top: CommonStyle.setDynamicHeight(context: context, value: 0.095),
      ),
      child: ScrollConfiguration(
        behavior: RemoveGlowEffect(),
        child: ListView.builder(
          itemCount: controller.homeDataList.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                CommonStyle.setDynamicWidth(context: context, value: 0.00),
                CommonStyle.setDynamicHeight(context: context, value: 0.01),
                CommonStyle.setDynamicWidth(context: context, value: 0.00),
                CommonStyle.setDynamicHeight(context: context, value: 0.01),
              ),
              child: buildItemRow(i: index, deviceType: DeviceType.mobile),
            );
          },
        ),
      ),
    );
  }

  Widget buildItemListWeb() {
    return Padding(
      padding: EdgeInsets.only(
        top: CommonStyle.setDynamicHeight(context: context, value: 0.15),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: controller.homeDataList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              CommonStyle.setDynamicWidth(context: context, value: 0.00),
              CommonStyle.setDynamicHeight(context: context, value: 0.01),
              CommonStyle.setDynamicWidth(context: context, value: 0.00),
              CommonStyle.setDynamicHeight(context: context, value: 0.01),
            ),
            child: buildItemRow(i: index, deviceType: DeviceType.desktop),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5.5,
        ),
      ),
    );
  }

  Widget buildItemRow({required int i, required DeviceType deviceType}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          CommonStyle.setDynamicWidth(context: context, value: 0.02),
          CommonStyle.setDynamicHeight(context: context, value: 0.01),
          CommonStyle.setDynamicWidth(context: context, value: 0.02),
          CommonStyle.setDynamicHeight(context: context, value: 0.01),
        ),
        child: Text(
          ("${controller.homeDataList[i].name!}\n\n${controller.homeDataList[i].email!}\n\n${controller.homeDataList[i].gender!}") ??
              "",
          style: deviceType == DeviceType.mobile
              ? black80Medium20TextStyle(context)
              : black80Medium10TextStyle(context),
          // maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  /// get user list api call [Get Method]

  Future<void> homeDataAPICall({bool pullToRefresh = false}) async {
    await controller.homeDataAPICall(
      requestParams: null,
      pullToRefresh: pullToRefresh,
      onError: (msg) => SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: msg,
      ),
    );
  }

  /// add user list api call [Post Method]
  Widget buildLoadNoDataSection(DeviceType type) {
    return Padding(
      padding: EdgeInsets.only(
        top: CommonStyle.setDynamicHeight(context: context, value: 0.02),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: ButtonComponent(
          context: context,
          backgroundColor: AppColors.blueColor,
          onPressed: () {},
          text: "add User",
        ),
      ),
    );
  }
/*userAddAPICall() {
    isNetworkConnected().then(
      (connection) {
        if (connection) {
          controller.userAddAPICall(
            name: "agile",
            job: "dev",
            onSuccess: (msg) {
              showSuccessToast(context, msg);
            },
            onError: (msg) {
              showErrorToast(context, msg);
            },
            onRequestTimeOut: (msg) {
              showErrorToast(context, msg);
            },
          );
        } else {
          showErrorToast(context, controller.message.msgInternetMessage);
        }
      },
    );
  }*/
}
