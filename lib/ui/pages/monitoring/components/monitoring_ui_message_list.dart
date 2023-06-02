import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../../common/constant/string_constant.dart';
import '../../../../data/datasources/firebase_database_datasource.dart';
import '../../../../data/models/message.dart';
import '../../../widget/appbar.dart';
import 'monitoring_ui_message_widget.dart';

class MessageList extends StatefulWidget {
  MessageList({super.key});
  final messageConsultation = MessageConsultation();

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_canSendMessage()) {
      final message = Message(_messageController.text, DateTime.now());
      widget.messageConsultation.saveMessage(message);
      _messageController.clear();
      setState(() {});
    }
  }

  Widget _getMessageList() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: widget.messageConsultation.getMessageQuery(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final message = Message.fromJson(json);
          return MessageWidget(message.text, message.date);
        },
      ),
    );
  }

  bool _canSendMessage() => _messageController.text.isNotEmpty;

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return Scaffold(
      appBar: AppBarDefault(
        title: StringConstant.chatTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _getMessageList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _messageController,
                      onSubmitted: (input) {
                        _sendMessage();
                      },
                      decoration:
                          const InputDecoration(hintText: 'Ketik pesan disini'),
                    ),
                  ),
                ),
                Card(
                  color: Colors.red.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(_canSendMessage() ? Icons.send : Icons.send),
                    onPressed: () {
                      _sendMessage();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
