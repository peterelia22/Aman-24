import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ar.dart';
import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get greeting;

  /// No description provided for @reportButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Submit new report'**
  String get reportButtonTitle;

  /// No description provided for @reportButtonDiscription.
  ///
  /// In en, this message translates to:
  /// **'You can submit a new report'**
  String get reportButtonDiscription;

  /// No description provided for @reportButtonDiscriptionContinue.
  ///
  /// In en, this message translates to:
  /// **'easily and quickly'**
  String get reportButtonDiscriptionContinue;

  /// No description provided for @quickOptions.
  ///
  /// In en, this message translates to:
  /// **'Quick options'**
  String get quickOptions;

  /// No description provided for @myReports.
  ///
  /// In en, this message translates to:
  /// **'My Reports'**
  String get myReports;

  /// No description provided for @securityTips.
  ///
  /// In en, this message translates to:
  /// **'Security Tips'**
  String get securityTips;

  /// No description provided for @emergencyNumbers.
  ///
  /// In en, this message translates to:
  /// **'Emergency Numbers'**
  String get emergencyNumbers;

  /// No description provided for @ministryAwareness.
  ///
  /// In en, this message translates to:
  /// **'Ministry Awareness'**
  String get ministryAwareness;

  /// No description provided for @cyberFraudWarning.
  ///
  /// In en, this message translates to:
  /// **'Cyber Fraud Warning'**
  String get cyberFraudWarning;

  /// No description provided for @cyberFraudWarningContinue.
  ///
  /// In en, this message translates to:
  /// **'Protect yourself from cybercrime,'**
  String get cyberFraudWarningContinue;

  /// No description provided for @cyberFraudWarningContinue2.
  ///
  /// In en, this message translates to:
  /// **' fraud, and threats'**
  String get cyberFraudWarningContinue2;

  /// No description provided for @reportingCybercrimes.
  ///
  /// In en, this message translates to:
  /// **'Reporting Cybercrimes'**
  String get reportingCybercrimes;

  /// No description provided for @cyberFraudWarningContinue3.
  ///
  /// In en, this message translates to:
  /// **'Report cybercrimes and cyber fraud '**
  String get cyberFraudWarningContinue3;

  /// No description provided for @cyberFraudWarningContinue4.
  ///
  /// In en, this message translates to:
  /// **'to protect yourself'**
  String get cyberFraudWarningContinue4;

  /// No description provided for @submitReport.
  ///
  /// In en, this message translates to:
  /// **'Submit Report'**
  String get submitReport;

  /// No description provided for @reportTitle.
  ///
  /// In en, this message translates to:
  /// **'Report Title'**
  String get reportTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @nationalID.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get nationalID;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @noNotfi.
  ///
  /// In en, this message translates to:
  /// **'There are no notifications at the moment.'**
  String get noNotfi;

  /// No description provided for @noReports.
  ///
  /// In en, this message translates to:
  /// **'There are no reports from this user'**
  String get noReports;

  /// No description provided for @errorWhileLouding.
  ///
  /// In en, this message translates to:
  /// **'Error While Loading'**
  String get errorWhileLouding;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @tip1.
  ///
  /// In en, this message translates to:
  /// **'Enable two-factor authentication (2FA) to protect your accounts from hacking.'**
  String get tip1;

  /// No description provided for @tip2.
  ///
  /// In en, this message translates to:
  /// **'Avoid clicking on suspicious links or links sent from untrusted sources.'**
  String get tip2;

  /// No description provided for @tip3.
  ///
  /// In en, this message translates to:
  /// **'Make sure that the websites you visit begin with HTTPS before entering any sensitive data.'**
  String get tip3;

  /// No description provided for @tip4.
  ///
  /// In en, this message translates to:
  /// **'Use and regularly update security software to protect against viruses and hacks.'**
  String get tip4;

  /// No description provided for @tip5.
  ///
  /// In en, this message translates to:
  /// **'Use a reliable VPN when connecting to public or open networks.'**
  String get tip5;

  /// No description provided for @tip6.
  ///
  /// In en, this message translates to:
  /// **'Choose strong and long passwords and do not use the same password for more than one account.'**
  String get tip6;

  /// No description provided for @tip7.
  ///
  /// In en, this message translates to:
  /// **'Keep backups of your important data in a safe place.'**
  String get tip7;

  /// No description provided for @tip8.
  ///
  /// In en, this message translates to:
  /// **'Report any attempted fraud or cyber threat immediately.'**
  String get tip8;

  /// No description provided for @tip9.
  ///
  /// In en, this message translates to:
  /// **'Avoid conducting financial transactions over public Wi-Fi networks.'**
  String get tip9;

  /// No description provided for @tip10.
  ///
  /// In en, this message translates to:
  /// **'Update your operating system and applications to avoid security vulnerabilities.'**
  String get tip10;

  /// No description provided for @usingEmergencyNumbers.
  ///
  /// In en, this message translates to:
  /// **'Please use these numbers only in actual emergencies.'**
  String get usingEmergencyNumbers;

  /// No description provided for @ambulance.
  ///
  /// In en, this message translates to:
  /// **'Ambulance'**
  String get ambulance;

  /// No description provided for @police.
  ///
  /// In en, this message translates to:
  /// **'Police'**
  String get police;

  /// No description provided for @fireFighters.
  ///
  /// In en, this message translates to:
  /// **'Fire Fighters'**
  String get fireFighters;

  /// No description provided for @helpLine.
  ///
  /// In en, this message translates to:
  /// **'HelpLine'**
  String get helpLine;

  /// No description provided for @electricalEmergency.
  ///
  /// In en, this message translates to:
  /// **'Electrical emergency'**
  String get electricalEmergency;

  /// No description provided for @fireEmergency.
  ///
  /// In en, this message translates to:
  /// **'Fire emergency'**
  String get fireEmergency;

  /// No description provided for @water.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get water;

  /// No description provided for @enterReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Report Title'**
  String get enterReportTitle;

  /// No description provided for @reportTitleAtLeast5.
  ///
  /// In en, this message translates to:
  /// **'Report title should be at least 5 letters'**
  String get reportTitleAtLeast5;

  /// No description provided for @reportEx.
  ///
  /// In en, this message translates to:
  /// **'Example: Robbing a store'**
  String get reportEx;

  /// No description provided for @enterReportDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter report description'**
  String get enterReportDescription;

  /// No description provided for @reportDescriptionAtLeast10.
  ///
  /// In en, this message translates to:
  /// **'Report description should be at least 10 characters'**
  String get reportDescriptionAtLeast10;

  /// No description provided for @reportDescription.
  ///
  /// In en, this message translates to:
  /// **'Report Description'**
  String get reportDescription;

  /// No description provided for @writeReportDescription.
  ///
  /// In en, this message translates to:
  /// **'Write report description'**
  String get writeReportDescription;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location (Optional)'**
  String get location;

  /// No description provided for @locationEx.
  ///
  /// In en, this message translates to:
  /// **'Example: Downtown, Cairo'**
  String get locationEx;

  /// No description provided for @photosAndVideos.
  ///
  /// In en, this message translates to:
  /// **'Photos & Videos'**
  String get photosAndVideos;

  /// No description provided for @addPhotosAndVideos.
  ///
  /// In en, this message translates to:
  /// **'Tap the icons to add media'**
  String get addPhotosAndVideos;

  /// No description provided for @alert.
  ///
  /// In en, this message translates to:
  /// **'Alert!'**
  String get alert;

  /// No description provided for @mustAddMedia.
  ///
  /// In en, this message translates to:
  /// **'You should add at least one photo or video'**
  String get mustAddMedia;

  /// No description provided for @sendingReport.
  ///
  /// In en, this message translates to:
  /// **'Send Report'**
  String get sendingReport;

  /// No description provided for @addingPhoto.
  ///
  /// In en, this message translates to:
  /// **'Adding Photo'**
  String get addingPhoto;

  /// No description provided for @addingVideo.
  ///
  /// In en, this message translates to:
  /// **'Adding Video'**
  String get addingVideo;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @signInSuccess.
  ///
  /// In en, this message translates to:
  /// **'Signed in successfully'**
  String get signInSuccess;

  /// No description provided for @notSignedIn.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t sign in'**
  String get notSignedIn;

  /// No description provided for @passwardResetSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'A password reset link has been sent to your email address.'**
  String get passwardResetSuccessfully;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @sendingEmailForNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address or national ID number and we will send you a link to reset your password.'**
  String get sendingEmailForNewPassword;

  /// No description provided for @enterEmailOrId.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address or national ID number.'**
  String get enterEmailOrId;

  /// No description provided for @validEmailOrId.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address or a valid national ID number.'**
  String get validEmailOrId;

  /// No description provided for @emailOrId.
  ///
  /// In en, this message translates to:
  /// **'Email or National ID'**
  String get emailOrId;

  /// No description provided for @sendingLinkReset.
  ///
  /// In en, this message translates to:
  /// **'Sending Reset Link'**
  String get sendingLinkReset;

  /// No description provided for @backSignIn.
  ///
  /// In en, this message translates to:
  /// **'Back to Sign In'**
  String get backSignIn;

  /// No description provided for @singInFailing.
  ///
  /// In en, this message translates to:
  /// **'Sign in has failed'**
  String get singInFailing;

  /// No description provided for @signupFailed.
  ///
  /// In en, this message translates to:
  /// **'Signup has failed'**
  String get signupFailed;

  /// No description provided for @fristName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get fristName;

  /// No description provided for @fristNameEx.
  ///
  /// In en, this message translates to:
  /// **'Eddard'**
  String get fristNameEx;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @lastNameEx.
  ///
  /// In en, this message translates to:
  /// **'Stark'**
  String get lastNameEx;

  /// No description provided for @enterNationalId.
  ///
  /// In en, this message translates to:
  /// **'Please enter your national ID'**
  String get enterNationalId;

  /// No description provided for @nationalIdOnlyNums.
  ///
  /// In en, this message translates to:
  /// **'National ID must contain only numbers'**
  String get nationalIdOnlyNums;

  /// No description provided for @nationalIdAtleastNums.
  ///
  /// In en, this message translates to:
  /// **'National ID must be exactly 14 digits'**
  String get nationalIdAtleastNums;

  /// No description provided for @enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get enterPhone;

  /// No description provided for @phoneNumberOnlyNums.
  ///
  /// In en, this message translates to:
  /// **'Phone number must contain only numbers'**
  String get phoneNumberOnlyNums;

  /// No description provided for @phoneNumber11.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be 11 digits'**
  String get phoneNumber11;

  /// No description provided for @creatingAccount.
  ///
  /// In en, this message translates to:
  /// **'Creating Account'**
  String get creatingAccount;

  /// No description provided for @havingAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you have an account?'**
  String get havingAccount;

  /// No description provided for @callNow.
  ///
  /// In en, this message translates to:
  /// **'Call Now'**
  String get callNow;

  /// No description provided for @doYouWantToCall.
  ///
  /// In en, this message translates to:
  /// **'Do you want to call '**
  String get doYouWantToCall;

  /// No description provided for @enteringPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter password'**
  String get enteringPassword;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgetPassword;

  /// No description provided for @do_notHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get do_notHaveAccount;

  /// No description provided for @reportDetails.
  ///
  /// In en, this message translates to:
  /// **'Report Details'**
  String get reportDetails;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @media.
  ///
  /// In en, this message translates to:
  /// **'Photos/Videos'**
  String get media;

  /// No description provided for @adminComment.
  ///
  /// In en, this message translates to:
  /// **'Admin Comment'**
  String get adminComment;

  /// No description provided for @reportDate.
  ///
  /// In en, this message translates to:
  /// **'Report Date'**
  String get reportDate;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @statusInReview.
  ///
  /// In en, this message translates to:
  /// **'In Review'**
  String get statusInReview;

  /// No description provided for @statusInvestigating.
  ///
  /// In en, this message translates to:
  /// **'Investigating'**
  String get statusInvestigating;

  /// No description provided for @statusResolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get statusResolved;

  /// No description provided for @statusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejected;

  /// No description provided for @reportStatusUpdated.
  ///
  /// In en, this message translates to:
  /// **'Report Status Updated'**
  String get reportStatusUpdated;

  /// No description provided for @reportStatusChangedTo.
  ///
  /// In en, this message translates to:
  /// **'Your report status has been changed to'**
  String get reportStatusChangedTo;

  /// No description provided for @now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

  /// No description provided for @since.
  ///
  /// In en, this message translates to:
  /// **'since'**
  String get since;

  /// No description provided for @minute.
  ///
  /// In en, this message translates to:
  /// **'minute'**
  String get minute;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'hour'**
  String get hour;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hours;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get day;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @failedToPickImages.
  ///
  /// In en, this message translates to:
  /// **'Failed to pick images'**
  String get failedToPickImages;

  /// No description provided for @failedToPickVideo.
  ///
  /// In en, this message translates to:
  /// **'Failed to pick video'**
  String get failedToPickVideo;

  /// No description provided for @failedToUploadMedia.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload media'**
  String get failedToUploadMedia;

  /// No description provided for @cloudinaryUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Cloudinary upload failed'**
  String get cloudinaryUploadFailed;

  /// No description provided for @cloudinaryApiError.
  ///
  /// In en, this message translates to:
  /// **'Cloudinary API Error'**
  String get cloudinaryApiError;

  /// No description provided for @noSecureUrlFound.
  ///
  /// In en, this message translates to:
  /// **'Upload successful but no valid secure_url found in response'**
  String get noSecureUrlFound;

  /// No description provided for @networkOrApiError.
  ///
  /// In en, this message translates to:
  /// **'Network or API error during Cloudinary upload'**
  String get networkOrApiError;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred during Cloudinary upload'**
  String get unexpectedError;

  /// No description provided for @deleteAccountError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while deleting the account. Please try again.'**
  String get deleteAccountError;

  /// No description provided for @incorrectEmailOrPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password.'**
  String get incorrectEmailOrPassword;

  /// No description provided for @networkConnectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Network connection failed. Please check your internet connection.'**
  String get networkConnectionFailed;

  /// No description provided for @signInFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign in failed. Please check your credentials and try again.'**
  String get signInFailed;

  /// No description provided for @unknownSignInError.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred during sign in. Please try again.'**
  String get unknownSignInError;

  /// No description provided for @weakPassword.
  ///
  /// In en, this message translates to:
  /// **'The password is too weak.'**
  String get weakPassword;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'This email address is already in use.'**
  String get emailAlreadyInUse;

  /// No description provided for @accountCreationFailed.
  ///
  /// In en, this message translates to:
  /// **'Account creation failed. Please try again.'**
  String get accountCreationFailed;

  /// No description provided for @unknownAccountCreationError.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred while creating the account. Please try again.'**
  String get unknownAccountCreationError;

  /// No description provided for @signOutError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during sign out. Please try again.'**
  String get signOutError;

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'No account registered with this email address.'**
  String get userNotFound;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address.'**
  String get invalidEmail;

  /// No description provided for @passwordResetFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to send password reset link.'**
  String get passwordResetFailed;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred. Please try again.'**
  String get unknownError;

  /// No description provided for @nationalIdExists.
  ///
  /// In en, this message translates to:
  /// **'This national ID is already registered'**
  String get nationalIdExists;

  /// No description provided for @failedToAddReport.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while adding the report'**
  String get failedToAddReport;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @errorCheckingNationalId.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while verifying the national ID'**
  String get errorCheckingNationalId;

  /// No description provided for @cannotFetchNotifications.
  ///
  /// In en, this message translates to:
  /// **'Cannot fetch notifications'**
  String get cannotFetchNotifications;

  /// No description provided for @invalidNotificationId.
  ///
  /// In en, this message translates to:
  /// **'Invalid notification ID'**
  String get invalidNotificationId;

  /// No description provided for @failedToUpdateNotificationStatus.
  ///
  /// In en, this message translates to:
  /// **'Failed to update notification status'**
  String get failedToUpdateNotificationStatus;

  /// No description provided for @reportNotFound.
  ///
  /// In en, this message translates to:
  /// **'Report not found'**
  String get reportNotFound;

  /// No description provided for @failedToLoadReportData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load report data'**
  String get failedToLoadReportData;

  /// No description provided for @userIdMissing.
  ///
  /// In en, this message translates to:
  /// **'User ID is missing'**
  String get userIdMissing;

  /// No description provided for @failedToLoadUserReports.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading user reports'**
  String get failedToLoadUserReports;

  /// No description provided for @nationalIdNotRegistered.
  ///
  /// In en, this message translates to:
  /// **'National ID not registered. Please check your data'**
  String get nationalIdNotRegistered;

  /// No description provided for @dataLookupError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while looking up data'**
  String get dataLookupError;

  /// No description provided for @nationalIdNotFoundForEmail.
  ///
  /// In en, this message translates to:
  /// **'National ID not found for this email'**
  String get nationalIdNotFoundForEmail;

  /// No description provided for @errorRetrievingNationalId.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while retrieving national ID'**
  String get errorRetrievingNationalId;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return SAr();
    case 'en':
      return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
