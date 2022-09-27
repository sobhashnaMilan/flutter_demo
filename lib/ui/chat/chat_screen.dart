import 'dart:async';

import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter_demo/controllers/chat/chat_controller.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/ui/common_widgets/custom_list_tile.dart';
import 'package:flutter_demo/util/app_common_stuffs/screen_routes.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:flutter_demo/util/date_util.dart';
import 'package:flutter_demo/util/import_export_util.dart';
import 'package:flutter_demo/util/remove_glow_effect.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatScreenController controller = Get.find<ChatScreenController>();

  @override
  void initState() {
    super.initState();
    var arguments = Get.arguments;
    if (arguments[0] != "isWeb") {
      controller.roomId.value = arguments[1] ?? "";
      controller.userName.value = arguments[2] ?? "";
      controller.userName.value += " ${arguments[3] ?? ""}";
      controller.lastMessageTime.value += " ${arguments[4] ?? ""}";
      getChatHistory();
    }
    chatListEvent();

    debounceText.values.listen((search) {
      controller.userTyping(context: context, typeId: "0");
    });
  }

  chatListEvent({bool pullToRefresh = false}) async {
    await controller.chatListEvent(context: context, pullToRefresh: pullToRefresh);
  }

  final debounceText = Debouncer<String>(const Duration(milliseconds: 5000), initialValue: '');

  getChatHistory({bool pullToRefresh = false}) async {
    await controller.getChatHistory(pullToRefresh: pullToRefresh, context: context);
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context) ? DeviceType.mobile : DeviceType.desktop;

    return Scaffold(
      body: Container(height: Get.height, color: Colors.white30, child: deviceType == DeviceType.mobile ? buildBodySection(deviceType) : buildBodySectionForWeb(deviceType)),
    );
  }

  /// list view builder

  Widget buildBodySectionForWeb(DeviceType type) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Obx(
            () => buildChatList(type),
          ),
        ),
        Container(
          height: Get.height,
          width: 1,
          color: Colors.black,
        ),
        Flexible(flex: 7, child: Obx(() => buildChatSection(type))),
      ],
    );
  }

  Widget buildChatSection(DeviceType type) {
    return controller.isFirst.value
        ? Container(
            color: Colors.blueGrey,
            child: CommonStyle.loadNoDataView(context: context, deviceType: type),
          )
        : Column(
            children: [
              // custom app bar
              Container(
                height: type == DeviceType.mobile ? CommonStyle.setDynamicHeight(context: context, value: 0.09) : CommonStyle.setDynamicHeight(context: context, value: 0.14),
                // color: Colors.white30,
                padding: EdgeInsets.fromLTRB(
                  CommonStyle.setDynamicWidth(context: context, value: 0.02),
                  type == DeviceType.mobile ? CommonStyle.setDynamicHeight(context: context, value: 0.03) : CommonStyle.setDynamicHeight(context: context, value: 0.04),
                  CommonStyle.setDynamicWidth(context: context, value: 0.02),
                  CommonStyle.setDynamicHeight(context: context, value: 0.00),
                ),
                color: Colors.white30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: type == DeviceType.mobile ? CommonStyle.setLongestSide(context: context, value: 0.055) : CommonStyle.setShortestSide(context: context, value: 0.08),
                          width: type == DeviceType.mobile ? CommonStyle.setLongestSide(context: context, value: 0.055) : CommonStyle.setShortestSide(context: context, value: 0.08),
                          child: Image.network(
                            "https://raw.githubusercontent.com/sobhashnaMilan/image/main/user_icon.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: type == DeviceType.mobile ? CommonStyle.setDynamicWidth(context: context, value: 0.006) : CommonStyle.setDynamicWidth(context: context, value: 0.001),
                                left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                            child: Text(
                              controller.userName.value ?? "",
                              style: type == DeviceType.mobile ? black80Medium18TextStyle(context) : black80Medium18TextStyle(context),
                              // maxLines: 5,
                            ),
                          ),
                          controller.isType.value == true
                              ? Container(
                                  padding: EdgeInsets.only(left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                                  child: Text(
                                    "typing.......",
                                    style: type == DeviceType.mobile ? black80Medium14TextStyle(context) : black80Medium12TextStyle(context),
                                  ))
                              : Container(
                                  padding: EdgeInsets.only(left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                                  child: Text(
                                    "online",
                                    style: type == DeviceType.mobile ? black80Medium14TextStyle(context) : black80Medium12TextStyle(context),
                                  ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: Get.width,
                color: Colors.grey,
                height: 1,
              ),
              // list
              Expanded(
                  child: controller.chatHistoryList.isEmpty
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
                      : buildItemList()),
              Container(
                width: Get.width,
                color: Colors.grey,
                height: 1,
              ),
              // send message text
              sendMessageText(type),
            ],
          );
  }

  Widget buildBodySection(DeviceType type) {
    return Column(
      children: [
        // custom app bar
        Container(
          height: type == DeviceType.mobile ? CommonStyle.setDynamicHeight(context: context, value: 0.09) : CommonStyle.setDynamicHeight(context: context, value: 0.14),
          // color: Colors.white30,
          padding: EdgeInsets.fromLTRB(
            CommonStyle.setDynamicWidth(context: context, value: 0.02),
            type == DeviceType.mobile ? CommonStyle.setDynamicHeight(context: context, value: 0.03) : CommonStyle.setDynamicHeight(context: context, value: 0.04),
            CommonStyle.setDynamicWidth(context: context, value: 0.02),
            CommonStyle.setDynamicHeight(context: context, value: 0.00),
          ),
          color: Colors.white30,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Container(
                    height: type == DeviceType.mobile ? CommonStyle.setLongestSide(context: context, value: 0.055) : CommonStyle.setShortestSide(context: context, value: 0.08),
                    width: type == DeviceType.mobile ? CommonStyle.setLongestSide(context: context, value: 0.055) : CommonStyle.setShortestSide(context: context, value: 0.08),
                    child: Image.network(
                      "https://raw.githubusercontent.com/sobhashnaMilan/image/main/user_icon.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: type == DeviceType.mobile ? CommonStyle.setDynamicWidth(context: context, value: 0.006) : CommonStyle.setDynamicWidth(context: context, value: 0.001),
                          left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                      child: Text(
                        controller.userName.value ?? "",
                        style: type == DeviceType.mobile ? black80Medium18TextStyle(context) : black80Medium18TextStyle(context),
                        // maxLines: 5,
                      ),
                    ),
                    controller.isType.value == true
                        ? Container(
                            padding: EdgeInsets.only(left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                            child: Text(
                              "typing.......",
                              style: type == DeviceType.mobile ? black80Medium14TextStyle(context) : black80Medium12TextStyle(context),
                            ))
                        : Container(
                            padding: EdgeInsets.only(left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                            child: Text(
                              "online",
                              style: type == DeviceType.mobile ? black80Medium14TextStyle(context) : black80Medium12TextStyle(context),
                            ))
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          width: Get.width,
          color: Colors.grey,
          height: 1,
        ),
        // list
        Expanded(
            child: controller.chatHistoryList.isEmpty
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
                : buildItemList()),
        Container(
          width: Get.width,
          color: Colors.grey,
          height: 1,
        ),
        // send message text
        sendMessageText(type),
      ],
    );
  }

  Widget buildItemList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: CommonStyle.setDynamicHeight(context: context, value: 0.01),
      ),
      child: ScrollConfiguration(
        behavior: RemoveGlowEffect(),
        child: ListView.builder(
          itemCount: controller.chatHistoryList.length,
          physics: const ClampingScrollPhysics(),
          reverse: true,
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

  Widget sendMessageText(DeviceType type) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: CommonStyle.setDynamicWidth(context: context, value: 0.02)),
      // height: CommonStyle.setDynamicHeight(context: context, value: type == DeviceType.mobile ? 0.5 : 0.09),
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFieldComponent(
                    context: context,
                    deviceType: type,
                    onChange: (v) {
                      Logger().d(DateTime.now());
                      controller.userTyping(context: context, typeId: "1");
                      controller.sendMessageController.addListener(() {
                        debounceText.value = v;
                      });
                    },
                    textInputType: TextInputType.emailAddress,
                    hint: "write a message..",
                    isDecoration: true,
                    textEditingController: controller.sendMessageController,
                    isStyle: true,
                    style: type == DeviceType.mobile ? black80Medium18TextStyle(context) : black60Medium12TextStyle(context),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                          bottom: type == DeviceType.mobile ? CommonStyle.setDynamicHeight(context: context, value: 0.02) : CommonStyle.setDynamicHeight(context: context, value: 0.02),
                        ),
                        hintStyle: type == DeviceType.mobile ? black80Medium18TextStyle(context) : black60Medium16TextStyle(context),
                        hintText: "write a message..."),
                  ),
                ),
              ),
            ],
          )),
          InkWell(
            onTap: () {
              controller.sendMessage(context: context, message: controller.sendMessageController.text);
              controller.sendMessageController.text = "";
            },
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.longestSide * 0.011),
              child: Icon(
                size: type == DeviceType.mobile ? MediaQuery.of(context).size.shortestSide * 0.04 : MediaQuery.of(context).size.shortestSide * 0.04,
                Icons.attach_file,
                color: AppColors.secondaryBorderColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.sendMessage(context: context, message: controller.sendMessageController.text);
              controller.sendMessageController.text = "";
            },
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.longestSide * 0.011),
              child: Icon(
                size: type == DeviceType.mobile ? MediaQuery.of(context).size.shortestSide * 0.04 : MediaQuery.of(context).size.shortestSide * 0.04,
                Icons.send,
                color: AppColors.secondaryBorderColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemRow({required int i, required DeviceType deviceType}) {
    return Column(
      crossAxisAlignment: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: deviceType == DeviceType.mobile ? EdgeInsets.all(4) : EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? AppColors.primaryColor : AppColors.greyColor,
              borderRadius: BorderRadius.only(
                bottomLeft: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? Radius.circular(18.0) : Radius.circular(0.0),
                bottomRight: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? Radius.circular(0.0) : Radius.circular(18.0),
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0),
              )),
          constraints: BoxConstraints(maxWidth: CommonStyle.setLongestSide(context: context, value: 0.6)),
          child: Container(
            padding: EdgeInsets.fromLTRB(
              CommonStyle.setDynamicWidth(context: context, value: 0.01),
              CommonStyle.setDynamicHeight(context: context, value: 0.01),
              CommonStyle.setDynamicWidth(context: context, value: 0.02),
              CommonStyle.setDynamicHeight(context: context, value: 0.01),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonStyle.horizontalSpace(context, 0.01),
                Flexible(
                  child: Text(
                    ("${controller.chatHistoryList[i].content}") ?? "",
                    style: controller.chatHistoryList[i].senderId.id == userDataSingleton.id
                        ? deviceType == DeviceType.mobile
                            ? white80Medium16TextStyle(context)
                            : white80Medium10TextStyle(context)
                        : deviceType == DeviceType.mobile
                            ? black80Medium16TextStyle(context)
                            : black80Medium10TextStyle(context),
                    // maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          getTime(i),
          style: black80Medium10TextStyle(context),
        ),
        SizedBox(height: CommonStyle.setDynamicHeight(context: context, value: 0.02)),
      ],
    );
  }

  String getTime(int i) {
    var updatedAtDate = DateUtil.getFormattedDate(date: DateUtil.dateTimeUtcToLocal(date: controller.chatHistoryList[i].createdAt.toString()), flag: 5);
    var currentDate = DateUtil.getFormattedDate(date: DateTime.now().toString(), flag: 5);
    var date = updatedAtDate == currentDate
        ? DateUtil.getFormattedTime(date: DateUtil.dateTimeUtcToLocal(date: controller.chatHistoryList[i].createdAt.toString()))
        : DateUtil.getFormattedDate(date: DateUtil.dateTimeUtcToLocal(date: controller.chatHistoryList[i].createdAt.toString()), flag: 4);

    return (date) ?? "";
  }

  /// chat list view builder for web

  Widget buildChatList(DeviceType type) {
    return RefreshIndicator(
      onRefresh: () => chatListEvent(pullToRefresh: true),
      child: Column(
        children: [
          Container(
            height: CommonStyle.setDynamicHeight(context: context, value: 0.10),
            // color: Colors.white30,
            margin: EdgeInsets.fromLTRB(
              CommonStyle.setDynamicWidth(context: context, value: 0.02),
              CommonStyle.setDynamicHeight(context: context, value: 0.02),
              CommonStyle.setDynamicWidth(context: context, value: 0.02),
              CommonStyle.setDynamicHeight(context: context, value: 0.00),
            ),
            color: Colors.white30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Get.toNamed(ScreenRoutesConstant.userListScreen);
                        chatListEvent();
                      },
                      child: Container(
                        child: Icon(
                          size: MediaQuery.of(context).size.shortestSide * 0.04,
                          Icons.group_add_outlined,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CommonStyle.verticalSpace(context, 0.009),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      controller.isSelected.value = !controller.isSelected.value;
                    },
                    child: Container(
                      decoration: BoxDecoration(color: controller.isSelected.value == true ? AppColors.primaryColor : Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      alignment: Alignment.center,
                      child: Text(
                        "Chat",
                        style: controller.isSelected.value == true ? white80Medium18TextStyle(context) : black80Medium18TextStyle(context),
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      controller.isSelected.value = !controller.isSelected.value;
                    },
                    child: Container(
                      decoration: BoxDecoration(color: controller.isSelected.value == false ? AppColors.primaryColor : Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      alignment: Alignment.center,
                      child: Text(
                        "Contact",
                        style: controller.isSelected.value == false ? white80Medium18TextStyle(context) : black80Medium18TextStyle(context),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
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
                    : controller.isSelected.value == true
                        ? buildChatListForWeb()
                        : buildChatListForWeb(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChatListForWeb() {
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
                child: buildListTile(i: index, deviceType: DeviceType.mobile),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }

  Widget buildListTile({required int i, required DeviceType deviceType}) {
    Logger().d(getFirstName(i));
    Logger().d(getLastName(i));
    return CustomListTile(
      onClick: () async {
        controller.isFirst.value = false;
        controller.roomId.value = controller.chatList[i].participants[0].roomId;
        controller.userName.value = getFirstName(i);
        controller.userName.value += " ${getLastName(i)}";
        controller.lastMessageTime.value += " ${getLastMessageTime(i)}";
        getChatHistory();
      },
      isTime: true,
      firstName: getFirstName(i) ?? "Unknown",
      lastName: getLastName(i) ?? "Person",
      subTitle: getLastMessage(i),
      time: getChatListTime(i),
    );
  }

  getLastMessage(int i) {
    return controller.chatList[i].history.length == 0 ? "no message" : controller.chatList[i].history[0].content;
  }

  getLastMessageTime(int i) {
    return controller.chatList[i].history.length == 0 ? "" : controller.chatList[i].history[0].createdAt;
  }

  String getChatListTime(int i) {
    if (controller.chatList[i].history.length == 0) {
      return "";
    } else {
      var updatedAtDate = DateUtil.getFormattedDate(date: DateUtil.dateTimeUtcToLocal(date: controller.chatList[i].history[0].updatedAt.toString()), flag: 5);
      var currentDate = DateUtil.getFormattedDate(date: DateTime.now().toString(), flag: 5);
      var date = updatedAtDate == currentDate
          ? DateUtil.getFormattedTime(date: DateUtil.dateTimeUtcToLocal(date: controller.chatList[i].history[0].updatedAt.toString()))
          : DateUtil.getFormattedDate(date: DateUtil.dateTimeUtcToLocal(date: controller.chatList[i].history[0].updatedAt.toString()), flag: 4);

      return (date) ?? "";
    }
  }

  String getFirstName(int i) {
    var firstName = "";
    if (controller.chatList[i].participants[0].userId == userDataSingleton.id) {
      firstName = controller.chatList[i].participants[1].firstName ?? "UnKnown";
    } else {
      firstName = controller.chatList[i].participants[0].firstName ?? "UnKnown";
    }
    if (firstName == "") {
      firstName = "Person";
    }
    Logger().d(firstName);
    return firstName;
  }

  String getLastName(int i) {
    var lastName = "";
    if (controller.chatList[i].participants[0].userId == userDataSingleton.id) {
      lastName = controller.chatList[i].participants[1].lastName ?? "Person";
    } else {
      lastName = controller.chatList[i].participants[0].lastName ?? "Person";
    }
    if (lastName == "") {
      lastName = "Person";
    }
    Logger().d(lastName);
    return lastName;
  }


  /// user list

  Widget buildUserListForWeb() {
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
                child: buildListTile(i: index, deviceType: DeviceType.mobile),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
