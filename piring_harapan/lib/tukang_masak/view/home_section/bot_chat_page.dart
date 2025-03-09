import 'package:flutter/material.dart';

class BotChatPage extends StatefulWidget {
  @override
  _BotChatPageState createState() => _BotChatPageState();
}

class _BotChatPageState extends State<BotChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isTyping = false; // Untuk efek loading AI mengetik

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      // Tambahkan pesan user ke chat
      _messages.add({"text": text, "isUser": true});
      _isTyping = true; // AI mulai mengetik
    });

    _controller.clear();

    // Simulasi respon AI dengan delay
    Future.delayed(Duration(seconds: 1), () {
      _botResponse(text);
    });
  }

  void _botResponse(String userMessage) {
    setState(() {
      _isTyping = false; // AI selesai mengetik
    });

    String botReply = _generateBotResponse(userMessage);

    setState(() {
      // Tambahkan pesan bot ke chat
      _messages.add({"text": botReply, "isUser": false});
    });
  }

  /// **📌 Fungsi untuk menentukan respon AI berdasarkan input user**
  String _generateBotResponse(String userMessage) {
    userMessage = userMessage.toLowerCase();

    if (userMessage.contains("bakwan sayur")) {
      return "🍽 **Bakwan Sayur** direkomendasikan oleh Chef AI karena:\n"
          "- **Efisiensi Biaya**: Bahan baku murah & mudah didapat.\n"
          "- **Survey**: 100+ mahasiswa memilih menu ini dalam Google Form.\n"
          "- **Nilai Gizi**: Mengandung sayur sehat dan rendah lemak.";
    } else if (userMessage.contains("menu terbaik")) {
      return "🔥 **Chef AI merekomendasikan menu terbaik berdasarkan:**\n"
          "- Tren Makanan 🍜\n"
          "- Harga Bahan 🏷\n"
          "- Permintaan Konsumen 📊\n"
          "Apakah kamu ingin rekomendasi lebih spesifik?";
    } else if (userMessage.contains("nutrisi") ||
        userMessage.contains("gizi")) {
      return "🥗 **Informasi Nutrisi**:\n"
          "- **Bakwan Sayur**: Serat tinggi, rendah lemak.\n"
          "- **Kangkung Tumis**: Kaya zat besi & vitamin C.\n"
          "Apakah ada menu lain yang ingin kamu tanyakan?";
    } else {
      return "🤖 Chef AI: \"Maaf, aku belum mengerti pertanyaanmu. Bisa kamu jelaskan lebih lanjut?\"";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Chef AI", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _messages.length +
                  (_isTyping
                      ? 1
                      : 0), // Tambahkan 1 item jika AI sedang mengetik
              itemBuilder: (context, index) {
                if (_isTyping && index == _messages.length) {
                  return _buildTypingIndicator(); // Tampilkan loading AI
                }
                final message = _messages[index];
                return _buildChatBubble(message["text"], message["isUser"]);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  /// **📌 Widget untuk balon chat**
  Widget _buildChatBubble(String message, bool isUser) {
    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isUser) _buildAvatar(isUser), // Avatar AI di sebelah kiri
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUser ? Colors.green[100] : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: isUser ? Radius.circular(12) : Radius.zero,
                bottomRight: isUser ? Radius.zero : Radius.circular(12),
              ),
              border: Border.all(color: Colors.green),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ),
        if (isUser) _buildAvatar(isUser), // Avatar User di sebelah kanan
      ],
    );
  }

  /// **📌 Widget untuk avatar bot & user**
  Widget _buildAvatar(bool isUser) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 16,
      backgroundImage: AssetImage(
        isUser ? "assets/img/user_avatar.png" : "assets/img/ai_avatar.png",
      ),
    );
  }

  /// **📌 Widget efek AI sedang mengetik**
  Widget _buildTypingIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildAvatar(false),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Typing", style: TextStyle(color: Colors.black54)),
              SizedBox(width: 4),
              _buildDot(),
              _buildDot(),
              _buildDot(),
            ],
          ),
        ),
      ],
    );
  }

  /// **📌 Widget efek titik-titik ketika AI mengetik**
  Widget _buildDot() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  /// **📌 Widget input chat**
  Widget _buildMessageInput() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.send, color: Colors.green),
            onPressed: () => _sendMessage(_controller.text),
          ),
        ],
      ),
    );
  }
}
