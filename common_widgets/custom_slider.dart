import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {

  double min;
  double max;
  double sliderVal;
  CustomSlider({Key? key, required this.max,required this.min,required this.sliderVal}) : super(key: key);

  @override
  CustomSliderState createState() => CustomSliderState();
}

class CustomSliderState extends State<CustomSlider> {

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        showValueIndicator: ShowValueIndicator.always,
        trackHeight: 5,
        activeTrackColor: Colors.blue,
        inactiveTrackColor: Colors.grey,
        // Customize the appearance of the slider thumb
        thumbColor: Colors.blue,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
        // Customize the appearance of the overlay that appears when dragging the thumb
        overlayColor: Colors.blue.withOpacity(0.3),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
      ),
      child: Slider(
        label: widget.sliderVal.toInt().toString(),
        value: widget.sliderVal,
        min: widget.min,
        max: widget.max,
        onChanged: (newValue) {
          setState(() {
            widget.sliderVal = newValue;
          });
        },
      ),
    );
  }
}
