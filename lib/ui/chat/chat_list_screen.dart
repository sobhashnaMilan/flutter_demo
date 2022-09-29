import 'dart:async';

import 'package:flutter_demo/controllers/chat/chat_list_controller.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/ui/chat/chat_screen_new.dart';
import 'package:flutter_demo/ui/common_widgets/custom_list_tile.dart';
import 'package:flutter_demo/util/app_logger.dart';
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
    getChatList();
  }

  getUserList({bool pullToRefresh = false}) async {
    await controller.getUserListEvent(context: context, pullToRefresh: pullToRefresh);
  }

  getChatList({bool pullToRefresh = false}) async {
    await controller.chatListEvent(context: context, pullToRefresh: pullToRefresh);
  }

  getChatHistory({bool pullToRefresh = false}) async {
    await controller.getChatHistory(pullToRefresh: pullToRefresh, context: context);
  }

  Future<bool> _onWillPop() async {
    DeviceType type = ResponsiveUtil.isMobile(context) ? DeviceType.mobile : DeviceType.desktop;
    if (controller.hasChatSelected.value && type == DeviceType.mobile) {
      controller.hasChatSelected.value = false;
      return false;
    } else if (controller.hasChatSelected.value && type != DeviceType.mobile) {
      controller.hasChatSelected.value = false;
      return true;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context) ? DeviceType.mobile : DeviceType.desktop;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Obx(
          () => deviceType == DeviceType.mobile ? buildBodySection(deviceType) : buildBodySectionForWeb(deviceType),
        ),
      ),
    );
  }

  Widget buildBodySectionForWeb(DeviceType type) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: buildBodySection(type),
        ),
        Container(
          height: Get.height,
          width: 1,
          color: Colors.black,
        ),
        Flexible(
            flex: 7,
            child: controller.hasFirst.value
                ? Container(
                    color: Colors.blueGrey,
                    child: CommonStyle.loadNoDataView(context: context, deviceType: type),
                  )
                : ChatScreen(type, controller)),
      ],
    );
  }

  /// list view builder

  Widget buildBodySection(DeviceType type) {
    return type == DeviceType.mobile && controller.hasChatSelected.value
        ? ChatScreen(type, controller)
        : RefreshIndicator(
            onRefresh: () async {
              await getUserList(pullToRefresh: true);
              await getChatList(pullToRefresh: true);
            },
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: CommonStyle.setDynamicWidth(context: context, value: 0.004), left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                              child: Text(
                                "Chats",
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
                    ],
                  ),
                ),
                Container(
                  height: type == DeviceType.mobile ? CommonStyle.setDynamicHeight(context: context, value: 0.06) : CommonStyle.setDynamicHeight(context: context, value: 0.08),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            controller.hasChatList.value = !controller.hasChatList.value;
                          },
                          child: Container(
                            decoration:
                                BoxDecoration(color: controller.hasChatList.value == true ? AppColors.primaryColor : Colors.transparent, borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                            alignment: Alignment.center,
                            child: Text(
                              "Chat",
                              style: controller.hasChatList.value == true ? white80Medium18TextStyle(context) : black80Medium18TextStyle(context),
                            ),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            controller.hasChatList.value = !controller.hasChatList.value;
                          },
                          child: Container(
                            decoration:
                                BoxDecoration(color: controller.hasChatList.value == false ? AppColors.primaryColor : Colors.transparent, borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                            alignment: Alignment.center,
                            child: Text(
                              "Contact",
                              style: controller.hasChatList.value == false ? white80Medium18TextStyle(context) : black80Medium18TextStyle(context),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                CommonStyle.verticalSpace(context, 0.01),
                Expanded(
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
                          : controller.hasChatList.value
                              ? buildItemList(type)
                              : buildUserList(type),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  /// chat list

  Widget buildItemList(DeviceType type) {
    return ScrollConfiguration(
      behavior: RemoveGlowEffect(),
      child: ListView.separated(
        itemCount: controller.chatList.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  CommonStyle.setDynamicWidth(context: context, value: 0.01),
                  CommonStyle.setDynamicHeight(context: context, value: 0.00),
                  CommonStyle.setDynamicWidth(context: context, value: 0.01),
                  CommonStyle.setDynamicHeight(context: context, value: 0.00),
                ),
                child: buildListTile(i: index, deviceType: type),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }

  /// user list

  Widget buildUserList(DeviceType type) {
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
              child: buildUserListTile(i: index, deviceType: type),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }

  /// chat list item

  Widget buildListTile({required int i, required DeviceType deviceType}) {
    return CustomListTile(
      onClick: () async {
        controller.hasChatSelected.value = true;
        controller.hasFirst.value = false;
        controller.roomId.value = controller.chatList[i].participants[0].roomId;
        controller.userName.value = getFirstName(i);
        controller.userName.value += " ${getLastName(i)}";
        getChatHistory();
      },
      isTime: true,
      firstName: getFirstName(i),
      lastName: getLastName(i),
      subTitle: getLastMessage(i),
      time: getTime(i),
    );
  }

  /// user list item

  Widget buildUserListTile({required int i, required DeviceType deviceType}) {
    return CustomListTile(
      onClick: () {
        controller.selectedUserIndex.value = i;
        createRoom(id: controller.userList[i].id);
      },
      isTime: false,
      firstName: getUserFirstName(i),
      lastName: getUserLastName(i),
      subTitle: controller.userList[i].phoneNumber,
    );
  }

  /// chat
  /// last message , time , first name , last name
  /// etc.

  String getUserFirstName(int i) {
    var firstName = controller.userList[i].firstName;
    if (firstName == "") {
      firstName = "UnKnown";
    }
    return firstName;
  }

  String getUserLastName(int i) {
    var lastName = controller.userList[i].lastName;
    if (lastName == "") {
      lastName = "Person";
    }
    return lastName;
  }

  /// chat
  /// last message , time , first name , last name
  /// etc.

  getLastMessage(int i) {
    return controller.chatList[i].history.isEmpty ? "no message" : controller.chatList[i].history[0].content;
  }

  getLastMessageTime(int i) {
    return controller.chatList[i].history.isEmpty ? "" : controller.chatList[i].history[0].createdAt;
  }

  String getTime(int i) {
    if (controller.chatList[i].history.isEmpty) {
      return "";
    } else {
      var updatedAtDate = DateUtil.getFormattedDate(date: DateUtil.dateTimeUtcToLocal(date: controller.chatList[i].history[0].updatedAt.toString()), flag: 5);
      var currentDate = DateUtil.getFormattedDate(date: DateTime.now().toString(), flag: 5);
      var date = updatedAtDate == currentDate
          ? DateUtil.getFormattedTime(date: DateUtil.dateTimeUtcToLocal(date: controller.chatList[i].history[0].updatedAt.toString()))
          : DateUtil.getFormattedDate(date: DateUtil.dateTimeUtcToLocal(date: controller.chatList[i].history[0].updatedAt.toString()), flag: 4);

      return (date);
    }
  }

  String getFirstName(int i) {
    var firstName = "";
    if (controller.chatList[i].participants[0].userId == userDataSingleton.id) {
      firstName = controller.chatList[i].participants[1].firstName;
    } else {
      firstName = controller.chatList[i].participants[0].firstName;
    }
    if (firstName == "") {
      firstName = "Person";
    }
    return firstName;
  }

  String getLastName(int i) {
    var lastName = "";
    if (controller.chatList[i].participants[0].userId == userDataSingleton.id) {
      lastName = controller.chatList[i].participants[1].lastName;
    } else {
      lastName = controller.chatList[i].participants[0].lastName;
    }
    if (lastName == "") {
      lastName = "Person";
    }
    return lastName;
  }

  // api call
  void createRoom({required String id}) async {
    Map<String, dynamic> requestParams = {};
    var participantIds = [].obs;
    participantIds.add(id);
    requestParams['userId'] = userDataSingleton.id;
    requestParams['participants'] = participantIds;
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
      controller.hasChatSelected.value = true;
      controller.hasFirst.value = false;
      controller.roomId.value = controller.roomId.value;
      controller.userName.value = controller.userList[controller.selectedUserIndex.value].firstName;
      controller.userName.value += controller.userList[controller.selectedUserIndex.value].lastName;
      getChatHistory();
    }
  }
}
