import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {super.key,
      required this.child,
      required this.flex,
      required this.height,
      this.title});
  final Widget child;
  final int flex;
  final double height;
  final String? title;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      flex: widget.flex,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 3, spreadRadius: 3, color: Colors.grey.shade300)
              ],
              borderRadius: BorderRadius.circular(12)),
          height: size.height * widget.height,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
          child: widget.title != null
              ? Column(
                  children: [
                    Flexible(
                        child: Text(
                      widget.title ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              overflow: TextOverflow.ellipsis, fontSize: 16),
                    )),
                    SizedBox(
                      height: 16,
                    ),
                    widget.child
                  ],
                )
              : widget.child),
    );
  }
}
