import 'package:flutter_demo/controllers/chat/user_list_controller.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/ui/common_widgets/custom_list_tile.dart';
import 'package:flutter_demo/util/app_common_stuffs/preference_keys.dart';
import 'package:flutter_demo/util/app_common_stuffs/screen_routes.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:flutter_demo/util/import_export_util.dart';
import 'package:flutter_demo/util/remove_glow_effect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  UserListController controller = Get.find<UserListController>();

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  getUserList({bool pullToRefresh = false}) async {
    await controller.getUserList(pullToRefresh: pullToRefresh, context: context);
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context) ? DeviceType.mobile : DeviceType.desktop;

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(
            CommonStyle.setDynamicWidth(context: context, value: 0.02),
            CommonStyle.setDynamicHeight(context: context, value: 0.01),
            CommonStyle.setDynamicWidth(context: context, value: 0.02),
            CommonStyle.setDynamicHeight(context: context, value: 0.01),
          ),
          child: Obx(
            () => controller.isDataLoading.value ? CommonStyle.displayLoadingIndicator(deviceType) : buildBodySection(deviceType),
          )),
    );
  }

  /// list view builder

  Widget buildBodySection(DeviceType type) {
    return RefreshIndicator(
      onRefresh: () => getUserList(pullToRefresh: true),
      child: Column(
        children: [
          Container(
            height: type == DeviceType.mobile ? CommonStyle.setDynamicHeight(context: context, value: 0.06) : CommonStyle.setDynamicHeight(context: context, value: 0.13),
            // color: Colors.white30,
            margin: EdgeInsets.fromLTRB(
              CommonStyle.setDynamicWidth(context: context, value: 0.03),
              type == DeviceType.mobile ? CommonStyle.setDynamicHeight(context: context, value: 0.04) : CommonStyle.setDynamicHeight(context: context, value: 0.04),
              CommonStyle.setDynamicWidth(context: context, value: 0.03),
              CommonStyle.setDynamicHeight(context: context, value: 0.00),
            ),
            color: Colors.white30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: CommonStyle.setDynamicWidth(context: context, value: 0.004), left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                          child: Text(
                            "Contacts",
                            style: TextStyle(
                              fontFamily: StringConstant.poppinsFont,
                              fontSize: MediaQuery.of(context).size.longestSide * 0.034,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor.withOpacity(0.80),
                            ),
                            // maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                controller.userList.isEmpty
                    ? Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: CommonStyle.setDynamicHeight(context: context, value: type == DeviceType.mobile ? 0.2 : 0.05),
                            ),
                            child: ScrollConfiguration(
                              behavior: RemoveGlowEffect(),
                              child: ListView(),
                            ),
                          ),
                          CommonStyle.loadNoDataView(context: context, deviceType: type),
                        ],
                      )
                    : type == DeviceType.mobile
                        ? buildItemList()
                        : buildItemList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemList() {
    return Padding(
      padding: EdgeInsets.only(
        top: CommonStyle.setDynamicHeight(context: context, value: 0.0),
      ),
      child: ScrollConfiguration(
        behavior: RemoveGlowEffect(),
        child: ListView.separated(
          itemCount: controller.userList.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                CommonStyle.setDynamicWidth(context: context, value: 0.01),
                CommonStyle.setDynamicHeight(context: context, value: 0.00),
                CommonStyle.setDynamicWidth(context: context, value: 0.01),
                CommonStyle.setDynamicHeight(context: context, value: 0.00),
              ),
              child: buildListTile(i: index, deviceType: DeviceType.mobile),
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return const Divider();
        },
        ),
      ),
    );
  }

  Widget buildItemListWeb() {
    return Padding(
      padding: EdgeInsets.only(
        top: CommonStyle.setDynamicHeight(context: context, value: 0.0),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: controller.userList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              CommonStyle.setDynamicWidth(context: context, value: 0.00),
              CommonStyle.setDynamicHeight(context: context, value: 0.01),
              CommonStyle.setDynamicWidth(context: context, value: 0.00),
              CommonStyle.setDynamicHeight(context: context, value: 0.01),
            ),
            child: buildListTile(i: index, deviceType: DeviceType.desktop),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 7,
        ),
      ),
    );
  }

  Widget buildListTile({required int i, required DeviceType deviceType}) {
    return CustomListTile(
      onClick: (){
        controller.selectedIndex.value = i;
        createRoom(id: controller.userList[i].id);
      },
      isTime: false,
      firstName: controller.userList[i].firstName,
      lastName: controller.userList[i].lastName,
      subTitle: controller.userList[i].phoneNumber,
    );
  }

  void createRoom({required String id}) async {
    Map<String, dynamic> requestParams = {};
    var s = [].obs;
    s.add(id);
    requestParams['userId'] = userDataSingleton.id;
    requestParams['participants'] = s;
    requestParams['is_group'] = "2";

    Logger().d("create room : requestParams -> $requestParams");

    var createRoomResult = await controller.createRoomAPICall(
      requestParams: requestParams,
      onError: (msg) => SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: msg,
      ),
    );

    if (createRoomResult) {
      Get.offNamed(ScreenRoutesConstant.chatScreen,
          arguments: [controller.roomId, controller.userList[controller.selectedIndex.value].firstName, controller.userList[controller.selectedIndex.value].lastName]);
    }
  }
}
