import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class LabeledCheckbox extends StatefulWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  State<LabeledCheckbox> createState() => _LabeledCheckboxState();
}

class _LabeledCheckboxState extends State<LabeledCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged(!widget.value);
        isChecked = !isChecked;
        setState(() {});
      }, // toggle when tapping anywhere
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              widget.onChanged(value!);
              isChecked = value;
              setState(() {});
            },
          ),
          Text(widget.label, style: AppTextStyles.semiBold13),
        ],
      ),
    );
  }
}
