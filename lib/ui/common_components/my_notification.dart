import 'package:bot_toast/bot_toast.dart';
import 'package:dominote/controller/helpers/language.dart';
import 'package:flutter/material.dart';

enum MyNotificationType {
  error,
  success,
  info,
}

class MyNotification extends StatelessWidget {
  MyNotificationType _type;
  Widget leading;
  String title;
  String subTitle;
  Widget tailing;
  Function onTap;
  MyNotification(this._type,
      {this.tailing, this.subTitle, this.title, this.onTap});

  static _showNotification(
      MyNotificationType type, String title, String subtitle, Function action) {
    BotToast.showCustomNotification(toastBuilder: (_) {
      return MyNotification(
        type,
        title: title,
        subTitle: subtitle,
        onTap: action,
      );
    });
  }

  static void showInfo({String title, String subtitle, Function action}) {
    _showNotification(MyNotificationType.info, title, subtitle, action);
  }

  static void showSuccess({String subtitle, Function action}) {
    _showNotification(MyNotificationType.success,
        Language.getStrings("Success"), subtitle, action);
  }

  static void showError({String subtitle, Function action}) {
    _showNotification(MyNotificationType.error, Language.getStrings("Error"),
        subtitle, action);
  }

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case MyNotificationType.error:
        leading = Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffEF4B5F),
          ),
          child: Icon(
            Icons.remove,
            color: Colors.white,
          ),
        );
        break;
      case MyNotificationType.success:
        leading = Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff51DC8E),
          ),
          child: Icon(Icons.check, color: Colors.white),
        );
        break;
      case MyNotificationType.info:
        leading = Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff000000),
          ),
          child: Icon(Icons.info, color: Colors.white),
        );
        break;
      default:
    }
    return Material(
      child: InkWell(
        onTap: onTap ?? () {},
        child: Container(
          alignment: Alignment.center,
          height: 90,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: Theme.of(context).dialogBackgroundColor,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            leading ?? Container(),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 149,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    title,
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                  Text(
                                    subTitle,
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        tailing ?? Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
