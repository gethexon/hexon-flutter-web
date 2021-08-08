import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AddGithubPlaftormPage extends StatefulWidget {
  const AddGithubPlaftormPage({Key? key}) : super(key: key);

  @override
  _AddPlaftormPageState createState() => _AddPlaftormPageState();
}

class _AddPlaftormPageState extends State<AddGithubPlaftormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("添加Github"),
          ],
        ),
        backwardsCompatibility: false,
      ),
      body: Column(
        children: [
          Text("打开Github > Setting > Tokens页面"),
          IconButton(
            onPressed: () {
              launch('https://github.com/settings/tokens');
            },
            icon: Icon(Icons.open_in_browser_outlined),
          ),
          Image.network(
            "assets/images/add_platform_github_1.png",
          ),
          Text("点击右上角按钮 Generate new token"),
          Text("Note 中填写: Hexon"),
          Text("Expiration 选择 No expiration"),
        ],
      ),
    );
  }
}
