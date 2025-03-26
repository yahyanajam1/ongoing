import 'package:devhub/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.alignment, this.width, this.boxDecoration, this.scrollPadding, this.controller, this.focusNode, this.autoFocus, this.textStyle, this.obscureText, this.readOnly, this.onTap, this.textInputAction, this.textInputType, this.maxLines, this.hintStyle, this.labelStyle, this.prefix, this.prefixConstraints, this.suffix, this.contentPadding, this.borderDecoration, this.filled, this.fillColor, this.validator, this.hinText, this.labelText, this.suffixConstraints});

  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final TextStyle?textStyle;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hinText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final bool? filled;
  final Color?fillColor;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  alignment != null?Align(
      alignment: alignment??Alignment.center,
      child: textFormFieldWidget(context),
    ):textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context)=> Container(
    width:  width??double.maxFinite,
    decoration: boxDecoration,
    child: TextFormField(
      scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (event){
        if(focusNode != null){
          focusNode?.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      autofocus: autoFocus!,
      style: textStyle??Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
      obscureText: obscureText!,
      readOnly: readOnly!,
      onTap: (){
        onTap?.call();
      },
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines??1,
      decoration: decoration,
      validator: validator,
    ),
  );

  InputDecoration get decoration => InputDecoration(
    hintText: hinText??"",
    hintStyle: hintStyle,
    labelText: labelText,
    labelStyle: labelStyle,
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding: contentPadding??EdgeInsets.all(8),
    fillColor: fillColor,
    filled: filled,
    border: borderDecoration??OutlineInputBorder(),
    enabledBorder: borderDecoration??OutlineInputBorder(),
    focusedBorder: (borderDecoration??OutlineInputBorder()).copyWith(
      borderSide: BorderSide(color: MyColors.primaryBlue, width: 1)
    ),
  );

}


class LinearCalendar extends StatefulWidget {
  const LinearCalendar({super.key});

  @override
  State<LinearCalendar> createState() => _LinearCalendarState();
}

class _LinearCalendarState extends State<LinearCalendar> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<DateTime> weekDates = _getTwoWeeksDates(now);

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Container(
            //width: MediaQuery.of(context).size.width / 1,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 8, left: 8),
                  padding: EdgeInsets.only(left: 14, right: 14, top: 6, bottom: 6),
                  decoration: BoxDecoration(
                      color: index==3?MyColors.primaryBlue: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow:[
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(1,1),
                            color: MyColors.whiteTwo.withOpacity(0.2)
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Text('${weekDates[index].day}', style: TextStyle(fontSize: 17,fontFamily: 'Lexend', fontWeight: FontWeight.w700, color:index==3?Colors.white: Colors.black87)),
                      Text(_getDayOfWeek(index), style: TextStyle(fontSize: 13, fontFamily: 'Lexend', fontWeight: FontWeight.w600, color:index==3?Colors.white: Colors.black54)),
                    ],
                  ),
                );
              }),
            ),
          ),

          /*
          Container(
            width: MediaQuery.of(context).size.width / 1,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                return Column(
                  children: [
                    Text(_getDayOfWeek(index), style: TextStyle(fontSize: 11, fontFamily: 'Nunito', fontWeight: FontWeight.w600, color: Colors.black54)),
                    Text('${weekDates[index + 7].day}', style: TextStyle(fontSize: 14, fontFamily: 'Nunito', fontWeight: FontWeight.w700, color: Colors.black87)),
                  ],
                );
              }),
            ),
          )
          */
        ],
      ),
    );
  }

  // Utility methods to calculate the days
  List<DateTime> _getTwoWeeksDates(DateTime now) {
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    List<DateTime> weekDates = List.generate(14, (index) => startOfWeek.add(Duration(days: index)));
    return weekDates;
  }

  String _getDayOfWeek(int index) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[index];
  }
}



MaterialButton authFormButton ({required String title ,required Function() pressed,required double height, Widget ? customWidget, Color? color}){
  return  MaterialButton(
      color: color ?? MyColors.primaryBlue,
      minWidth: double.infinity,
      height: height,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(12))),
      onPressed: pressed,
      child: customWidget ?? authFormButtonText(title: title,));
}

Text authFormButtonText ({required String title, Color? textColor}){
  return Text(
    title,
    style: TextStyle(
        color: textColor?? Colors.white,
        fontSize: 16,
        fontFamily: 'Lexend',
        fontWeight: FontWeight.normal,
        letterSpacing: 2),
  );
}


ElevatedButton authSocialButton ({required double height,required String title,required Color color, Color? textColor, required Widget widget ,required Function() pressed}){
  return  ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, height),
        backgroundColor: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: MyColors.appGrey, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(12),),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget,
          SizedBox(width: 8,),
          Text(
            title,
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 17,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w500,
                letterSpacing: 2),
          ),
        ],
      ));
}


class kTextField extends StatefulWidget {

  final String label;
  final TextEditingController? _controller;
  final bool validate;
  final bool obscure;
  final TextInputType textInputType;
  final Widget ? customWidget;
  const kTextField(this.label, [this._controller, this.validate = false,
    this.customWidget, this.obscure = false, this.textInputType = TextInputType.text,]);

  @override
  State<kTextField> createState() => _kTextFieldState();
}

class _kTextFieldState extends State<kTextField> {

  bool focus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        // color: kMainColor.withOpacity(0.2),
        color: focus ? MyColors.primaryBlue : MyColors.primaryBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 1.5, top: 1.5, bottom: 1.5, right: 1.5),
        child: Container(
          padding: const EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor != Colors.black ? Colors.white : Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            // border: Border.all(width: 1.5, color: Colors.grey),
          ),
          child: Row(
            children: [
              if(widget.customWidget != null)
                widget.customWidget!,
              Flexible(child:  TextFormField(
                keyboardType: widget.textInputType,
                obscureText: widget.obscure,
                controller: widget._controller,
                style: textFieldTextStyle(),
                onTap: (){
                  setState(() {
                    focus = !focus;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: widget.label,
                  labelStyle: textFieldLabelStyle(),
                  suffixIcon: widget.validate != false ? Icon(Icons.info_outline, color: Colors.red) : null,
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}


TextStyle textFieldTextStyle() => TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Nunito', fontSize: 14, color: Colors.black87);

TextStyle textFieldLabelStyle() => TextStyle(color: Colors.grey, fontWeight: FontWeight.normal);


class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchBarWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp, fontFamily: 'Lexend'),
            border: InputBorder.none,
            prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey, size: 24.sp),
            contentPadding: EdgeInsets.symmetric(vertical: 14.h),
          ),
        ),
      ),
    );
  }
}
