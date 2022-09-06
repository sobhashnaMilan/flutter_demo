import 'package:flutter_demo/util/import_export_util.dart';

class MultiLanguage extends StatefulWidget {
  const MultiLanguage({Key? key}) : super(key: key);

  @override
  State<MultiLanguage> createState() => _MultiLanguageState();
}

class _MultiLanguageState extends State<MultiLanguage> {
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
    {'name': 'ગુજરાતી', 'locale': const Locale('gu', 'IN')},
    {'name': 'Arabic', 'locale': const Locale('ar', 'AE')}
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context)
        ? DeviceType.mobile
        : DeviceType.desktop;

    return Scaffold(
      appBar: AppBarComponent.buildAppbar(
        titleWidget: Text(
          StringConstant.btnMultiLanguage.tr,
          style: deviceType == DeviceType.mobile
              ? white100Medium24TextStyle(context)
              : white100Medium10TextStyle(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))),
            child: Column(children: [
              SizedBox(height: Get.height * 0.22),
              Text(
                'welcome'.tr.toUpperCase(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w900,color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'message'.tr,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Flutter',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => buildLanguageDialog(context),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                  padding: const EdgeInsets.all(20),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(color: Colors.blueAccent, width: 3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18))),
                  child: Text(
                    'changeLanguage'.tr,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  buildLanguageDialog(BuildContext context) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            elevation: 0.0,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var d = locale[index];
                        return Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            child: Text(d['name']),
                            onTap: () {
                              updateLanguage(locale[index]['locale']);
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Colors.blue,
                        );
                      },
                      itemCount: locale.length),
                ),
              ],
            ));
      },
    );
  }

}
