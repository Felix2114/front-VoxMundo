import 'package:flutter/material.dart';

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({super.key});

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  String fromLang = "Español";
  String toLang = "Náhuatl";
  String text = "";
  bool isRecording = false;

  final TextEditingController _controller = TextEditingController();

  void swapLanguages() {
    setState(() {
      final temp = fromLang;
      fromLang = toLang;
      toLang = temp;
      text = "";
      _controller.clear();
    });
  }

  void handleTextSubmit(String value) {
    setState(() {
      text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final topText = fromLang == "Español" ? text : _controller.text;
    final bottomText = toLang == "Náhuatl" ? text : _controller.text;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Language Selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(fromLang, style: const TextStyle(fontSize: 14)),
                  IconButton(
                    icon: const Icon(Icons.swap_horiz),
                    onPressed: swapLanguages,
                  ),
                  Text(toLang, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),

            // Translator area
            Expanded(
              child: Column(
                children: [
                  // Top output
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.blue[100],
                      child: Center(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            topText.isEmpty
                                ? (fromLang == "Español"
                                    ? "Habla"
                                    : "Tlatoloni")
                                : topText,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w300,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Bottom input
                  Expanded(
                    child: Container(
                      color: Colors.blue[700],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Container(
                              constraints: const BoxConstraints(maxHeight: 150),
                              decoration: const BoxDecoration(
                                // Opcional: para que se vea más claro el campo
                                // border: Border.all(color: Colors.white54),
                              ),
                              child: Scrollbar(
                                thumbVisibility: true,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  reverse: true,
                                  child: TextField(
                                    controller: _controller,
                                    onChanged: handleTextSubmit,
                                    style: const TextStyle(
                                      fontSize: 32,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText:
                                          toLang == "Náhuatl"
                                              ? "Tlatoloni"
                                              : "Habla",
                                      hintStyle: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 28,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    cursorColor: Colors.white,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isRecording = !isRecording;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: isRecording ? 90 : 70,
                              height: isRecording ? 90 : 70,
                              decoration: BoxDecoration(
                                color:
                                    isRecording
                                        ? Colors.blue[900]
                                        : Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.mic,
                                color:
                                    isRecording
                                        ? Colors.white
                                        : Colors.blue[600],
                                size: 36,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
