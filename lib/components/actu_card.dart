import 'package:flutter/material.dart';
import 'package:green_wallet/models/Actuality.dart';
import 'package:green_wallet/screens/details/details_actu.dart';

class ActuCard extends StatelessWidget {
  const ActuCard({
    Key key,
    //Taille du box
    this.width = 20,
    @required this.press,
    @required this.actuality,
  }) : super(key: key);

  final double width;
  //, aspectRetio;
  final Actuality actuality;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(40.0, 15.0, 20.0, 5.0),
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xFFf5fcf2),
              borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                DetailsActuScreen.routeName,
                arguments: ActuDetailsArguments(actuality: actuality),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120.0,
                        child: Text(
                          actuality.title,
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(actuality.categorie,
                      style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10.0),
                  Text(actuality.content.substring(0, 64),
                      style: TextStyle(color: Colors.grey), maxLines: 3),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20.0,
          top: 15.0,
          bottom: 5.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              width: 110.0,
              image: AssetImage(actuality.images[0]),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
