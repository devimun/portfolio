import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmo_friends/provider/user_management_provider.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderBoardBtn extends ConsumerWidget {
  const LeaderBoardBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.read(userProvider);
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: mainColor,
        shape: borderShape,
      ),
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => Dialog(
            backgroundColor: modalBgColor,
            child: LeaderBoard(
              uid: userData['uid'],
              score: userData['best'],
            ),
          ),
        );
      },
      icon: const Icon(
        Icons.leaderboard,
        color: Colors.black,
      ),
    );
  }
}

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({
    super.key,
    required this.uid,
    required this.score,
  });
  final String uid;
  final int score;
  // 리더 보드 조회를 위한 메서드
  Future<Map<String, dynamic>> getLeaderBoard() async {
    final colRef = FirebaseFirestore.instance.collection('users');
    // UI에 사용될 정보
    // 1. 총 사용자 수
    AggregateQuerySnapshot docCountSnapshot = await colRef.count().get();
    int numOfDocs = docCountSnapshot.count!;
    // 점수를 기준으로 doc 정렬
    QuerySnapshot docsSnapshot =
        await colRef.orderBy('best', descending: true).get();
    // 2. 유저의 등수
    int userRank = docsSnapshot.docs.indexWhere(
          (doc) => doc.id == uid,
        ) +
        1;
    // 3. 모든 유저의 정보
    List<QueryDocumentSnapshot> allDocs = docsSnapshot.docs;
    List<QueryDocumentSnapshot> scoreList = allDocs.sublist(0, 100);
    return {
      'totalPlayer': numOfDocs,
      'userRank': userRank,
      'scoreList': scoreList,
    };
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.clear,
              ),
            ),
          ),
          Text(
            'TOP 100 PLAYER',
            style: textTheme.displayLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: getLeaderBoard(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  FirebaseCrashlytics.instance.recordError(
                      snapshot.error.toString(), snapshot.stackTrace);
                  return const Center(
                    child: Text('Unexpected Error Please Try Again Later'),
                  );
                } else if (snapshot.hasData) {
                  final data = snapshot.data!;
                  List<QueryDocumentSnapshot> scoreList = data['scoreList'];
                  return Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Your Id: ${uid.substring(0, 5)}',
                                  style: textTheme.displaySmall,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: Text(
                                'Your Score: $score',
                                style: textTheme.displaySmall,
                              )),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  'Your Rank: ${data['userRank']}',
                                  style: textTheme.displaySmall,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  'Total Player: ${data['totalPlayer']}',
                                  style: textTheme.displaySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Center(
                                    child: Text(
                                  'Rank',
                                  style: textTheme.displaySmall,
                                ))),
                            Expanded(
                                flex: 1,
                                child: Center(
                                    child: Text(
                                  'Player ID',
                                  style: textTheme.displaySmall,
                                ))),
                            Expanded(
                                flex: 1,
                                child: Center(
                                    child: Text(
                                  'Score',
                                  style: textTheme.displaySmall,
                                ))),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: scoreList.length,
                            itemBuilder: (context, index) {
                              return PlayerScoreBoard(
                                  docs: scoreList[index], rank: index + 1);
                            },
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No Data Available'),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class PlayerScoreBoard extends ConsumerWidget {
  const PlayerScoreBoard({
    super.key,
    required this.docs,
    required this.rank,
  });
  final QueryDocumentSnapshot docs;
  final int rank;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.read(userProvider)['uid'];
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: docs.id == uid ? Colors.grey : Colors.grey[300],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
                child: Text(
              rank.toString(),
              style: textTheme.displaySmall,
            )),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                docs.id.substring(0, 5),
                style: textTheme.displaySmall,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
                child: Text(
              docs.get('best').toString(),
              style: textTheme.displaySmall,
            )),
          ),
        ],
      ),
    );
  }
}
