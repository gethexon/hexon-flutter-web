import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hexon_flutter_web/api/leancloud/user_api.dart';
import 'package:hexon_flutter_web/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  bool loading = true;
  bool emailVerified = true;
  String email = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var meResponse = await UserApi().me();
    if (!meResponse.isSuccess) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('sessionToken');
      Navigator.of(context).pushReplacementNamed(AppRoute.home);
    }
    emailVerified = meResponse.message['emailVerified'];
    email = meResponse.message['email'];
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("操作台"),
          ],
        ),
        backwardsCompatibility: false,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : mainBody(),
    );
  }

  Widget mainBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        emailVerified
            ? SizedBox()
            : Container(
                color: Colors.redAccent,
                padding: EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "您的邮箱未验证，请验证邮箱。",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        UserApi().requestEmailVerify(email).then((value) {
                          if (value.isSuccess) {
                            EasyLoading.showSuccess("邮件已重发");
                          }
                        });
                      },
                      child: Text(
                        "重新发送邮件",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
