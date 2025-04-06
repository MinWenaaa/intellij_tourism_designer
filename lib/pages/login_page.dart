import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/constants/theme.dart';
import 'package:intellij_tourism_designer/pages/register_page.dart';
import 'package:intellij_tourism_designer/route_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import '../models/global_model.dart';
import 'desktop_page.dart';
import 'dart:ui';

//登录界面

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool login = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _userName = "";
  String _passWord = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/imgs/login_background.png"), fit: BoxFit.cover)
          //color: Color(0xffbcbece)
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Flexible(flex: 3, child: Container()),
            Flexible(flex: 2, child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
                child: Container(
                  decoration: BoxDecoration(color: const Color(0x33fafffa),
                      border: Border(left: BorderSide(color: Color(0x77ffffff), width: 1.0))
                  ),
                  alignment: Alignment.center,
                  child: SizedBox( width: 360,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/imgs/logo.png')),
                        SizedBox(height: 30),
                        _commonInput(controller: _usernameController,  lableText: "账号"),
                        _commonInput(controller: _passwordController,  lableText: "密码"),
                        const SizedBox(height: 30),
                        OutlinedButton(onPressed: () async {
                          bool flag = await Provider.of<GlobalModel>(context,listen: false).Login(name: _usernameController.text, password: _passwordController.text);
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DeskTopPage()));
                          }, child: Container(
                          color: Colors.teal,
                          child: Text("登录")
                        ),

                        ),
/*                        _Button1( content: "登录",
                          callBack: () {
                            //Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          }
                        ),*/
                        const SizedBox(height: 20),
                        _Button2(content: "没有账号？去注册",
                          //callBack: (){}
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Future<void> SignUp() async {

  }

  Widget _commonInput({required TextEditingController controller,
    required String lableText}){
    return SizedBox(
      width: 280,
      child: TextField(
        controller: controller,
        style: const TextStyle(color: AppColor.deepSecondary, fontSize: 14),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.secondary),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.deepSecondary),
            ),
            labelText: lableText,
            labelStyle: const TextStyle(color: AppColor.deepSecondary)
        ),
      ),
    );
  }

  Widget _Button1({required String content, /*required void Function() callBack*/}) {
    return InkWell(
      child: Container(
          width: 280, height: 48, alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Color(0xff163216)
          ),
          child: Text(content, style: TextStyle(color: Color(0xfffafffa),),)
      ),
      //onTap: callBack,
    );
  }

  Widget _Button2({required String content, /*required void Function() callBack*/}) {
    return InkWell(
      child: Container(
        width: 280, height: 48, alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: Color(0xfffafffa)
        ),
        child: Text(content, style: TextStyle(color: Color(0xff163216),),),
      ),
      //onTap: callBack,
    );
  }
}