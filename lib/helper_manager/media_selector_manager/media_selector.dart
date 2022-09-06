import 'dart:io' show Directory, File, Platform;

import '../../helper_manager/platform_channel/platform_channel.dart';
import '../../util/app_logger.dart';
import '../../util/mobile_ui_helper.dart';
import '../../util/snackbar_util.dart';
import '../../util/util.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../ui/style/components/dialog_component.dart';

//Type:0 Image 1 Video
typedef ImageSelectionCallBack = void Function(List<File>? file, int type);

enum MediaFor { profile, restImage, chatMedia, introVideo, pdf }

class MediaSelector {
  factory MediaSelector() {
    return _singleton;
  }

  static final MediaSelector _singleton = MediaSelector._internal();

  MediaSelector._internal() {
    Logger().v("Instance created MediaSelector");
  }

  String _getMessageForTitle(MediaFor purpose, BuildContext context) {
    if (purpose == MediaFor.profile) {
      return "App needs photo permission to take photo from your library, go to settings and allow access";
    } else if (purpose == MediaFor.pdf) {
      return "Bite Ninja needs to access your storage to pick PDF.";
    } else if (purpose == MediaFor.introVideo) {
      return "Bite Ninja needs to access your storage to pick introduction video.";
    } else if (purpose == MediaFor.chatMedia) {
      return "Bite Ninja needs to access your camera or gallery for chat media.";
    }
    return "";
  }

  String _getMessageForPermission(
      BuildContext context, MediaFor purpose, ImageSource source) {
    if (source == ImageSource.camera) {
      if (purpose == MediaFor.profile) {
        return "msgCameraPermissionProfile";
      } else if (purpose == MediaFor.restImage) {
        return "msgCameraPermissionRestImage";
      } else {
        return "msgCameraPermission";
      }
    } else {
      if (purpose == MediaFor.profile) {
        return "msgPhotoPermissionProfile";
      } else if (purpose == MediaFor.restImage) {
        return "msgPhotoPermissionRestImage";
      } else {
        return "msgPhotoPermission";
      }
    }
  }

  //endregion

  //region Open setting
  Future<void> _openSetting(BuildContext context,
      {required String message}) async {
    DialogComponent.showAlert(
      context,
      title: "",
      message: message,
      arrButton: ["Cancel", "Ok"],
      callback: (index) async {
        if (index == 1) {
          Future.delayed(
            const Duration(seconds: 1),
            () async {
              await PlatformChannel().openSettings();
            },
          );
        }
      },
    );
  }

  //endregion

  //region Ask user for option
  void chooseImageWithOption(BuildContext context,
      {required MediaFor purpose,
      required ImageSelectionCallBack callBack,
      bool isImageResize = true,
      bool isCropImage = false}) {
    var arrButton = ["Photo", "ChooseFromExisting"];

    if (Platform.isAndroid) {
      arrButton.insert(0, "Cancel");
    }

    final message = _getMessageForTitle(purpose, context);
    if (Platform.isAndroid) {
      DialogComponent.showAlert(context,
          message: message,
          barrierDismissible: true,
          arrButton: arrButton, callback: (int index) {
        if (index == 0) {
          return;
        }
        ImageSource sourceType =
            (index == 1) ? ImageSource.camera : ImageSource.gallery;
        onPickImageAction(context,
            isCropImage: isCropImage,
            purpose: purpose,
            source: sourceType,
            callBack: callBack,
            isImageResize: isImageResize);
      });
    } else if (Platform.isIOS) {
      DialogComponent.showAlert(context,
          message: message,
          barrierDismissible: true,
          arrButton: arrButton, callback: (int index) {
        if (index == 0) {
          return;
        }
        ImageSource sourceType =
            (index == 1) ? ImageSource.camera : ImageSource.gallery;
        onPickImageAction(context,
            isCropImage: isCropImage,
            purpose: purpose,
            source: sourceType,
            callBack: callBack,
            isImageResize: isImageResize);
      });
    }
  }

  //endregion

  void choosePdfWithOption(BuildContext context,
      {required MediaFor purpose,
      required ImageSelectionCallBack callBack,
      bool allowCompression = true,
      bool allowMultiple = false,
      String dialogTitle = "Bite Ninja",
      bool isCropImage = false}) {
    var arrButton = ["strChoosePdfFromExisting"];

    if (Platform.isAndroid) {
      arrButton.insert(0, "Cancel");
    }

    final message = _getMessageForTitle(purpose, context);
    if (Platform.isAndroid) {
      DialogComponent.showAlert(context,
          message: message,
          barrierDismissible: true,
          arrButton: arrButton, callback: (int index) {
        if (index == 0) {
          return;
        }
        onPickPdfFileAction(context,
            purpose: purpose,
            callBack: callBack,
            allowCompression: allowCompression,
            allowMultiple: allowMultiple,
            dialogTitle: dialogTitle);
      });
    } else if (Platform.isIOS) {
      DialogComponent.showAlert(context,
          message: message,
          barrierDismissible: true,
          arrButton: arrButton, callback: (int index) {
        if (index == 0) {
          return;
        }
        onPickPdfFileAction(context,
            purpose: purpose,
            callBack: callBack,
            allowCompression: allowCompression,
            allowMultiple: allowMultiple,
            dialogTitle: dialogTitle);
      });
    }
  }

  //region Ask user for option
  void chooseMediaWithOption(BuildContext context, ImageSource source,
      {required MediaFor purpose,
      required ImageSelectionCallBack callBack,
      int maxImages = 1,
      bool isImageResize = true,
      bool isCropImage = false}) {
    var arrButton = [
      // T.of(NavigationService().context).strImage,
      "strVideo"
    ];

    if (Platform.isAndroid) {
      arrButton.insert(0, "Cancel");
    }

    final message = _getMessageForTitle(purpose, context);
    if (Platform.isAndroid) {
      DialogComponent.showAlert(context,
          message: message,
          barrierDismissible: true,
          arrButton: arrButton, callback: (int index) {
        if (index == 0) {
          return;
        }
        ImageSource sourceType = source;
        if (index == 1) {
          onPickVideoAction(context,
              purpose: purpose,
              source: sourceType,
              callBack: callBack,
              isImageResize: isImageResize);
          // onPickImageAction(context,isCropImage: isCropImage, purpose: purpose, source: sourceType, maxImages: maxImages, callBack: callBack, isImageResize: isImageResize);
        } else {
          onPickVideoAction(context,
              purpose: purpose,
              source: sourceType,
              callBack: callBack,
              isImageResize: isImageResize);
        }
      });
    } else if (Platform.isIOS) {
      DialogComponent.showAlert(context,
          message: message,
          barrierDismissible: true,
          arrButton: arrButton, callback: (int index) {
        if (index == 0) {
          return;
        }
        ImageSource sourceType = source;
        if (index == 1) {
          onPickVideoAction(context,
              purpose: purpose,
              source: sourceType,
              callBack: callBack,
              isImageResize: isImageResize);
          // onPickImageAction(context,isCropImage: isCropImage, purpose: purpose, source: sourceType, maxImages: maxImages, callBack: callBack, isImageResize: isImageResize);
        } else {
          onPickVideoAction(context,
              purpose: purpose,
              source: sourceType,
              callBack: callBack,
              isImageResize: isImageResize);
        }
      });
    }
  }

  //endregion

  //region PickImage with option
  Future onPickImageAction(BuildContext context,
      {required MediaFor purpose,
      required ImageSource source,
      int maxImages = 1,
      required ImageSelectionCallBack callBack,
      bool isImageResize = true,
      bool isCropImage = false}) async {
    String messageDecline = _getMessageForPermission(context, purpose, source);

    if (source == ImageSource.camera) {
      bool permissionAllowed =
          await PlatformChannel().checkForPermission(Permission.camera);
      if (permissionAllowed && Platform.isAndroid) {
        permissionAllowed =
            await PlatformChannel().checkForPermission(Permission.storage);
      }
      if (!permissionAllowed) {
        Logger().w("Permission Declined for Camera");
        _openSetting(context, message: messageDecline);
        callBack(null, 0);
        return;
      }
    } else {
      Permission permission =
          Platform.isIOS ? Permission.photos : Permission.storage;
      bool permissionAllowed =
          await PlatformChannel().checkForPermission(permission);
      if (!permissionAllowed) {
        Logger().w("Permission Declined for Photo");
        _openSetting(context, message: messageDecline);
        callBack(null, 0);
        return;
      }
    }

    /*if ((source == ImageSource.gallery)) {
      List<Asset> resultList = [];

      try {
        resultList = await MultiImagePicker.pickImages(
          maxImages: maxImages,
          enableCamera: false,
          selectedAssets: [],
          cupertinoOptions: const CupertinoOptions(takePhotoIcon: "chat"),
          materialOptions: MaterialOptions(
            actionBarColor: "#199EFC",
            actionBarTitle: T.of(context).appName,
            allViewTitle: "All Photos",
            useDetailsView: false,
            selectCircleStrokeColor: "#000000",
          ),
        );

        List<File> arrFiles = [];
        for (var asset in resultList) {
          String filename = 'file_${DateTime.now().millisecondsSinceEpoch}_${resultList.indexOf(asset)}.jpg';
          File file = await writeAssetToFile(asset, filename);
          arrFiles.add(file);
        }

        callBack(arrFiles, 0 );
      } on Exception catch (e) {
        Logger().e("Error Multi image :: ${e.toString()}") ;
        callBack(null, 0);
      }

      return;
    }*/

    try {
      final ImagePicker _picker = ImagePicker();
      XFile? pickedFile;
      if (isImageResize) {
        pickedFile = await _picker.pickImage(
            source: source, maxHeight: 1080.0, maxWidth: 720.0);
      } else {
        pickedFile = await _picker.pickImage(
            source: source, maxHeight: 1080.0, maxWidth: 720.0);
        //pickedFile = await _picker.pickImage(source: source);
      }

      File? selectedFile = (pickedFile != null) ? File(pickedFile.path) : null;
      if ((pickedFile != null) && isCropImage) {
        /// Need To Crop Picker implement

        CroppedFile? croppedImage;
        try {
          croppedImage = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            aspectRatioPresets: setAspectRatios(),
            uiSettings: buildUiSettings(context),
          );
          selectedFile = File(croppedImage!.path);
        } catch (e) {
          // showErrorToast(context, "$e");
          SnackbarUtil.showSnackbar(
            context: context,
            type: SnackType.error,
            message: "$e",
          );
        }
      } else if (pickedFile != null) {
        selectedFile = File(pickedFile.path);
      } else {
        selectedFile = null;
      }
      Logger().v("Path Galley :: ${selectedFile?.path ?? ''}");
      if (selectedFile != null) {
        File fixedRotationFile = await FlutterExifRotation.rotateAndSaveImage(
            path: selectedFile.path);
        Logger().v("Path Fixed Rotation Galley :: ${fixedRotationFile.path}");
        selectedFile = fixedRotationFile;
      }
      callBack((selectedFile != null) ? [selectedFile] : null, 0);
    } catch (error) {
      Logger().v("Error :: ${error.toString()}");
    }
  }

  //endregion

  //region Pick ImageWith option
  Future onPickVideoAction(BuildContext context,
      {required MediaFor purpose,
      required ImageSource source,
      required ImageSelectionCallBack callBack,
      required bool isImageResize}) async {
    String messageDecline = _getMessageForPermission(context, purpose, source);

    if (source == ImageSource.camera) {
      bool permissionAllowed =
          await PlatformChannel().checkForPermission(Permission.camera);
      if (!permissionAllowed) {
        Logger().w("Permission Declined for Camera");
        _openSetting(context, message: messageDecline);
        callBack(null, 1);
        return;
      }
    } else {
      Permission permission =
          Platform.isIOS ? Permission.photos : Permission.storage;
      bool permissionAllowed =
          await PlatformChannel().checkForPermission(permission);
      if (!permissionAllowed) {
        Logger().w("Permission Declined for Photo");
        _openSetting(context, message: messageDecline);
        callBack(null, 1);
        return;
      }
    }

    try {
      final ImagePicker _picker = ImagePicker();
      XFile? pickedFile = await _picker.pickVideo(
        source: source,
        maxDuration: const Duration(seconds: 30),
      );

      File? selectedFile = (pickedFile != null) ? File(pickedFile.path) : null;
      Logger().v("Path Galley :: ${selectedFile?.path ?? ''}");

      if (selectedFile != null) {
        int fileSize = selectedFile.lengthSync();
        if (fileSize >= 30 * 1024 * 1024) {
          DialogComponent.showAlert(
            context,
            title: "appName",
            message: "Video size should be less than 30 MB",
            arrButton: ["Ok"],
            callback: (index) {
              return;
            },
          );
          // Utils.showProgressDialog(NavigationService().context);
          // MediaInfo? mediaInfo = await VideoCompress.compressVideo(selectedFile.path, quality: VideoQuality.MediumQuality, deleteOrigin: false,);
          // await Utils.dismissProgressDialog(NavigationService().context);
          // if (mediaInfo != null) {
          //   callBack((mediaInfo.file != null) ? [mediaInfo.file!] : null, 1);
          //   return;
          // }
        } else {
          return callBack([selectedFile], 1);
        }
      }
      callBack((selectedFile != null) ? [selectedFile] : null, 1);
    } catch (error) {
      Logger().v("Error :: ${error.toString()}");
    }
  }

  //endregion

  //region File option
  Future onPickPdfFileAction(BuildContext context,
      {required MediaFor purpose,
      required ImageSelectionCallBack callBack,
      String dialogTitle = "Bite Ninja",
      bool allowCompression = true,
      bool allowMultiple = false,
      bool isCropImage = false}) async {
    // String messageDecline = _getMessageForPermission(purpose, source);

    Permission permission =
        Platform.isIOS ? Permission.photos : Permission.storage;
    bool permissionAllowed =
        await PlatformChannel().checkForPermission(permission);
    if (!permissionAllowed) {
      Logger().w("Permission Declined for PDF");
      _openSetting(context, message: "messageDecline");
      callBack(null, 0);
      return;
    }

    try {
      FilePickerResult? pickedFile;
      pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowCompression: allowCompression,
        allowMultiple: allowMultiple,
        dialogTitle: dialogTitle,
        allowedExtensions: ['pdf', 'PDF'],
      );

      if (pickedFile != null) {
        if (allowMultiple) {
          List<File> arrFiles = [];
          for (var asset in pickedFile.files) {
            String filename =
                'file_${DateTime.now().millisecondsSinceEpoch}_${asset.name}.jpg';
            File file = await writeAssetToFile(
                Asset(asset.identifier, asset.name, asset.size, asset.size),
                filename);
            arrFiles.add(file);
          }
        } else {
          File? selectedFile = File(pickedFile.paths.first ?? "");
          Logger().v("Path Galley :: ${selectedFile.path}");
          callBack([selectedFile], 0);
        }
      }
    } catch (error) {
      Logger().v("Error :: ${error.toString()}");
    }
  }

  //endregion

  Future<File> writeAssetToFile(Asset asset, String filename) async {
    final data = await asset.getByteData(quality: 40);
    final buffer = data.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath + '/$filename';
    File saveFile = File(filePath);
    await saveFile.writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
    Logger().v('Save File :: ${saveFile.path}');
    // File fixedRotationFile = await FlutterExifRotation.rotateAndSaveImage(path: saveFile.path);
    // Logger().v('Path Fixed Rotation Galley :: ${fixedRotationFile?.path ?? ''}');
    return saveFile;
    // return fixedRotationFile;
  }
}
