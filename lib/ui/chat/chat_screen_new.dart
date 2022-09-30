import 'dart:io';

import 'package:flutter_demo/controllers/chat/chat_list_controller.dart';
import 'package:flutter_demo/helper_manager/network_manager/api_constant.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_constant.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:flutter_demo/util/date_util.dart';
import 'package:flutter_demo/util/import_export_util.dart';
import 'package:flutter_demo/util/remove_glow_effect.dart';
import 'package:flutter_demo/util/ui_helper.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatelessWidget {
  ChatListController controller;
  DeviceType type;
  final ImagePicker picker = ImagePicker();

  ChatScreen(this.type, this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.mediaQuery.size.width,
      child: Obx(() => Container(height: Get.height, color: Colors.white30, child: buildBodySection(type, context))),
    );
  }

  XFile? selectedImage;
  CroppedFile? croppedImage;
  List<AppMultiPartFile> arrFile = [];

  void selectOrCaptureImage(ImageSource source, BuildContext context, DeviceType type) async {
    try {
      selectedImage = await picker.pickImage(
        source: source,
        maxHeight: 1000,
        maxWidth: 1000,
      );
      if (selectedImage != null) {
        selectedImage = selectedImage;
        Logger().d(selectedImage!.path);
        cropImage(selectedImage!.path, context, type);
      } else {
        SnackbarUtil.showSnackbar(
          context: context,
          type: SnackType.error,
          message: StringConstant.userCancelledImageSelectionMsg,
        );
      }
    } catch (e) {
      SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: "$e",
      );
    }
  }

  void cropImage(String path, BuildContext context, DeviceType type) async {
    try {
      croppedImage = await ImageCropper().cropImage(
        sourcePath: path,
        aspectRatioPresets: setAspectRatios(),
        uiSettings: buildUiSettings(context),
      );
      if (croppedImage != null) {
        Logger().d(croppedImage!.path);
        Logger().d("croppedImage $croppedImage");
        var file = AppMultiPartFile(localFiles: [File(croppedImage!.path)], key: "image");
        arrFile.add(file);
        Logger().d("croppedImage ${arrFile[0].localFiles![0].path}");
        controller.uploadFileAPICall(
            file: arrFile,
            onError: (data) {
              Logger().d(data);
            },
            requestParams: null);
      } else {
        // ignore: use_build_context_synchronously
        SnackbarUtil.showSnackbar(
          context: context,
          type: SnackType.error,
          message: StringConstant.userCancelledImageSelectionMsg,
        );
      }
    } catch (e) {
      SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: "$e",
      );
    }
  }

  Widget buildBodySection(DeviceType type, BuildContext context) {
    return Column(
      children: [
        /// custom app bar
        customAppBar(type, context),
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
        sendMessageLayout(type, context),
      ],
    );
  }

  Widget customAppBar(DeviceType type, BuildContext context) {
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
          Row(
            children: [
              SizedBox(
                height: type == DeviceType.mobile
                    ? CommonStyle.setLongestSide(context: context, value: 0.055)
                    : ResponsiveUtil.isTablet(context)
                        ? CommonStyle.setShortestSide(context: context, value: 0.06)
                        : CommonStyle.setShortestSide(context: context, value: 0.07),
                width: type == DeviceType.mobile
                    ? CommonStyle.setLongestSide(context: context, value: 0.055)
                    : ResponsiveUtil.isTablet(context)
                        ? CommonStyle.setShortestSide(context: context, value: 0.06)
                        : CommonStyle.setShortestSide(context: context, value: 0.07),
                child: Image.network(
                  "https://raw.githubusercontent.com/sobhashnaMilan/image/main/user_icon.png",
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                    child: Text(
                      controller.userName.value,
                      style: setFontSize(context),
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
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildListViewLayout(DeviceType type, BuildContext context) {
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
            : buildListView(context, type));
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
              selectOrCaptureImage(ImageSource.gallery, context, type);
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
                bottomLeft: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? const Radius.circular(15.0) : const Radius.circular(15.0),
                bottomRight: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? const Radius.circular(15.0) : const Radius.circular(15.0),
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0),
              )),
          constraints: BoxConstraints(maxWidth: CommonStyle.setLongestSide(context: context, value: 0.6)),
          child: Container(
            padding: EdgeInsets.fromLTRB(
              CommonStyle.setDynamicWidth(context: context, value: 0.009),
              CommonStyle.setDynamicHeight(context: context, value: 0.009),
              CommonStyle.setDynamicWidth(context: context, value: 0.009),
              CommonStyle.setDynamicHeight(context: context, value: 0.009),
            ),
            child: controller.chatHistoryList[i].type == "image"
                ? Container(
                    constraints: BoxConstraints(
                      maxHeight: type == DeviceType.mobile
                          ? CommonStyle.setLongestSide(context: context, value: 0.055)
                          : ResponsiveUtil.isTablet(context)
                              ? CommonStyle.setShortestSide(context: context, value: 0.4)
                              : CommonStyle.setShortestSide(context: context, value: 0.07),
                      maxWidth: type == DeviceType.mobile
                          ? CommonStyle.setLongestSide(context: context, value: 0.055)
                          : ResponsiveUtil.isTablet(context)
                          ? CommonStyle.setShortestSide(context: context, value: 0.4)
                          : CommonStyle.setShortestSide(context: context, value: 0.07),
                    ),
                    child: Image.network(
                      SocketConstant.baseDomainSocket + controller.chatHistoryList[i].mediaId!.media,
                    ),
                  )
                : Text(
                  (controller.chatHistoryList[i].content),
                  style:
                      controller.chatHistoryList[i].senderId.id == userDataSingleton.id && deviceType == DeviceType.mobile ? white80Medium12TextStyle(context) : black80Medium10TextStyle(context),
                  // maxLines: 5,
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

  TextStyle setFontSize(BuildContext context) {
    if (ResponsiveUtil.isMobile(context)) {
      return black80Medium14TextStyle(context);
    } else if (ResponsiveUtil.isTablet(context)) {
      return black80Medium20TextStyle(context);
    } else {
      return black80Medium10TextStyle(context);
    }
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
