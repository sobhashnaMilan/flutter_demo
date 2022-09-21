import 'package:flutter_demo/controllers/chat/user_list_controller.dart';
import 'package:flutter_demo/util/import_export_util.dart';
import 'package:flutter_demo/util/remove_glow_effect.dart';

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
      appBar: AppBarComponent.buildAppbarForHome(
        titleWidget: Text(
          StringConstant.titleChatList.tr,
          textDirection: TextDirection.ltr,
          style: deviceType == DeviceType.mobile ? white100Medium22TextStyle(context) : white100Medium10TextStyle(context),
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
            () => controller.isDataLoading.value ? CommonStyle.displayLoadingIndicator(deviceType) : buildBodySection(deviceType),
          )),
    );
  }

  /// list view builder

  Widget buildBodySection(DeviceType type) {
    return RefreshIndicator(
      onRefresh: () => getUserList(pullToRefresh: true),
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
          itemCount: controller.userList.length,
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
            child: buildItemRow(i: index, deviceType: DeviceType.desktop),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 7,
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
        child: Row(
          children: [
            SizedBox(
              height: deviceType == DeviceType.mobile ? CommonStyle.setLongestSide(context: context, value: 0.06) : CommonStyle.setShortestSide(context: context, value: 0.06),
              width: deviceType == DeviceType.mobile ? CommonStyle.setLongestSide(context: context, value: 0.06) : CommonStyle.setShortestSide(context: context, value: 0.06),
              child: Image.network(
                "https://raw.githubusercontent.com/sobhashnaMilan/image/main/user_icon.png",
                fit: BoxFit.fill,
              ),
            ),
            CommonStyle.horizontalSpace(context, 0.01),
            Text(
              ("${controller.userList[i].firstName}\n\n${controller.userList[i].email}\n") ?? "",
              style: deviceType == DeviceType.mobile ? black80Medium20TextStyle(context) : black80Medium10TextStyle(context),
              // maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
