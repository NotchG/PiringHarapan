import 'package:flutter/material.dart';

class StepByStepGuide extends StatefulWidget {
  final List<Map<String, dynamic>> steps;

  const StepByStepGuide({Key? key, required this.steps}) : super(key: key);

  @override
  _StepByStepGuideState createState() => _StepByStepGuideState();
}

class _StepByStepGuideState extends State<StepByStepGuide> {
  List<bool> _isOpen = [];

  @override
  void initState() {
    super.initState();
    _isOpen = List.generate(widget.steps.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.steps.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> step = entry.value;

        return Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isOpen[index] = !_isOpen[index];
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      step["title"],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      _isOpen[index] ? Icons.expand_less : Icons.expand_more,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
            ),
            if (_isOpen[index])
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (step["content"] as List<String>).map((e) => Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Text(
                      e,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 14,
                      ),
                    ),
                  )).toList(),
                ),
              ),
            SizedBox(height: 8),
          ],
        );
      }).toList(),
    );
  }
}
