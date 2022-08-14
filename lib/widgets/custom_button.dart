/* External dependencies */
import 'package:flutter/material.dart';

/* Local dependencies */
import '../theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  final bool loading;
  final Widget child;
  final bool isDisabled;
  final Function? onPressed;

  const PrimaryButton({
    Key? key,
    required this.child,
    this.loading = false,
    this.isDisabled = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        alignment: Alignment.center,
        child: const SizedBox(),
      );
    }

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: isDisabled
            ? MaterialStateProperty.all(DisabledColor)
            : MaterialStateProperty.all(PrimaryColor),
        splashFactory:
            isDisabled ? NoSplash.splashFactory : InkSplash.splashFactory,
        elevation: isDisabled
            ? MaterialStateProperty.all(0)
            : MaterialStateProperty.all(1),
      ),
      onPressed:
          isDisabled ? () {} : () => onPressed != null ? onPressed!() : null,
      child: Center(child: child),
    );
  }
}
