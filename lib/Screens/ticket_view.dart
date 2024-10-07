import 'package:bookticket/utils/app_layout.dart';
import 'package:bookticket/utils/app_styles.dart';
import 'package:bookticket/widgets/column_layout.dart';
import 'package:bookticket/widgets/layout_builder_widget.dart';
import 'package:bookticket/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/platform/platform.dart';
class TicketView extends StatefulWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({Key? key, required this.ticket, this.isColor}) : super(key: key);

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {

    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.85,
      height: AppLayout.getHeight(GetPlatform.isAndroid==true?172:169),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*
            showing the blue part of the card/ticket
             */
            Container(
              decoration: BoxDecoration(
                color: widget.isColor==null? Color(0xFF526799):Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(21),
                topRight: Radius.circular(21))
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(widget.ticket['from']['code'],
                        style: widget.isColor==null?Styles.headLineStyle3.copyWith(color: Colors.white):Styles.headLineStyle3,
                      ),
                      const Spacer(),
                      ThickContainer(isColor:true),
                      Expanded(child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: AppLayoutBuilderWidget(sections: 6),
                          ),
                          Center(
                            child: Transform.rotate(angle: 1.5, child:
                            Icon(Icons.local_airport_rounded, color: widget.isColor==null? Colors.white:Color(0xFF8ACCF7),)),
                          ),

                        ],
                      )),
                      ThickContainer(isColor:true),
                      Expanded(child: Container()),
                      Text(widget.ticket['to']['code'], style: widget.isColor==null?Styles.headLineStyle3.copyWith(color: Colors.white):Styles.headLineStyle3)
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(widget.ticket['from']['name'], style: widget.isColor==null?Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4),

                      ),
                      Text(widget.ticket['flying_time'], style: widget.isColor==null?Styles.headLineStyle3.copyWith(color: Colors.white):Styles.headLineStyle4,),
                      SizedBox(
                        width: 100,
                        child: Text(widget.ticket['to']['name'],textAlign: TextAlign.end, style: widget.isColor==null?Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4),

                      )
                    ],
                  )
                ],
              ),
            ),
            /*
            showing the orange part of the card/ticket
             */
            Container(
              color: widget.isColor==null?Styles.orangeColor:Colors.white,//const Color(0xFFF37b67),
              child:Row(
                children: [
                   SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                      color: widget.isColor==null?Colors.grey.shade200:Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    )),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate((constraints.constrainWidth()/15).floor(), (index) =>  SizedBox(
                            width: 5, height: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: widget.isColor==null?Colors.white:Colors.grey.shade300
                              ),
                            ),
                          )),
                        );
                    },

                    ),
                  )),
                   SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(decoration: BoxDecoration(
                      color: widget.isColor==null?Colors.grey.shade200:Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )
                    )),
                  ),

                ],
              ),
            ),
            /*
            showing the bottom part of the orange card/ticket
             */
            Container(
              decoration: BoxDecoration(
                  color: widget.isColor==null?Styles.orangeColor:Colors.white,
                  borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(widget.isColor==null?21:0),
                      bottomRight: Radius.circular(widget.isColor==null?21:0))
              ),
              padding: const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(firstText: widget.ticket['date'],
                          secondText: "Date",
                          alignment: CrossAxisAlignment.start, isColor:widget.isColor),

                      AppColumnLayout(firstText: widget.ticket['departure_time'],
                          secondText: "Departure Time",
                          alignment: CrossAxisAlignment.center, isColor:widget.isColor),

                      AppColumnLayout(firstText: widget.ticket['number'].toString(),
                          secondText: "Seat",
                          alignment: CrossAxisAlignment.end, isColor:widget.isColor),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
