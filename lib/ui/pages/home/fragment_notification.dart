import 'package:flutter/material.dart';
import 'package:untitled/ui/components/empty_list.dart';

class FragmentNotification extends StatefulWidget {
  const FragmentNotification({super.key});

  @override
  State<FragmentNotification> createState() => _FragmentNotificationState();
}

class _FragmentNotificationState extends State<FragmentNotification> {
  @override
  Widget build(BuildContext context) {
    return EmptyList(text: "Sem notificações por enquanto",);
  }
}
