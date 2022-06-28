import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/componants/componants.dart';
import 'package:task1/screens/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/Untitled1.png')
                )
              ),
              height: 250,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to fashion daily',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: const[
                         Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         Spacer(),
                         Text(
                          'help',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.blue
                          ),
                        ),
                        Icon(Icons.help,color: Colors.blue,)
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration:  InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Eg 8123456789',
                        prefixIcon: CountryCodePicker(
                          showFlagDialog: false,
                          showFlag: false,
                          initialSelection: 'IT',
                          alignLeft: false,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      width: double.infinity,
                      height: 60,
                      child: MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Center(
                       child: Text(
                        'Or',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                    ),
                     ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blue,
                          width: 1
                        ),
                      ),
                      child: const Center(child:  Text('Sign in with google'),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(context,const SignUpScreen());
                          },
                          child: const Text(
                            'Register Here',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    const Text('Use the application according to Policy rules.Any kinds of violation will be subject to sanction ',
                    textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}