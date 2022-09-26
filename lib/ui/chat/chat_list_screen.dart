import 'package:flutter_demo/controllers/chat/chat_list_controller.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/util/app_common_stuffs/screen_routes.dart';
import 'package:flutter_demo/util/date_util.dart';
import 'package:flutter_demo/util/import_export_util.dart';
import 'package:flutter_demo/util/remove_glow_effect.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  ChatListController controller = Get.find<ChatListController>();

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  getUserList({bool pullToRefresh = false}) async {
    await controller.getUserList(context: context, pullToRefresh: pullToRefresh);
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
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        backgroundColor: AppColors.blueColor,
        onPressed: () async {
          await Get.toNamed(ScreenRoutesConstant.userListScreen);
          getUserList();
        },
        // isExtended: true,
        child: const Icon(Icons.add),
      ),
    );
  }

  /// list view builder

  Widget buildBodySection(DeviceType type) {
    return RefreshIndicator(
      onRefresh: () => getUserList(pullToRefresh: true),
      child: Stack(
        children: [
          controller.chatList.isEmpty
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
        top: CommonStyle.setDynamicHeight(context: context, value: 0.0),
      ),
      child: ScrollConfiguration(
        behavior: RemoveGlowEffect(),
        child: ListView.builder(
          itemCount: controller.chatList.length,
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
        itemCount: controller.chatList.length,
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
      // child: Container(
      //   height: 100,
      //   width: 100,
      //   color: Colors.red,
      // ),
      child: InkWell(
        onTap: () async{
          await Get.toNamed(ScreenRoutesConstant.chatScreen,
              arguments: [controller.chatList[i].participants[0].roomId, controller.chatList[i].participants[0].firstName, controller.chatList[i].participants[0].lastName]);
          getUserList();
        },
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
              Expanded(
                child: Text(
                  ("${getUserName(i)}\n\n${getLastMessage(i)}\n") ?? "",
                  style: deviceType == DeviceType.mobile ? black80Medium20TextStyle(context) : black80Medium10TextStyle(context),
                  // maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                child: Text(
                  getTime(i),
                  style: deviceType == DeviceType.mobile ? black80Medium20TextStyle(context) : black80Medium10TextStyle(context),
                  // maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getLastMessage(int i) {
    return controller.chatList[i].history.length == 0 ? "no message" : controller.chatList[i].history[0].content;
  }

  String getTime(int i) {
    if (controller.chatList[i].history.length == 0) {
      return "";
    } else {
      var updatedAtDate = DateUtil.getFormattedDate(date: controller.chatList[i].history[0].updatedAt.toString(), flag: 5);
      var currentDate = DateUtil.getFormattedDate(date: DateTime.now().toString(), flag: 5);
      var date = updatedAtDate == currentDate
          ? DateUtil.getFormattedTime(date: controller.chatList[i].history[0].updatedAt.toString())
          : DateUtil.getFormattedDate(date: controller.chatList[i].history[0].updatedAt.toString(), flag: 4);

      return (date) ?? "";
    }
  }

  String getUserName(int i) {
    if (controller.chatList[i].participants[0].userId == userDataSingleton.id) {
      return "${controller.chatList[i].participants[1].firstName} ${controller.chatList[i].participants[1].lastName}";
    } else {
      return "${controller.chatList[i].participants[0].firstName} ${controller.chatList[i].participants[0].lastName}";
    }
  }
}
