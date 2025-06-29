import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/utils/style.dart';

class UserTable extends ConsumerWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0), // 둥근 모서리 적용
      child: Container(
        color: WebStyle.subBGC, // 배경색 설정
        child: StreamBuilder(
            stream: _firestore.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString(), style: WebStyle.tS),
                );
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text('유저가 존재하지 않습니다.', style: WebStyle.tS),
                );
              } else {
                List<QueryDocumentSnapshot> users = snapshot.data!.docs;
                List<String> tableColumnTitle = ['아이디', '비밀번호', '기타'];
                return Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      decoration: WebStyle.tableRowDeco,
                      children: [
                        for (int i = 0; i < tableColumnTitle.length; i++)
                          TableColumn(
                            title: tableColumnTitle[i],
                            width: i == 2 ? 0 : null,
                          )
                      ],
                    ),
                    ...users.map((member) {
                      return TableRow(
                        decoration: WebStyle.tableRowDeco,
                        children: [
                          TableColumn(title: member.id),
                          TableColumn(
                            title: member['pwd'],
                          ),
                          TableColumn(
                            widget: TextButton(
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(8)),
                              onPressed: () async {
                                ref.read(loadingProvider.notifier).state = true;
                                await _firestore
                                    .collection('users')
                                    .doc(member.id)
                                    .delete();
                                ref.read(loadingProvider.notifier).state =
                                    false;
                              },
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '삭제하기',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                );
              }
            }),
      ),
    );
  }
}

class TableColumn extends StatelessWidget {
  const TableColumn({
    super.key,
    this.title,
    this.widget,
    this.width,
  });
  final String? title;
  final Widget? widget;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return widget ??
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                  width: width ?? 1,
                  color: width == null
                      ? const Color(0xff9E9E97)
                      : WebStyle.subBGC),
            ),
          ),
          child: Text(
            title!,
            style: WebStyle.subTS.copyWith(
              fontSize: 16,
            ),
          ),
        );
  }
}
