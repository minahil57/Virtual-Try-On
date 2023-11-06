import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/complete_profile_controller.dart';
import '../../core/text_styles.dart';
import '../../widgets/custom_TextField.dart';
import '../../widgets/custom_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CompleteProfile extends StatefulWidget {
  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  CompleteProfileController ProfileController = Get.put(CompleteProfileController());

  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  String fullNumber = '';

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'PK');

    setState(() {
      this.number = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:SingleChildScrollView(
            child:Padding(
              padding: EdgeInsets.only(top: 100,),

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child:
                      Text(
                        'Complete Your Profile',
                        textAlign: TextAlign.center,
                        style: globalTextStyle(
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Center(
                      child:
                      Text(
                        'Do not worry, only you can see your personal\n data. No one else will be able to see it',
                        textAlign: TextAlign.center,
                        style: globalTextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
          Center(
            child:
          Stack(
            children: [
              const CircleAvatar(
                radius: 50, // Adjust the size of the avatar as needed
                backgroundColor: Colors.blue, // Background color of the avatar
                backgroundImage: AssetImage('assets/images/apple.png'), // Replace with your image URL
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Handle the action to change the profile picture here
                  },
                ),
              ),
            ],
          ),
          ),
                    SizedBox(height: 20.h),
                    Form(
                      key:  ProfileController.formkey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Padding(padding: EdgeInsets.only(left: 20),
                              child:
                              Text(
                                'Name',
                                textAlign: TextAlign.center,
                                style: globalTextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                child:
                                NameInputTextFieldWidget(ProfileController.nameController, 'John Doe')),
                            SizedBox(height: 20.h),
                            Padding(padding: EdgeInsets.only(left: 20,right: 20),
                              child:
                              Text(
                                'Phone Number',
                                textAlign: TextAlign.center,
                                style: globalTextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            Padding(padding:  EdgeInsets.only(left: 20,right: 20),
                                child:InternationalPhoneNumberInput(
                                  maxLength: 12,
                                  spaceBetweenSelectorAndTextField: 0,
                                  onInputChanged: (PhoneNumber number) {
                                    // You can handle input changes here if needed

                                  },
                                  onInputValidated: (bool value) {
                                    // You can handle validation here if needed
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle: TextStyle(color: Colors.black),
                                  initialValue: number,
                                  textFieldController: ProfileController.phoneController,
                                  formatInput: true,
                                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                                  inputBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Theme.of(context).colorScheme.surface,
                                    ),
                                  ),
                                  onSaved: (PhoneNumber number) {
                                    setState(() {
                                      String dialCode = number.dialCode ?? ""; // Get the dial code
                                      String phoneNumber = number.phoneNumber ?? ""; // Get the phone number
                                      fullNumber = dialCode + phoneNumber; // Concatenate them
                                      ProfileController.nameController.text = fullNumber;
                                      print(ProfileController.nameController);
                                      print('On Saved: $fullNumber');
                                    });
                                    // Concatenate dial code and phone number and save it to the controller
                                    // Save it to the controller

                                  },
                                )

                            ),

                            DropDownTextField(
                              // initialValue: "name4",
                              //controller: _cnt,
                              clearOption: true,
                              // enableSearch: true,
                              // dropdownColor: Colors.green,
                              searchDecoration: const InputDecoration(
                                  hintText: "enter your custom hint text here"),
                              validator: (value) {
                                if (value == null) {
                                  return "Required field";
                                } else {
                                  return null;
                                }
                              },
                              dropDownItemCount: 3,

                              dropDownList: const [
                                DropDownValueModel(name: 'name1', value: "value1"),
                                DropDownValueModel(name: 'name3', value: "value3"),
                                DropDownValueModel(name: 'name5', value: "value5"),
                              ],
                              onChanged: (val) {},
                            ),

                          ]
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Center(
                      child:
                      CustomButton(
                          text: 'Complete Profile',
                          width: Get.width*0.7.w,
                          onPressed: (){
                            print('Pressd Button');
                          }),),
                    SizedBox(height: 20.h),

                  ]
              ),
            )
        )
    );
  }
}
class CircularLogoContainer extends StatelessWidget {
  final String logoPath;

  CircularLogoContainer(this.logoPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Adjust the size of the circular container as needed
      height:60,
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Makes it a circular container
        border: Border.all(
          color: Colors.black, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: ClipOval(
        child: Container(
          //color: Colors.grey, // Background color for the circular container
          child: Center(
            child: Image.asset(
              logoPath,
              width: 40, // Adjust the size of the logo as needed
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}