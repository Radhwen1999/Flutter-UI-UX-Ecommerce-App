import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muapp6/wigets/small_text.dart';

import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
          font: "pacificio",
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
                children: List.generate(
                    5,
                        (index) => Icon(
                      Icons.star,
                      color: Colors.purpleAccent,
                      size: 15,
                    ))),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "80"),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "commentaires"),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle,
                text: "Normale",
                color: Colors.black54,
                iconColor: Colors.orangeAccent),

            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1 km",
                color: Colors.black54,
                iconColor: Colors.blueAccent),

            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "30 mn",
                color: Colors.black54,
                iconColor: Colors.redAccent),
          ],
        )
      ],
    );
  }
}
