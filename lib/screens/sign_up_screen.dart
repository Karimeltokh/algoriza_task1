import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/componants/componants.dart';
import 'package:task1/screens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading:const Padding(
          padding:  EdgeInsets.all(8.0),
          child:  CircleAvatar(backgroundColor: Colors.black,child: Icon(Icons.arrow_back_ios_rounded)),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
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
              height: 150,
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
                          'Register',
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
                      keyboardType: TextInputType.emailAddress,
                      decoration:  const InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'Eg.example@email.com',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10,),
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
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.text,
                      decoration:  const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Password',
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        border: OutlineInputBorder(),
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
                          'Register',
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
                          'Has any account?',
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(context,const LoginScreen());
                          },
                          child: const Text(
                            'Sign in Here',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    const  Center(
                       child: Text('By regestering your account you agree to our',
                        style: TextStyle(fontSize: 15),
                    ),
                     ),
                    const SizedBox(height: 10,),
                    const  Center(
                      child: Text('terms and conditions',
                        style: TextStyle(fontSize: 15,color: Colors.blue),
                      ),
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
