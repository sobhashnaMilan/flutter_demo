import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter_demo/controllers/chat/chat_list_controller.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/ui/common_widgets/custom_list_tile.dart';
import 'package:flutter_demo/util/app_common_stuffs/screen_routes.dart';
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


    debounceText.values.listen((search) {
      controller.userTyping(context: context, typeId: "0");
    });
  }

  getUserList({bool pullToRefresh = false}) async {
    await controller.getUserListEvent(context: context, pullToRefresh: pullToRefresh);
    await controller.chatListEvent(context: context, pullToRefresh: pullToRefresh);
  }

  final debounceText = Debouncer<String>(const Duration(milliseconds: 5000), initialValue: '');

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context) ? DeviceType.mobile : DeviceType.desktop;

    return Scaffold(
      body: Obx(
        () => deviceType == DeviceType.mobile ? buildBodySection(deviceType) : buildBodySectionForWeb(deviceType),
      ),
    );
  }

  Widget buildBodySectionForWeb(DeviceType type) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Obx(
                () => buildBodySection(type),
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

  ///  chat


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
                ),
              ],
            ),
          ),
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
                    : controller.isSelected.value
                        ? buildItemList()
                        : buildUserList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// chat list

  Widget buildItemList() {
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

  /// user list

  Widget buildUserList() {
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
              child: buildUserListTile(i: index, deviceType: DeviceType.mobile),
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
    Logger().d(getFirstName(i));
    Logger().d(getLastName(i));
    return CustomListTile(
      onClick: () async {
        await Get.toNamed(ScreenRoutesConstant.chatScreen, arguments: ["isMobile", controller.chatList[i].participants[0].roomId, getFirstName(i), getLastName(i), getLastMessageTime(i)]);
        getUserList();
      },
      isTime: true,
      firstName: getFirstName(i) ?? "Unknown",
      lastName: getLastName(i) ?? "Person",
      subTitle: getLastMessage(i),
      time: getTime(i),
    );
  }

  /// user list item

  Widget buildUserListTile({required int i, required DeviceType deviceType}) {
    return CustomListTile(
      onClick: () {
        controller.selectedIndex.value = i;
        createRoom(id: controller.userList[i].id);
      },
      isTime: false,
      firstName: controller.userList[i].firstName,
      lastName: controller.userList[i].lastName,
      subTitle: controller.userList[i].phoneNumber,
    );
  }

  /// sendMessageText

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

  ///
  /// last message , time , first name , last name
  /// etc.

  getLastMessage(int i) {
    return controller.chatList[i].history.length == 0 ? "no message" : controller.chatList[i].history[0].content;
  }

  getLastMessageTime(int i) {
    return controller.chatList[i].history.length == 0 ? "" : controller.chatList[i].history[0].createdAt;
  }

  String getTime(int i) {
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

  // api call
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
