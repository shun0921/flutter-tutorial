import 'package:flutter/material.dart';
import 'package:flutter_tutorial/regidence/view/ui_elements/notification_number.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: NotificationButton(
                text: 'カウルのおすすめ',
                notificationCount: '',
                onPressed: () {},
              ),
            ),
            NotificationButton(
              text: 'リフォーム済みの物件',
              notificationCount: '3',
              onPressed: () {},
            ),
            const SizedBox(
              width: 40,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.teal,
              ),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
