import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerBar extends StatefulWidget {
  final String hintText;
  final Function(DateTime?) onChanged;
  const DatePickerBar({super.key, required this.hintText, required this.onChanged});

  @override
  State<DatePickerBar> createState() => _DatePickerBarState();
}

class _DatePickerBarState extends State<DatePickerBar> {

  DateTime? date;

  void changeDate() async {
    date = await showDatePicker(
        context: context,
        firstDate: DateTime.now().subtract(Duration(days: 365 * 2)),
        lastDate: DateTime.now().add(Duration(days: 365 * 2))
    );
    setState(() {
    });
    widget.onChanged(date);
  }

  void deleteDate() async {
    setState(() {
      date = null;
    });
    widget.onChanged(date);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: changeDate,
      child: Container(
        padding: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date != null ? DateFormat.yMMMd().format(date!) : widget.hintText
            ),
            IconButton(
                onPressed: deleteDate,
                icon: Icon(
                    Icons.delete_outline
                )
            )
          ],
        ),
      ),
    );
  }
}
