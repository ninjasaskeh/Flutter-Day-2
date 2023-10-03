import 'package:flutter/material.dart';
import 'package:ui_whatsapp/models/call.dart';

import '../theme.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callList.length,
      itemBuilder: (context, index) {
        final call = callList[index];
        return ListTile(
          leading: const Icon(
            Icons.account_circle,
            size: 58,
            color: Colors.black,
          ),
          title: Text(call.name, style: customTextStyle,),
          subtitle: Text(call.description),
          trailing: Icon(Icons.call,
           color: whatsAppLightGreen,),
        );
      },
    );
  }
}