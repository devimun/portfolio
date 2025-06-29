import 'package:flutter/material.dart';
import 'package:unumbers/feature/user_management/widgets/register.dart';
import 'package:unumbers/feature/user_management/widgets/user_table.dart';
import 'package:unumbers/feature/utils/style.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '계정 생성',
                  style: WebStyle.tS,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: WebStyle.subBGC,
                    ),
                    child: const Register(),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 100,
        ),
        Container(
          width: 3,
          height: double.infinity,
          color: WebStyle.twoSubBGC,
        ),
        const SizedBox(
          width: 100,
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '계정 목록',
                  style: WebStyle.tS,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: UserTable(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
