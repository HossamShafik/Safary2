import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication{


 final FirebaseAuth auth = FirebaseAuth.instance;
 final FacebookLogin fbLogin=FacebookLogin();

  Future signUp(String username,String password)async{

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: username,
          password: password,

      );
      return userCredential;
  }

 Future login(String username,String password)async{
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: username,
        password: password
    );
    return userCredential;
  }

 Future forgetPassword(String username)async{

    auth.sendPasswordResetEmail(
        email: username, )
        .catchError((onError) => print('Error sending email verification $onError'))
        .then((value) => print('Successfully sent email verification'));

  }

  signOut(){
    auth.signOut();
  }

 Future<UserCredential> signInWithGoogle() async {
   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

   final GoogleAuthCredential credential = GoogleAuthProvider.credential(
     accessToken: googleAuth.accessToken,
     idToken: googleAuth.idToken,
   );
   return await auth.signInWithCredential(credential);
 }




 Future loginWithfacebook(FacebookLoginResult result) async {
   final FacebookAccessToken accessToken = result.accessToken;
   AuthCredential credential =
   FacebookAuthProvider.credential(accessToken.token);
   return await auth.signInWithCredential(credential);

 }


Future handleLogin()async{
    FacebookLoginResult _result= await fbLogin.logIn(["email"]);
    switch(_result.status){

      case FacebookLoginStatus.loggedIn:
        try {
         return await loginWithfacebook(_result);
        } catch (e) {
          print(e.message);
        }
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("user cancel login");
        return null;
        break;
      case FacebookLoginStatus.error:
        print("${_result.errorMessage}");
        break;
    }

}


  currentUser()  {
    User user =  auth.currentUser;
    return user != null ? user.uid : null;
  }


}