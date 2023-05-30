import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'string_extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  // TextFields controllers

  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  // Password TextField Variables

  var passwordHelperTextColor = const Color.fromARGB(150, 0, 0, 0);
  var passwordHelperText = 'Required*';
  bool strongPasswordConfirmation = false;
  String? passwordErrorText;

  bool canConfirmPasswordTFFEnable = false;

  var passwordSuffixIcon = Icons.remove_red_eye_rounded;

  var passwordPrefixIcon = Icons.lock_outline_rounded;

  var confirmPasswordPrefixIcon = Icons.lock_outline_rounded;
  var confirmPasswordSuffixIcon = Icons.remove_red_eye_rounded;

  var passwordObscureText = true;
  var confirmPasswordObscureText = true;

  late FocusNode confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordFocusNode = FocusNode();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Form(
            key: formGlobalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: screenHeight * 0.08,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.07,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: screenWidth * 0.15,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(97, 255, 138, 117),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(40, 48, 70, 96),
                                blurRadius: 10,
                                spreadRadius: 3)
                          ]),
                      child: SizedBox(
                        width: screenWidth * 0.1,
                        height: screenHeight * 0.03,
                        child: const FittedBox(
                          child: Text(
                            'CAS',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 48, 70, 96),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                      height: screenHeight * 0.07,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.15,
                          height: screenHeight * 0.03,
                          child: const FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Color.fromARGB(255, 48, 70, 96),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.6,
                          height: screenHeight * 0.03,
                          child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              'Enter Your Credentials To Continue',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 48, 70, 96),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                SizedBox(
                  width: screenWidth * 0.85,
                  child: TextFormField(
                    validator: nameValidator,
                    autofocus: true,
                    keyboardAppearance: Brightness.light,
                    keyboardType: TextInputType.name,
                    cursorRadius: const Radius.circular(20),
                    cursorColor: const Color.fromARGB(255, 48, 70, 96),
                    decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: const TextStyle(color: Colors.grey),
                        helperMaxLines: 1,
                        helperText: 'Required*',
                        prefixIcon: const Icon(
                          Icons.person_outlined,
                          color: Color.fromARGB(255, 48, 70, 96),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.error)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.error)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 236, 197, 191),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 236, 197, 191),
                            ))),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SizedBox(
                  width: screenWidth * 0.85,
                  child: TextFormField(
                    validator: emailValidator,
                    keyboardType: TextInputType.emailAddress,
                    cursorRadius: const Radius.circular(20),
                    cursorColor: const Color.fromARGB(255, 48, 70, 96),
                    decoration: InputDecoration(
                        errorMaxLines: 2,
                        hintText: 'Email Address',
                        hintStyle: const TextStyle(color: Colors.grey),
                        helperMaxLines: 1,
                        helperText: 'Required*',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Color.fromARGB(255, 48, 70, 96),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.error)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.error)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 236, 197, 191),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 236, 197, 191),
                            ))),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SizedBox(
                  width: screenWidth * 0.85,
                  child: TextFormField(
                    obscuringCharacter: '~',
                    obscureText: passwordObscureText,
                    controller: passwordController,
                    onChanged: passwordOnChange,
                    keyboardType: TextInputType.visiblePassword,
                    cursorRadius: const Radius.circular(20),
                    cursorColor: const Color.fromARGB(255, 48, 70, 96),
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: passwordSuffixIconOnTap,
                            child: Icon(
                              passwordSuffixIcon,
                              color: Colors.grey,
                            )),
                        errorText: passwordErrorText,
                        helperMaxLines: 1,
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        helperText: passwordHelperText,
                        helperStyle: TextStyle(color: passwordHelperTextColor),
                        prefixIcon: Icon(
                          passwordPrefixIcon,
                          color: const Color.fromARGB(255, 48, 70, 96),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.error)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.error)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 236, 197, 191),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 236, 197, 191),
                            ))),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SizedBox(
                  width: screenWidth * 0.85,
                  child: TextFormField(
                    focusNode: confirmPasswordFocusNode,
                    obscuringCharacter: '~',
                    obscureText: confirmPasswordObscureText,
                    enabled: canConfirmPasswordTFFEnable,
                    controller: confirmPasswordController,
                    validator: confirmPasswordValidator,
                    keyboardType: TextInputType.visiblePassword,
                    cursorRadius: const Radius.circular(20),
                    cursorColor: const Color.fromARGB(255, 48, 70, 96),
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: confirmPasswordSuffixIconOnTap,
                            child: Icon(
                              confirmPasswordSuffixIcon,
                              color: Colors.grey,
                            )),
                        hintText: 'Confirm password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        helperMaxLines: 1,
                        helperText: 'Required*',
                        prefixIcon: Icon(
                          confirmPasswordPrefixIcon,
                          color: const Color.fromARGB(255, 48, 70, 96),
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.error)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.error)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 236, 197, 191),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 236, 197, 191),
                            ))),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.035,
                ),
                InkWell(
                  onTap: btnSignUpOnTap,
                  child: Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.07,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(195, 255, 138, 117),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(40, 48, 70, 96),
                              blurRadius: 10,
                              offset: Offset(2, 3),
                              spreadRadius: 5)
                        ]),
                    child: SizedBox(
                      width: screenWidth * 0.18,
                      height: screenHeight * 0.03,
                      child: const FittedBox(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 48, 70, 96),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.03,
                      child: const FittedBox(
                        child: Text(
                          'Already registered?',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 48, 70, 96),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.01,
                    ),
                    SizedBox(
                      width: screenWidth * 0.13,
                      height: screenHeight * 0.03,
                      child: const FittedBox(
                        child: InkWell(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 48, 70, 96),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.18,
                  child: const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://img.freepik.com/free-vector/hand-drawn-man-working-from-home_23-2148818123.jpg?w=740&t=st=1682687077~exp=1682687677~hmac=59f06aa529e073e17bb55eacba5afe1c17ba4a08491e54f26b49d2d4141e4fab')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void btnSignUpOnTap() {
    bool? isValid = formGlobalKey.currentState?.validate();

    if (passwordErrorText == null && isValid == true) {
      FocusScope.of(context).unfocus(disposition: UnfocusDisposition.scope);
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Sign Up successfully.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Your registration has been completed',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(195, 255, 138, 117))),
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'))
          ],
        ),
      );
    }

    if (!(passwordController.text.isNotNullNotEmpty())) {
      setState(() {
        passwordErrorText = 'Required*';
      });
    } else if (passwordController.text.isContainsSpace()) {
      setState(() {
        passwordErrorText = 'Space Not Allowed';
      });
    } else if (passwordController.text.length < 6) {
      setState(() {
        passwordErrorText = 'Must between 6 and 30 characters.';
      });
    } else if (!strongPasswordConfirmation) {
      setState(() {
        passwordErrorText = 'Use strong password (i.e. Ak123@)';
      });
    } else {
      canConfirmPasswordTFFEnable = true;
    }
  }

  String? nameValidator(String? value) {
    if (!(value.isNotNullNotEmpty())) {
      return 'Required*';
    } else if (!(value.isValidName())) {
      return 'Enter valid name.';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (!(value.isNotNullNotEmpty())) {
      return 'Required*';
    } else if (!(value.isValidStructuredEmail())) {
      return 'Invalid email.';
    } else if (value!.length < 16 && !(value.isValidCharEmail())) {
      return 'Must between 6 and 30 following letters(a-z), number (0-9), period(.)';
    } else if (value.length < 16) {
      return 'Must between 6 and 30 characters.';
    } else if (!(value.isValidCharEmail())) {
      return 'Only letters(a-z), number (0-9), period(.) are allowed.';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidator(String? value) {
    if (canConfirmPasswordTFFEnable) {
      if (!(value.isNotNullNotEmpty())) {
        return 'Required*';
      } else if (confirmPasswordController.text != passwordController.text) {
        return 'Confirmation failed!';
      }
    } else {
      return null;
    }
  }

  void passwordOnChange(String value) {
    setState(() {
      passwordErrorText = null;
      if (value.isEmpty) {
        passwordHelperText = 'Required*';
        canConfirmPasswordTFFEnable = false;

        passwordHelperTextColor = const Color.fromARGB(150, 0, 0, 0);
      } else if (value.isContainsSpace()) {
        passwordHelperText = 'Space Not Allowed';
        canConfirmPasswordTFFEnable = false;
        passwordHelperTextColor = Theme.of(context).colorScheme.error;
      } else if (!(value.isMinimumRequiredLength())) {
        passwordHelperText = 'Must between 6 and 15 characters.';
        canConfirmPasswordTFFEnable = false;
        passwordHelperTextColor = Theme.of(context).colorScheme.error;
      } else if (value.isAlphabeticValue() &&
          value.isSpecialCharacter() &&
          value.isNumericValue()) {
        passwordHelperText = 'Strong password.';
        canConfirmPasswordTFFEnable = true;
        passwordHelperTextColor = Colors.green.shade400;
        strongPasswordConfirmation = true;
      } else if (value.isAlphabeticValue() && value.isNumericValue() ||
          value.isAlphabeticValue() && value.isSpecialCharacter() ||
          value.isNumericValue() && value.isSpecialCharacter()) {
        passwordHelperText = 'Normal password!';
        canConfirmPasswordTFFEnable = false;

        passwordHelperTextColor = Colors.orange;
        strongPasswordConfirmation = false;
      } else if (value.isAlphabeticValue() || value.isNumericValue()) {
        passwordHelperText = 'Week password!';
        canConfirmPasswordTFFEnable = false;
        passwordHelperTextColor = Theme.of(context).colorScheme.error;
        strongPasswordConfirmation = false;
      }
    });
  }

  void passwordSuffixIconOnTap() {
    setState(() {
      if (passwordSuffixIcon == Icons.visibility_off) {
        passwordSuffixIcon = Icons.visibility;
        passwordPrefixIcon = Icons.lock_outline;
        passwordObscureText = true;
      } else {
        passwordSuffixIcon = Icons.visibility_off;
        passwordPrefixIcon = Icons.lock_open_rounded;
        passwordObscureText = false;
      }
    });
  }

  void confirmPasswordSuffixIconOnTap() {
    setState(() {
      if (confirmPasswordSuffixIcon == Icons.visibility_off) {
        confirmPasswordSuffixIcon = Icons.visibility;
        confirmPasswordPrefixIcon = Icons.lock_outline;
        confirmPasswordObscureText = true;
      } else {
        confirmPasswordSuffixIcon = Icons.visibility_off;
        confirmPasswordPrefixIcon = Icons.lock_open_rounded;
        confirmPasswordObscureText = false;
      }
    });
  }
}
