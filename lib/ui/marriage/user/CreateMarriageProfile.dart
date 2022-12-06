
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barsalutemple/ui/marriage/apis/ApisConst.dart';
import 'package:flutter_barsalutemple/ui/marriage/apis/HitAPI.dart';
import 'package:flutter_barsalutemple/ui/marriage/models/ModelUserList.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';
import 'package:flutter_barsalutemple/util/StringUtils.dart';
import 'package:flutter_barsalutemple/util/Utils.dart';
import '../../../util/ColorUtil.dart';

// ignore: must_be_immutable
class CreateMarriageProfile extends StatefulWidget {
  User objUser;

   CreateMarriageProfile({Key key, this.objUser}) : super(key: key);
  @override
  _CreateMarriageProfileState createState() => new _CreateMarriageProfileState();
}

class _CreateMarriageProfileState extends State<CreateMarriageProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _disttList;
  String _selectedDistt;
  String _selectedState;
  User objModelUser;

  @override
  void initState() {
    super.initState();
    resetValues();
    objModelUser = new User();
    if(widget.objUser!=null){
      objModelUser = widget.objUser;
    }


  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: marriageColor,
      key: _scaffoldKey,
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: colorPrimary,

          title: Text(
            'Marriage Profile',
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 24),
          )
      ),

      body: new SafeArea(
          top: false,
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: new Form(
                  key: _formKey,
                  child: new Column(
                    // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: <Widget>[

                      new TextFormField( // Full name
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.account_circle),
                          // hintText: 'Enter your full name',
                          labelText: 'Your Name',
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                        validator: (val) => val.isEmpty ? 'Name is required' : null,
                        onSaved: (val) => objModelUser.username = val,
                      ),

                      new TextFormField( // Father's name
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.assignment_ind),
                          // hintText: 'Enter your father\'s name',
                          labelText: 'Father\'s Name',
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                        validator: (val) => val.isEmpty ? 'Father\'s Name is required' : null,
                        onSaved: (val) => objModelUser.fname = val,
                      ),

                      new TextFormField( // Gotra
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.assignment),
                          // hintText: 'Enter your gotra',
                          labelText: 'Your Gotra',
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(20)],
                        validator: (val) => val.isEmpty ? 'Your Gotra is required' : null,
                        onSaved: (val) => objModelUser.got = val,
                      ),

                      new TextFormField( // Mother's Gotra
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.assignment),
                          // hintText: 'Enter your Mother\'s gotra',
                          labelText: 'Mother\'s Gotra',
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(20)],
                        validator: (val) => val.isEmpty ? 'Mother\'s Gotra is required' : null,
                        onSaved: (val) => objModelUser.mgot = val,
                      ),

                      new TextFormField( // Education
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.menu_book),
                          // hintText: 'Enter your Education',
                          labelText: 'Education',
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(20)],
                        validator: (val) => val.isEmpty ? 'Education is required' : null,
                        onSaved: (val) => objModelUser.education = val,
                      ),

                      new TextFormField( // Profession/Occupation
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.work),
                          // hintText: 'Enter your profession',
                          labelText: 'Profession/Occupation',
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(20)],
                        validator: (val) => val.isEmpty ? 'Profession/Occupation is required' : null,
                        onSaved: (val) => objModelUser.work = val,
                      ),

                      new TextFormField( // Father's profession/Occupation
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.work),
                          // hintText: 'Enter your father\'s profession',
                          labelText: 'Father\'s Profession/Occupation',
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(20)],
                        validator: (val) => val.isEmpty ? 'Father\'s Profession/Occupation is required' : null,
                        onSaved: (val) => objModelUser.fwork = val,
                      ),

                      new TextFormField( // Age
                        decoration: new InputDecoration(
                          icon: const Icon(Icons.calendar_today),
                          // hintText: 'Enter your age',
                          labelText: 'Your Age',
                        ),
                        // controller: _controller,
                        keyboardType: TextInputType.number,
                        validator: (val) => val.isEmpty ? 'Not a valid age' : null,
                        onSaved: (val) => objModelUser.dob = val,
                      ),

                      new TextFormField( // Height
                        decoration: new InputDecoration(
                          icon: const Icon(Icons.accessibility),
                          // hintText: 'Enter your height',
                          labelText: 'Height',
                        ),
                        // controller: _controller,
                        keyboardType: TextInputType.number,
                        validator: (val) => val.isEmpty ? 'Not a valid height' : null,
                        onSaved: (val) => objModelUser.height = val,
                      ),

                      new TextFormField( // Land
                        decoration: new InputDecoration(
                          icon: const Icon(Icons.agriculture),
                          // hintText: 'Enter your land',
                          labelText: 'Land (in Acres)',
                        ),
                        // controller: _controller,
                        keyboardType: TextInputType.number,
                        validator: (val) => val.isEmpty ? 'Not a valid land value' : null,
                        onSaved: (val) => objModelUser.land = val,
                      ),

                      new TextFormField( // Phone number
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.phone),
                          // hintText: 'Enter phone number',
                          labelText: 'Phone',
                        ),
                        keyboardType: TextInputType.phone,
                        /*inputFormatters: [
                          new WhitelistingTextInputFormatter(
                              new RegExp(r'^[()\d -]{1,15}$')),
                        ],*/
                        validator: (value) => isValidPhoneNumber(value)
                            ? null
                            : 'Phone number must be of 10 digits',
                        onSaved: (val) => objModelUser.phonenumber = val,
                      ),

                      new TextFormField( // Village
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.home),
                          // hintText: 'Enter village name',
                          labelText: 'Village',
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(20)],
                        validator: (val) => val.isEmpty ? 'Village Name is required' : null,
                        onSaved: (val) => objModelUser.village = val,
                      ),

                      new FormField<String>( // State
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.account_balance),
                              labelText: 'State',
                              errorText: state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _selectedState == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                value: _selectedState,
                                isDense: true,
                                onChanged: (String newValue) {
                                  setState(() {
                                    objModelUser.state = newValue;
                                    resetValues();
                                    _selectedState = newValue;
                                    if(_selectedState == 'Haryana'){
                                      _disttList = StringUtils.haryanaDistrictsList;
                                    }else if(_selectedState == 'Uttar Pradesh'){
                                      _disttList = StringUtils.upDistrictsList;
                                    }else if(_selectedState == 'Uttarakhand'){
                                      _disttList = StringUtils.ukDistrictsList;
                                    }
                                    state.didChange(newValue);
                                    FocusScope.of(context).unfocus();
                                  });
                                },
                                items: StringUtils.statesList.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return (val == null || val == 'Select state') ? 'Please select a State' : null;
                        },
                      ),

                      new FormField<String>( // District
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.account_balance),
                              labelText: 'District',
                              errorText: state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _selectedDistt == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                value: _selectedDistt,
                                isDense: true,
                                onChanged: (String newValue) {
                                  setState(() {
                                    objModelUser.district = newValue;
                                    _selectedDistt = newValue;
                                    state.didChange(newValue);
                                    FocusScope.of(context).unfocus();
                                  });
                                },
                                items: _disttList.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return (val == null || val == 'Select district') ? 'Please select a District' : null;

                        },
                      ),


                      new Container( // Submit
                          padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                          child: new RaisedButton(
                            child: const Text('Submit'),
                            onPressed: _submitForm,
                          )),
                    ],
                  )),
            ),
          )),
    );
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event
      saveProfileApi(); // Call save profile api
      print('Form save called, newContact is now up to date...');
    }
  }

  void resetValues() {
    _disttList = <String>[ 'Select district'];
    _selectedDistt = 'Select district';
    _selectedState = 'Select state';
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  bool isValidPhoneNumber(String input) {
    // final RegExp regex = new RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

  saveProfileApi() async{
    var param = {
      keyPhoneNumber : objModelUser.phonenumber,
      keyUsername : objModelUser.username,
      keyHeight : objModelUser.height,
      keyDob : objModelUser.dob,
      keyGot : objModelUser.got,
      keyEducation : objModelUser.education,
      keyWork : objModelUser.work,
      keyFname : objModelUser.fname,
      keyFnumber : objModelUser.phonenumber,
      keyFwork : objModelUser.fwork,
      keyMgot : objModelUser.mgot,
      keyVillage : objModelUser.village,
      keyDistrict : objModelUser.district,
      keyState : objModelUser.state,
      keyLand : objModelUser.land
    };
    var response = await myPost(apiSaveProfileInformation, param,context: context);
    if(response!=null){
      if(response['success'] == true){
        Utils.showMesageDialog(context, 'Marriage Profile', 'Your marriage profile has been created.');
      }else{
        showBottomMsg(context,response['message']);
      }
    }else{
      showBottomMsg(context, "Network error. Please try again");
    }
  }

}