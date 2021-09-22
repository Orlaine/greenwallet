import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_wallet/screens/profile/components/avatar.dart';

import '../../../constants.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
    this.avatarUrl,
  }) : super(key: key);
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 100,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Avatar(),
          /* avatarUrl == null
              ? CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Color(0xFFFeeefee),
                  //backgroundColor: Colors.green,
                  backgroundImage: AssetImage("assets/images/account_i.png"),
                  //child: SvgPicture.asset("assets/images/account.png"),
                )
              : CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(avatarUrl),
                ), */
          /*  CircleAvatar(
            backgroundColor: Color(0xFFFeeefee),
            backgroundImage: AssetImage("assets/images/account.png"),
          ), */
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
 
/* import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  ProfilePic({Key key}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFFFeeefee),
            backgroundImage:
                //_imageFile == null
                //?
                AssetImage("assets/images/account.png"),
            //  : FileImage(File(_imageFile.path)),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet()),
                  );
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}  */
