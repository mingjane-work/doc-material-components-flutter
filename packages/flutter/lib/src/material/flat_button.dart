// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'button.dart';
import 'button_theme.dart';
import 'material_button.dart';
import 'theme.dart';
import 'theme_data.dart';

/// A material design text (flat) button.
///
/// For more information on text button styles, go to the material.io
/// [guidance page](https://material.io/components/buttons/).
///
/// ## When to use
///
/// A flat button is a text label displayed on a (zero elevation) [Material]
/// widget that reacts to touches by filling with color. The test button style
/// has a transparent background with text in colorPrimary. Text buttons are
/// used for low-priority actions, especially when presenting multiple options.
///
/// ## Using text buttons
///
/// If the [onPressed] callback is null, then the button will be disabled,
/// will not react to touch, and will be colored as specified by
/// the [disabledColor] property instead of the [color] property. If you are
/// trying to change the button's [color] and it is not having any effect, check
/// that you are passing a non-null [onPressed] handler.
///
/// The [clipBehavior] argument must not be null.
///
/// {@tool sample}
///
/// This example shows a simple [FlatButton].
///
/// ![A simple FlatButton](https://flutter.github.io/assets-for-api-docs/assets/material/flat_button.png)
///
/// ```dart
/// FlatButton(
///   onPressed: () {
///     /*...*/
///   },
///   child: Text(
///     "Flat Button",
///   ),
/// )
/// ```
/// {@end-tool}
///
/// {@tool sample}
///
/// This example shows a [FlatButton] that is normally white-on-blue,
/// with splashes rendered in a different shade of blue.
/// It turns black-on-grey when disabled.
/// The button has 8px of padding on each side, and the text is 20px high.
///
/// ![A FlatButton with white text on a blue background](https://flutter.github.io/assets-for-api-docs/assets/material/flat_button_properties.png)
///
/// ```dart
/// FlatButton(
///   color: Colors.blue,
///   textColor: Colors.white,
///   disabledColor: Colors.grey,
///   disabledTextColor: Colors.black,
///   padding: EdgeInsets.all(8.0),
///   splashColor: Colors.blueAccent,
///   onPressed: () {
///     /*...*/
///   },
///   child: Text(
///     "Flat Button",
///     style: TextStyle(fontSize: 20.0),
///   ),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [RaisedButton], a filled button whose material elevates when pressed.
///  * [DropdownButton], which offers the user a choice of a number of options.
///  * [SimpleDialogOption], which is used in [SimpleDialog]s.
///  * [IconButton], to create buttons that just contain icons.
///  * [InkWell], which implements the ink splash part of a flat button.
///  * [RawMaterialButton], the widget this widget is based on.
///  * <https://material.io/design/components/buttons.html>
/// ## API
class FlatButton extends MaterialButton {
  /// Create a simple text button.
  ///
  /// The [autofocus] and [clipBehavior] arguments must not be null.
  const FlatButton({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior = Clip.none,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    @required Widget child,
  }) : assert(clipBehavior != null),
       assert(autofocus != null),
       super(
         key: key,
         onPressed: onPressed,
         onHighlightChanged: onHighlightChanged,
         textTheme: textTheme,
         textColor: textColor,
         disabledTextColor: disabledTextColor,
         color: color,
         disabledColor: disabledColor,
         focusColor: focusColor,
         hoverColor: hoverColor,
         highlightColor: highlightColor,
         splashColor: splashColor,
         colorBrightness: colorBrightness,
         padding: padding,
         shape: shape,
         clipBehavior: clipBehavior,
         focusNode: focusNode,
         autofocus: autofocus,
         materialTapTargetSize: materialTapTargetSize,
         child: child,
      );

  /// Create a text button from a pair of widgets that serve as the button's
  /// [icon] and [label].
  ///
  /// The icon and label are arranged in a row and padded by 12 logical pixels
  /// at the start, and 16 at the end, with an 8 pixel gap in between.
  ///
  /// The [icon], [label], and [clipBehavior] arguments must not be null.
  factory FlatButton.icon({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior,
    FocusNode focusNode,
    bool autofocus,
    MaterialTapTargetSize materialTapTargetSize,
    @required Widget icon,
    @required Widget label,
  }) = _FlatButtonWithIcon;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);
    return RawMaterialButton(
      onPressed: onPressed,
      onHighlightChanged: onHighlightChanged,
      fillColor: buttonTheme.getFillColor(this),
      textStyle: theme.textTheme.button.copyWith(color: buttonTheme.getTextColor(this)),
      focusColor: buttonTheme.getFocusColor(this),
      hoverColor: buttonTheme.getHoverColor(this),
      highlightColor: buttonTheme.getHighlightColor(this),
      splashColor: buttonTheme.getSplashColor(this),
      elevation: buttonTheme.getElevation(this),
      focusElevation: buttonTheme.getFocusElevation(this),
      hoverElevation: buttonTheme.getHoverElevation(this),
      highlightElevation: buttonTheme.getHighlightElevation(this),
      disabledElevation: buttonTheme.getDisabledElevation(this),
      padding: buttonTheme.getPadding(this),
      constraints: buttonTheme.getConstraints(this),
      shape: buttonTheme.getShape(this),
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      materialTapTargetSize: buttonTheme.getMaterialTapTargetSize(this),
      animationDuration: buttonTheme.getAnimationDuration(this),
      child: child,
    );
  }
}

/// The type of FlatButtons created with [FlatButton.icon].
///
/// This class only exists to give FlatButtons created with [FlatButton.icon]
/// a distinct class for the sake of [ButtonTheme]. It can not be instantiated.
class _FlatButtonWithIcon extends FlatButton with MaterialButtonWithIconMixin {
  _FlatButtonWithIcon({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior = Clip.none,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    @required Widget icon,
    @required Widget label,
  }) : assert(icon != null),
       assert(label != null),
       assert(clipBehavior != null),
       assert(autofocus != null),
       super(
         key: key,
         onPressed: onPressed,
         onHighlightChanged: onHighlightChanged,
         textTheme: textTheme,
         textColor: textColor,
         disabledTextColor: disabledTextColor,
         color: color,
         disabledColor: disabledColor,
         focusColor: focusColor,
         hoverColor: hoverColor,
         highlightColor: highlightColor,
         splashColor: splashColor,
         colorBrightness: colorBrightness,
         padding: padding,
         shape: shape,
         clipBehavior: clipBehavior,
         focusNode: focusNode,
         autofocus: autofocus,
         materialTapTargetSize: materialTapTargetSize,
         child: Row(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
             icon,
             const SizedBox(width: 8.0),
             label,
           ],
         ),
       );

}
