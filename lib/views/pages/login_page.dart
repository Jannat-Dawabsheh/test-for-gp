import 'package:flutter/material.dart';
import 'package:project_test/utils/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailControler;
  late final TextEditingController _passwordControler;
  late FocusNode _emailFocusNode, _passwordFocusNode;
  String? _email, _password;
  bool visibility = false;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailControler = TextEditingController();
    _passwordControler = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailControler.dispose();
    _passwordControler.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: MediaQuery.sizeOf(context).width*0.4,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Welcome Back",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Please, login with registered account!",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppColors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      TextFormField(
                        controller: _emailControler,
                        onChanged: (value) => _email = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          _emailFocusNode.unfocus();
                          FocusScope.of(context).requestFocus(_passwordFocusNode);
                        },
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          prefixIcon: const Padding(
                            padding:  EdgeInsets.only(left: 20, right: 5),
                            child:  Icon(Icons.email_outlined),
                          ),
                          prefixIconColor: AppColors.grey,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color:AppColors.grey4, width: 1.0),
                            ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(color:AppColors.primary, width: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _passwordControler,
                        onChanged: (value) => _password = value,
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          _passwordFocusNode.unfocus();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          } else {
                            return null;
                          }
                        },
                        obscureText: !visibility,
                        decoration: InputDecoration(
                          
                          hintText: "Password",
                          prefixIcon: const Padding(
                            padding:  EdgeInsets.only(left: 20, right:5 ),
                            child:  Icon(Icons.password),
                          ),
                          prefixIconColor: AppColors.grey,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                visibility = !visibility;
                              });
                            },
                            child: Icon(visibility
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          suffixIconColor: AppColors.grey,

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color:AppColors.grey4, width: 1.0),
                            ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(color:AppColors.primary, width: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "forget password?",
                            style:
                                Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: AppColors.primary,
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: AppColors.white,
                                ),
                                child: Text(
                                  "login",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600
                                        )
                                ),
                        ),
                      ),
                      
                      const SizedBox(
                        height: 16,
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don\'t have an account?",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppColors.grey,
                                  )),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppColors.primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }
}