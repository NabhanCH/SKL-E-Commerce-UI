import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Map<String, List<Map<String, dynamic>>> chats = {
    'Seller 1': [
      {
        'message': 'Hello, how can I help you?',
        'isSender': false,
        'time': '12:30 PM',
      },
      {
        'message': 'I want to ask about your product.',
        'isSender': true,
        'time': '12:31 PM',
      },
    ],
    'Seller 2': [
      {
        'message': 'Good day! Do you need assistance?',
        'isSender': false,
        'time': '9:00 AM',
      },
      {
        'message': 'Yes, what is the price of your item?',
        'isSender': true,
        'time': '9:05 AM',
      },
    ],
    'Seller 3': [
      {
        'message': 'Are you interested in any products?',
        'isSender': false,
        'time': '8:45 AM',
      },
      {
        'message': 'Yes, tell me more about product A.',
        'isSender': true,
        'time': '8:46 AM',
      },
    ],
    'Seller 4': [],
    'Seller 5': [],
  };

  String? selectedSeller;
  final TextEditingController _controller = TextEditingController();

  void selectSeller(String seller) {
    setState(() {
      selectedSeller = seller;
    });
  }

  void sendMessage() {
    if (selectedSeller != null) {
      String messageText = _controller.text.trim();
      if (messageText.isNotEmpty) {
        setState(() {
          chats[selectedSeller]!.add({
            'message': messageText,
            'isSender': true,
            'time': TimeOfDay.now().format(context),
          });
        });
        _controller.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat with Seller',
          style: TextStyle(color: Color(0xFF40C4FF)),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF40C4FF)),
      ),
      body: selectedSeller == null
          ? _buildSellerList()
          : _buildChatScreen(),
    );
  }

  Widget _buildSellerList() {
    return ListView.builder(
      itemCount: chats.keys.length,
      itemBuilder: (context, index) {
        String sellerName = chats.keys.elementAt(index);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ChatTile(
            sellerName: sellerName,
            lastMessage: chats[sellerName]!.isNotEmpty
                ? chats[sellerName]!.last['message']
                : 'No messages yet',
            time: chats[sellerName]!.isNotEmpty
                ? chats[sellerName]!.last['time']
                : '',
            onTap: () {
              selectSeller(sellerName);
            },
          ),
        );
      },
    );
  }

  Widget _buildChatScreen() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chats[selectedSeller]!.length,
            itemBuilder: (context, index) {
              final message = chats[selectedSeller]![index];
              return ChatBubble(
                isSender: message['isSender'],
                message: message['message'],
                time: message['time'],
              );
            },
          ),
        ),
        _buildInputField(),
      ],
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: const Color(0xFF40C4FF),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String sellerName;
  final String lastMessage;
  final String time;
  final VoidCallback onTap;

  const ChatTile({
    super.key,
    required this.sellerName,
    required this.lastMessage,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color(0xFF40C4FF),
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text(
        sellerName,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 174, 255),
        ),
      ),
      subtitle: Text(lastMessage, style: const TextStyle(color: Colors.grey)),
      trailing: Text(time, style: const TextStyle(color: Colors.grey)),
      onTap: onTap,
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String message;
  final String time;

  const ChatBubble({
    super.key,
    required this.isSender,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSender ? const Color(0xFF40C4FF) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isSender ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(
                color: isSender ? Colors.white70 : Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
