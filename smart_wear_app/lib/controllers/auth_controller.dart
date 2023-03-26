// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:smart_wear/core/app_export.dart';
// import 'package:smart_wear/presentation/home_screen/home_screen.dart';

// import '../core/utils/showSnackbar.dart';
// import '../core/utils/utils.dart';

// class AuthProvider {
//   final FirebaseAuth _auth;

//   AuthProvider(this._auth);

//   // FOR EVERY FUNCTION HERE
//   // POP THE ROUTE USING:
//   //Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

//   // GET USER DATA
//   // using null check operator since this method should be called only
//   // when the user is logged in

//   User get user => _auth.currentUser!;

//   // STATE PERSISTENCE STREAM
//   Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
//   // OTHER WAYS (depends on use case):
//   // Stream get authState => FirebaseAuth.instance.userChanges();
//   // Stream get authState => FirebaseAuth.instance.idTokenChanges();
//   // KNOW MORE ABOUT THEM HERE: https://firebase.flutter.dev/docs/auth/start#auth-state

//   bool isAuthenticated() {
//     return _firebaseAuth.currentUser != null;
//   }

//   UserCredential? authResult;

//   // Return true if user is logged in, else false
//   bool isLoggedIn() {
//     User? user = _auth.currentUser;
//     return user != null;
//   }

// // EMAIL LOGIN
//   Future<void> loginWithEmail({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: ((context) => HomeScreen()),
//         ),
//       );
//       // if (!user.emailVerified) {
//       //   await sendEmailVerification(context);
//       //   // restrict access to certain things using provider
//       //   // transition to another page instead of home screen
//       // }
//     } on FirebaseAuthException catch (e) {
//       String errorMessage;
//       switch (e.code) {
//         case 'invalid-email':
//           errorMessage = 'Invalid email address format.';
//           break;
//         case 'user-not-found':
//           errorMessage =
//               'Email address not found. Please check your email and try again.';
//           break;
//         case 'wrong-password':
//           errorMessage = 'Incorrect password. Please try again.';
//           break;
//         default:
//           errorMessage =
//               'An error occurred while logging in. Please try again later.';
//       }
//       showSnackBar(context, errorMessage);
//     }
//   }

//   // EMAIL VERIFICATION
//   Future<void> sendEmailVerification(BuildContext context) async {
//     try {
//       _auth.currentUser!.sendEmailVerification();
//       showSnackBar(context, 'Email verification sent!');
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!); // Display error message
//     }
//   }

//   // EMAIL SIGN UP - Create a User
//   Future<void> signUpWithEmail({
//     required String email,
//     required String username,
//     required String password,
//     required BuildContext context,
//   }) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(authResult?.user!.uid)
//           .set({
//         'username': username,
//         'email': email,
//       });

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: ((context) => HomeScreen()),
//         ),
//       );
//       // await sendEmailVerification(context);
//     } on FirebaseAuthException catch (e) {
//       // if you want to display your own custom error message
//       String errorMessage = 'An error occurred. Try again.';
//       if (e.code == 'weak-password') {
//         errorMessage = 'The password provided is too weak.';
//       } else if (e.code == 'email-already-in-use') {
//         errorMessage = 'The account already exists for that email.';
//       }
//       showSnackBar(
//           context, errorMessage); // Displaying the usual firebase error message
//     }
//   }

//   Future<void> resetPassword(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } on FirebaseAuthException catch (e) {
//       String errorMessage;
//       switch (e.code) {
//         case 'user-not-found':
//           errorMessage = 'The email address you entered is not registered.';
//           break;
//         case 'invalid-email':
//           errorMessage = 'The email address you entered is invalid.';
//           break;
//         default:
//           errorMessage = 'An error occurred while resetting your password.';
//       }
//       throw errorMessage;
//     } catch (e) {
//       throw 'An error occurred while resetting your password.';
//     }
//   }

//   Future<void> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;

//       if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
//         // Create a new credential
//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth?.accessToken,
//           idToken: googleAuth?.idToken,
//         );
//         UserCredential userCredential =
//             await _auth.signInWithCredential(credential);

//         if (userCredential.additionalUserInfo!.isNewUser) {
//           final user = userCredential.user;
//           await FirebaseFirestore.instance
//               .collection('users')
//               .doc(user!.uid)
//               .set({
//             'name': user.displayName,
//             'email': user.email,
//           });
//         }

//         // if you want to do specific task like storing information in firestore
//         // only for new users using google sign in (since there are no two options
//         // for google sign in and google sign up, only one as of now),
//         // do the following:

//         // if (userCredential.user != null) {
//         //   if (userCredential.additionalUserInfo!.isNewUser) {}
//         // }
//       }
//     } on FirebaseAuthException catch (e) {
//       String errorMessage;
//       switch (e.code) {
//         case 'invalid-credential':
//           errorMessage = 'The credential provided is invalid or has expired.';
//           break;
//         case 'operation-not-allowed':
//           errorMessage = 'Google sign-in is not allowed for this project.';
//           break;
//         case 'user-disabled':
//           errorMessage =
//               'The user account has been disabled by an administrator.';
//           break;
//         default:
//           errorMessage = 'An error occurred while signing in with Google.';
//       }
//       throw errorMessage; // Displaying the error message
//     }
//   }

//   GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<void> signOutFromGoogle() async {
//     try {
//       await _googleSignIn.signOut();
//     } catch (e) {
//       String errorMessage = "Error Occured.";
//       throw errorMessage;
//     }
//   }

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future<void> signOutFromFirebase() async {
//     try {
//       await _firebaseAuth.signOut();
//     } catch (e) {
//       String errorMessage = "Error Occured.";
//       throw errorMessage;
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       String errorMessage = "Error Occured.";
//       throw errorMessage;
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../controllers/session_controller.dart';
import '../../core/utils/utils.dart';
import '../routes/app_routes.dart';

class AuthController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection('users');
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void signup(BuildContext context, String username, String email,
      String password) async {
    setLoading(true);
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        // to Maintain the Session
        SessionController().userId = value.user!.uid.toString();
        // Saving the user Extra Information
        userRef.doc(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': value.user!.uid.toString(),
          'userName': username,
          'profile': '',
          'Name': ''
        }).then((value) {
          setLoading(false);
          Navigator.pushNamed(context, AppRoutes.homeScreen);
          Utils().toastMessage('User created successfully.');
        });
      });
    } on FirebaseAuthException catch (e) {
      // if you want to display your own custom error message
      String errorMessage = 'An error occurred. Try again.';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      Utils().toastMessage(errorMessage);
      setLoading(false);
    } catch (e) {
      String errorMessage = 'An error occurred. Try again.';
      Utils().toastMessage(errorMessage);
      setLoading(false);
    }
  }

  void login(BuildContext context, String email, String password) async {
    setLoading(true);
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        // to Maintain the Session
        SessionController().userId = value.user!.uid.toString();
        setLoading(false);
        Navigator.pushNamed(context, AppRoutes.homeScreen);
        Utils().toastMessage('User logged in successfully.');
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'Invalid email address format.';
          break;
        case 'user-not-found':
          errorMessage =
              'Email address not found. Please check your email and try again.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.';
          break;
        default:
          errorMessage =
              'An error occurred while logging in. Please try again later.';
      }
      Utils().toastMessage(errorMessage);
      setLoading(false);
    } catch (e) {
      String errorMessage = 'An error occurred. Try again.';
      Utils().toastMessage(errorMessage);
      setLoading(false);
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await auth.signOut();
      SessionController().userId = '';
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.signInOneScreen, (route) => false);
    } catch (e) {
      String errorMessage = "Error Occured.";
      Utils().toastMessage(errorMessage);
    }
  }

  void forgotPassword(BuildContext context, String email) async {
    setLoading(true);
    try {
      await auth
          .sendPasswordResetEmail(
        email: email,
      )
          .then((value) {
        setLoading(false);
        Navigator.pushNamed(context, AppRoutes.signInOneScreen);
        Utils()
            .toastMessage('Please check your email to recover your password.');
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'The email address you entered is not registered.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address you entered is invalid.';
          break;
        default:
          errorMessage = 'An error occurred while resetting your password.';
      }
      Utils().toastMessage(errorMessage);
      setLoading(false);
    } catch (e) {
      String errorMessage = 'An error occurred. Try again.';
      Utils().toastMessage(errorMessage);
      setLoading(false);
    }
  }
}
