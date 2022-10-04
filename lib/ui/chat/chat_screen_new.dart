import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_demo/controllers/chat/chat_list_controller.dart';
import 'package:flutter_demo/helper_manager/network_manager/api_constant.dart';
import 'package:flutter_demo/helper_manager/permission_manager/permission_manager.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_constant.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:flutter_demo/util/date_util.dart';
import 'package:flutter_demo/util/import_export_util.dart';
import 'package:flutter_demo/util/remove_glow_effect.dart';
import 'package:flutter_demo/util/ui_helper.dart';
import 'package:flutter_demo/util/web_ui_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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
        uiSettings: defaultTargetPlatform == TargetPlatform.android
            ? buildUiSettings(context)
            : defaultTargetPlatform == TargetPlatform.iOS
                ? buildUiSettings(context)
                : buildWebUiSettings(context),
      );
      if (croppedImage != null) {
        Logger().d(croppedImage!.path);
        Logger().d("croppedImage $croppedImage");
        var file = AppMultiPartFile(localFiles: [File(croppedImage!.path)], key: "image");
        arrFile.add(file);
        Logger().d("croppedImage ${arrFile[0].localFiles![0].path}");
        fileApiCall(arrFile, context);
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
      height: 100,
      padding: EdgeInsets.fromLTRB(
        CommonStyle.setDynamicWidth(context: context, value: 0.02),
        CommonStyle.setDynamicHeight(context: context, value: 0.02),
        CommonStyle.setDynamicWidth(context: context, value: 0.02),
        CommonStyle.setDynamicHeight(context: context, value: 0.02),
      ),
      color: Colors.white30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              SizedBox(
                height: 60.h,
                width: 60.h,
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
                      style: black80Medium18TextStyleChatUser(context),
                      // maxLines: 5,
                    ),
                  ),
                  controller.hasType.value == true
                      ? Container(
                          padding: EdgeInsets.only(left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                          child: Text(
                            "typing.......",
                            style: black80Medium14TextStyleChat(context),
                          ))
                      : Container(
                          padding: EdgeInsets.only(left: CommonStyle.setDynamicWidth(context: context, value: 0.006)),
                          child: Text(
                            "online",
                            style: black80Medium14TextStyleChat(context),
                          ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  TextStyle setFontSize(BuildContext context) {
    if (ResponsiveUtil.isMobile(context)) {
      return black80Medium14TextStyle(context);
    } else if (ResponsiveUtil.isTablet(context)) {
      return black80Medium20TextStyle(context);
    } else {
      return black80Medium14TextStyle(context);
    }
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
      padding: const EdgeInsets.symmetric(horizontal: 14),
      width: Get.width,
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
                style: black80Medium18TextStyleChatUser(context),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: black80Medium18TextStyleChatUser(context),
                    hintText: "write a message..."),
              ),
            ),
          ),
          Container(
            // padding: EdgeInsets.all(MediaQuery.of(context).size.longestSide * 0.011),
            child: PopupMenuButton<Menu>(
                icon: const Icon(Icons.attach_file),
                onSelected: (Menu item) async {
                  if (item.name == "itemOne") {
                    // camera
                    Logger().d("camera");
                    selectOrCaptureImage(ImageSource.camera, context, type);
                  } else if (item.name == "itemTwo") {
                    // Gallery
                    Logger().d("Gallery");
                    selectOrCaptureImage(ImageSource.gallery, context, type);
                  } else if (item.name == "itemThree") {
                    // Document
                    Logger().d("Document");
                    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
                    if (result != null) {
                      var file = AppMultiPartFile(localFiles: [File(result.files.single.path!)], key: "image");
                      arrFile.add(file);
                      Logger().d("croppedImage ${arrFile[0].localFiles![0].path}");
                      fileApiCall(arrFile, context);
                    }
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                      const PopupMenuItem<Menu>(
                        value: Menu.itemOne,
                        child: ListTile(
                          leading: Icon(Icons.camera_alt_outlined),
                          title: Text('Camera'),
                        ),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemTwo,
                        child: ListTile(
                          leading: Icon(Icons.image_outlined),
                          title: Text('Gallery'),
                        ),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemThree,
                        child: ListTile(
                          leading: Icon(Icons.file_copy_outlined),
                          title: Text('Document'),
                        ),
                      ),
                    ]),
          ),
          InkWell(
            onTap: () {
              controller.sendMessage(context: context, message: controller.sendMessageController.text, imageId: "");
              controller.sendMessageController.text = "";
            },
            child: Container(
              // padding: EdgeInsets.all(MediaQuery.of(context).size.longestSide * 0.011),
              child: Icon(
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
                                : CommonStyle.setShortestSide(context: context, value: 0.5),
                        maxWidth: type == DeviceType.mobile
                            ? CommonStyle.setLongestSide(context: context, value: 0.055)
                            : ResponsiveUtil.isTablet(context)
                                ? CommonStyle.setShortestSide(context: context, value: 0.4)
                                : CommonStyle.setShortestSide(context: context, value: 0.5),
                      ),
                      child: Image.network(
                        SocketConstant.baseDomainSocket + controller.chatHistoryList[i].mediaId!.media,
                      ),
                    )
                  : controller.chatHistoryList[i].type == "text"
                      ? Text((controller.chatHistoryList[i].content),
                          style: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? white80Medium14TextStyleChat(context) : black80Medium14TextStyleChat(context))
                      : Text((controller.chatHistoryList[i].type),
                          style: controller.chatHistoryList[i].senderId.id == userDataSingleton.id ? white80Medium14TextStyleChat(context) : black80Medium14TextStyleChat(context))),
        ),
        Text(
          getTime(i),
          style: black80Medium14TextStyleChat(context),
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

  fileApiCall(List<AppMultiPartFile> arrayFile, BuildContext context) {
    controller.uploadFileAPICall(
        context: context,
        file: arrayFile,
        onError: (data) {
          Logger().d(data);
        },
        requestParams: null);
  }
}

enum Menu { itemOne, itemTwo, itemThree }
