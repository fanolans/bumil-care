// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'monitoring_ui_bubble_chat.dart';

// class MessagesWidget extends StatefulWidget {
//   const MessagesWidget({super.key});

//   @override
//   State<MessagesWidget> createState() => _MessagesWidgetState();
// }

// class _MessagesWidgetState extends State<MessagesWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     return StreamBuilder(
//       stream: FirebaseDatabase.instance
//           .collection('chat')
//           .orderBy('createdAt', descending: true)
//           .snapshots(),
//       builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
//         if (chatSnapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         final chatDocs = chatSnapshot.data!.docs;
//         return ListView.builder(
//           physics: const AlwaysScrollableScrollPhysics(
//             parent: BouncingScrollPhysics(),
//           ),
//           reverse: true,
//           itemCount: chatDocs.length,
//           itemBuilder: (ctx, index) {
//             return BubbleChat(
//               message: (chatDocs[index].data()! as Map)['text'],
//               userName: (chatDocs[index].data()! as Map)['username'],
//               photoURL: (chatDocs[index].data()! as Map)['userImage'],
//               isMe: (chatDocs[index].data()! as Map)['userId'] == user!.uid,
//             );
//           },
//         );
//       },
//     );
//   }
// }
