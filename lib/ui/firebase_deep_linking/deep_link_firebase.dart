import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/util/app_common_stuffs/string_constants.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:flutter_demo/util/snackbar_util.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/deep_link_controller.dart';

class DeepLinkFirebase extends StatefulWidget {
  const DeepLinkFirebase({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DeepLinkFirebaseState();
}

/// WidgetsBindingObserver for resume , pause .....

class _DeepLinkFirebaseState extends State<DeepLinkFirebase>
    with WidgetsBindingObserver {
  final _deepLinkController = Get.put(DeepLinkController());

  Future<void> _createDynamicLink(bool short) async {
    final dynamicLinkParams = DynamicLinkParameters(
        link: Uri.parse("https://trainingflutternew.page.link/?name=${_deepLinkController.deepLinkParameters.value}"),
        uriPrefix: "https://trainingflutternew.page.link/",
        androidParameters: const AndroidParameters(
            packageName: "com.example.flutter_training"),
        socialMetaTagParameters: SocialMetaTagParameters(
            description: "Deep link demo",
            imageUrl: Uri.parse("https://trainingflutternew.page.link/"),
            title: "Flutter Training"));

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink =
          await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
      url = shortLink.shortUrl;
    } else {
      url = await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);
    }
    _deepLinkController.linkMessage.value = url.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Links Example'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GetBuilder<DeepLinkController>(
                      builder: (controller) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text("DeepLink Query Value : ${_deepLinkController.deepLinkQueryValue.value}"),
                        );
                      },
                    ),
                    TextField(
                      onChanged: _deepLinkController.deepLinkParameters,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: StringConstant.hintEnterParams),
                    ),
                    ElevatedButton(
                      onPressed: () => _createDynamicLink(false),
                      child: const Text('Get Long Link'),
                    ),
                    ElevatedButton(
                      onPressed: () => _createDynamicLink(true),
                      child: const Text('Get Short Link'),
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () async {
                          if (_deepLinkController
                              .linkMessage.value.isNotEmpty) {
                            Logger().d(_deepLinkController.linkMessage.value);
                            await launchUrl(Uri.parse(
                                _deepLinkController.linkMessage.value));
                          }
                        },
                        onLongPress: () {
                          Clipboard.setData(ClipboardData(
                              text: _deepLinkController.linkMessage.value));
                          SnackbarUtil.showSnackbar(
                              context: context,
                              message: "'Copied Link!",
                              type: SnackType.info);
                        },
                        child: Text(
                          _deepLinkController.linkMessage.value,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
