import 'dart:async';

import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter_demo/controllers/chat/chat_controller.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
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
    controller.roomId.value = arguments[0].toString();
    controller.userName.value = arguments[1].toString();
    controller.userName.value += " ${arguments[2].toString()}";
    Logger().d(controller.roomId.value);
    Logger().d(controller.userName.value);
    getUserList();

    debounceText.values.listen((search) {
      controller.userTyping(context: context, typeId: "0");
    });
  }

  final debounceText = Debouncer<String>(const Duration(milliseconds: 5000), initialValue: '');

  getUserList({bool pullToRefresh = false}) async {
    await controller.getChatHistory(pullToRefresh: pullToRefresh, context: context);
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context) ? DeviceType.mobile : DeviceType.desktop;

    return Scaffold(
      appBar: AppBarComponent.buildAppbarForHome(
        titleWidget: Text(
          controller.userName.value,
          textDirection: TextDirection.ltr,
          style: deviceType == DeviceType.mobile ? white100Medium22TextStyle(context) : white100Medium10TextStyle(context),
        ),
      ),
      body: Container(
          height: Get.height,
          color: Colors.black12,
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
          controller.isType.value == true
              ? Row(
                  children: const [
                    Text("typing......."),
                  ],
                )
              : Container(),
          SizedBox(
            width: Get.width,
            // height: CommonStyle.setDynamicHeight(context: context, value: type == DeviceType.mobile ? 0.5 : 0.09),
            child: Row(
              children: [
                Expanded(
                    child: Card(
                        elevation: 4,
                        color: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          children: [
                            Card(
                              elevation: 4,
                              color: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.longestSide * 0.007),
                                alignment: Alignment.center,
                                child: Icon(
                                  size: type == DeviceType.mobile ? MediaQuery.of(context).size.shortestSide * 0.04 : MediaQuery.of(context).size.shortestSide * 0.04,
                                  Icons.add,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                            Expanded(
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
                                hint: "Hint here",
                                isDecoration: true,
                                textEditingController: controller.sendMessageController,
                                isStyle: true,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 11, bottom: 14, top: 11, right: 11),
                                    hintText: "Hint here"),
                              ),
                              //   TextFormField(
                              //     cursorColor: Colors.black,
                              //     decoration: const InputDecoration(
                              //         border: InputBorder.none,
                              //         focusedBorder: InputBorder.none,
                              //         enabledBorder: InputBorder.none,
                              //         errorBorder: InputBorder.none,
                              //         disabledBorder: InputBorder.none,
                              //         contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              //         hintText: "Hint here"),
                              //   )
                            ),
                          ],
                        ))),
                InkWell(
                  onTap: () {
                    controller.sendMessage(context: context, message: controller.sendMessageController.text);
                    controller.sendMessageController.text = "";
                  },
                  child: Card(
                    elevation: 4,
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.longestSide * 0.011),
                      child: Icon(
                        size: type == DeviceType.mobile ? MediaQuery.of(context).size.shortestSide * 0.04 : MediaQuery.of(context).size.shortestSide * 0.04,
                        Icons.send,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
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

  Widget buildItemRow({required int i, required DeviceType deviceType}) {
    return Column(
      crossAxisAlignment: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: CommonStyle.setLongestSide(context: context, value: 0.6)),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(
                CommonStyle.setDynamicWidth(context: context, value: 0.01),
                CommonStyle.setDynamicHeight(context: context, value: 0.01),
                CommonStyle.setDynamicWidth(context: context, value: 0.01),
                CommonStyle.setDynamicHeight(context: context, value: 0.01),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Flexible(
                    child: Text(
                      ("${controller.chatHistoryList[i].content}\n\n ${getTime(i)}") ?? "",
                      style: deviceType == DeviceType.mobile ? black80Medium20TextStyle(context) : black80Medium10TextStyle(context),
                      // maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  String getTime(int i) {
    var updatedAtDate = DateUtil.getFormattedDate(date: controller.chatHistoryList[i].createdAt.toString(), flag: 5);
    var currentDate = DateUtil.getFormattedDate(date: DateTime.now().toString(), flag: 5);
    var date = updatedAtDate == currentDate
        ? DateUtil.getFormattedTime(date: controller.chatHistoryList[i].createdAt.toString())
        : DateUtil.getFormattedDate(date: controller.chatHistoryList[i].createdAt.toString(), flag: 4);

    return (date) ?? "";
  }
}
