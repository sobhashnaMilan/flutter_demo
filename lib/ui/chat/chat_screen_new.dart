import 'package:flutter_demo/controllers/chat/chat_list_controller.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/util/date_util.dart';
import 'package:flutter_demo/util/import_export_util.dart';
import 'package:flutter_demo/util/remove_glow_effect.dart';

class ChatScreen extends StatelessWidget {
  ChatListController controller;
  DeviceType type;

  ChatScreen(this.type, this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Obx(() => Container(height: Get.height, color: Colors.white30, child: buildBodySection(type,context))),
    );
  }

  Widget buildBodySection(DeviceType type, BuildContext context) {
    return Column(
      children: [
        /// custom app bar
        customAppBar(type,context),
        Container(
          width: Get.width,
          color: Colors.grey,
          height: 1,
        ),
        /// chat history list
        buildListViewLayout(type, context),
        Container(
          width: Get.width,
          color: Colors.grey,
          height: 1,
        ),
        /// send message text
        sendMessageLayout(type,context),
      ],
    );
  }

  Widget customAppBar(DeviceType type, BuildContext context){
    return Container(
      height: type == DeviceType.mobile ? CommonStyle.setDynamicHeight(context: context, value: 0.09) : CommonStyle.setDynamicHeight(context: context, value: 0.14),
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
              SizedBox(
                height: type == DeviceType.mobile ? CommonStyle.setLongestSide(context: context, value: 0.055) : CommonStyle.setShortestSide(context: context, value: 0.08),
                width: type == DeviceType.mobile ? CommonStyle.setLongestSide(context: context, value: 0.055) : CommonStyle.setShortestSide(context: context, value: 0.08),
                child: Image.network(
                  "https://raw.githubusercontent.com/sobhashnaMilan/image/main/user_icon.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: type == DeviceType.mobile ? CommonStyle.setDynamicWidth(context: context, value: 0.006) : CommonStyle.setDynamicWidth(context: context, value: 0.001),
                    left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                child: Text(
                  controller.userName.value,
                  style: type == DeviceType.mobile ? black80Medium18TextStyle(context) : black80Medium18TextStyle(context),
                  // maxLines: 5,
                ),
              ),
              controller.hasType.value == true
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
          )
        ],
      ),
    );
  }

  Widget buildListViewLayout(DeviceType type, BuildContext context){
    return Expanded(
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
            : buildListView(context,type));
  }

  Widget sendMessageLayout(DeviceType type, BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: CommonStyle.setDynamicWidth(context: context, value: 0.02)),
      child: Row(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFieldComponent(
                        context: context,
                        deviceType: type,
                        onChange: (v) {
                          controller.userTyping(typeId: "1");
                          controller.sendMessageController.addListener(() {
                            controller.debounceText.value = v;
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
                              bottom: type == DeviceType.mobile ? CommonStyle.setDynamicHeight(context: context, value: 0.012) : CommonStyle.setDynamicHeight(context: context, value: 0.02),
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

  Widget buildListView(BuildContext context, DeviceType type) {
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
              child: buildItemRow(i: index, deviceType: DeviceType.mobile, context: context),
            );
          },
        ),
      ),
    );
  }

  Widget buildItemRow({required int i, required DeviceType deviceType, required BuildContext context}) {
    return Column(
      crossAxisAlignment: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: deviceType == DeviceType.mobile ? const EdgeInsets.all(4) : const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? AppColors.primaryColor : AppColors.greyColor,
              borderRadius: BorderRadius.only(
                bottomLeft: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? const Radius.circular(18.0) : const Radius.circular(0.0),
                bottomRight: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? const Radius.circular(0.0) : const Radius.circular(18.0),
                topLeft: const Radius.circular(18.0),
                topRight: const Radius.circular(18.0),
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
                    (controller.chatHistoryList[i].content),
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

    return (date);
  }
}