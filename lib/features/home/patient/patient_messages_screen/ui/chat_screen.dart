import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_message/ui/widgets/chat_bubble.dart';

class ChatScreenPatient extends StatefulWidget {
  final int doctorId;

  const ChatScreenPatient({super.key, required this.doctorId});

  @override
  State<ChatScreenPatient> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreenPatient> {
  final TextEditingController _controller = TextEditingController();
  final List<String> messages = [];
  String _doctorName = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadDoctorName();
  }

  Future<void> _loadDoctorName() async {
    String name = await SharedPrefHelper.getDoctorName(widget.doctorId);
    if (name.isEmpty) {
      name = 'Unknown Doctor';
    }
    setState(() {
      _doctorName = name;
    });
    debugPrint('ChatScreenPatient: Loaded doctor name: $name');
  }

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        messages.add(_controller.text.trim());
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(_doctorName, style: TextStyles.font20BlackRegular),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Icon(Icons.call),
          SizedBox(width: 12),
          Icon(Icons.video_call),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(message: messages[index]);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                const Icon(Icons.attach_file, color: Colors.black),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: ColorsManager.lighterBLUE,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: "Type a message...",
                              hintStyle: TextStyles.font14GreyRegular,
                              border: InputBorder.none,
                            ),
                            onSubmitted: (value) => _sendMessage(),
                          ),
                        ),
                        const Icon(Icons.mic, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                horizontalSpace(8),
                CircleAvatar(
                  backgroundColor: ColorsManager.Blue,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}