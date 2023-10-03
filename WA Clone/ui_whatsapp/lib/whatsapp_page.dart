import 'package:flutter/material.dart';
import 'package:ui_whatsapp/theme.dart';
import 'package:ui_whatsapp/widgets/call_view.dart';
import 'package:ui_whatsapp/widgets/chat_view.dart';
import 'package:ui_whatsapp/widgets/status_view.dart';

class WhatsAppPage extends StatefulWidget {
  const WhatsAppPage({super.key});

  @override
  State<WhatsAppPage> createState() => _WhatsAppPageState();
}

class _WhatsAppPageState extends State<WhatsAppPage> with 
SingleTickerProviderStateMixin {

  var tabs = const [
    Tab(
      icon: Icon(Icons.camera_alt),
    ),
    Tab(
      text: "CHATS",
    ),
    Tab(
      text: "STATUS",
    ),
    Tab(
      text: "CALLS",
    ),
  
  ];

  TabController? tabController;
  var fabIcon = Icons.message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        backgroundColor: whatsAppGreen,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        bottom: TabBar(
          tabs: tabs,
          controller: tabController,
          indicatorColor: Colors.white,
          ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
        //samakan dgn controller tabBar diatas
        Center(child: Icon(Icons.camera_alt),),
        ChatView(),
        StatusView(),
        CallView(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: whatsAppLightGreen,
        child: Icon(fabIcon),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: tabs.length, vsync: this);
    tabController?.addListener(() {
      setState(() {
        switch (tabController?.index) {
          case 0:
            fabIcon = Icons.camera_alt;
            break;
          case 1:
            fabIcon = Icons.message;
            break;
          case 2:
            fabIcon = Icons.camera_enhance;
            break;
          case 3:
            fabIcon = Icons.call;
            break;
          default:
        }
      });
    });
    tabController?.index = 1;
  }
}