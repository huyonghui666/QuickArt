import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
    Locale('en'),
    Locale('zh'),
  ];

  /// Label for the settings screen or button
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// Label for Join Discord button
  ///
  /// In en, this message translates to:
  /// **'Join Discord'**
  String get setting_discord;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Label for Rate Us button
  ///
  /// In en, this message translates to:
  /// **'Rate Us'**
  String get setting_rate_us;

  /// Label for Privacy Policy button
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get setting_privacy_policy;

  /// Label for Terms of Service button
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get setting_terms_of_service;

  /// Label for Member Center button
  ///
  /// In en, this message translates to:
  /// **'Member Center'**
  String get setting_member_center;

  /// Label for Social Media section
  ///
  /// In en, this message translates to:
  /// **'Social Media'**
  String get setting_social_media;

  /// Label for Version
  ///
  /// In en, this message translates to:
  /// **'Version:'**
  String get setting_version;

  /// Label for QUICKART tab
  ///
  /// In en, this message translates to:
  /// **'QUICKART'**
  String get nav_quickart;

  /// Label for Explore tab
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get nav_explore;

  /// Label for Tools tab
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get nav_tools;

  /// Label for Studio tab
  ///
  /// In en, this message translates to:
  /// **'Studio'**
  String get nav_studio;

  /// Label for the text-to-image feature button on the home screen
  ///
  /// In en, this message translates to:
  /// **'Describe'**
  String get home_describe;

  /// Label for the image-to-image feature button on the home screen
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get home_add_photo;

  /// Label for the history button on the home screen
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get home_history;

  /// Button label to try a specific inspiration style
  ///
  /// In en, this message translates to:
  /// **'Try'**
  String get inspiration_try;

  /// Inspiration: New
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get inspiration_new;

  /// Inspiration: Manga
  ///
  /// In en, this message translates to:
  /// **'Manga'**
  String get inspiration_manga;

  /// Inspiration: Photography
  ///
  /// In en, this message translates to:
  /// **'Photography'**
  String get inspiration_photography;

  /// Inspiration: Watercolor
  ///
  /// In en, this message translates to:
  /// **'Watercolor'**
  String get inspiration_watercolor;

  /// Inspiration: Funny
  ///
  /// In en, this message translates to:
  /// **'Funny'**
  String get inspiration_funny;

  /// Inspiration: Tattoo
  ///
  /// In en, this message translates to:
  /// **'Tattoo'**
  String get inspiration_tattoo;

  /// Inspiration: Cyberpunk
  ///
  /// In en, this message translates to:
  /// **'Cyberpunk'**
  String get inspiration_cyberpunk;

  /// Inspiration: Surrealism
  ///
  /// In en, this message translates to:
  /// **'Surrealism'**
  String get inspiration_surrealism;

  /// Inspiration: Christmas
  ///
  /// In en, this message translates to:
  /// **'Christmas'**
  String get inspiration_christmas;

  /// Label for Art Style section
  ///
  /// In en, this message translates to:
  /// **'Art Style'**
  String get home_art_style;

  /// Art Style: No Style
  ///
  /// In en, this message translates to:
  /// **'No Style'**
  String get style_no_style;

  /// Art Style: Cute Cartoon
  ///
  /// In en, this message translates to:
  /// **'Cute Cartoon'**
  String get style_cute_cartoon;

  /// Art Style: Ancient Style
  ///
  /// In en, this message translates to:
  /// **'Ancient Style'**
  String get style_ancient_style;

  /// Art Style: Graffiti
  ///
  /// In en, this message translates to:
  /// **'Graffiti'**
  String get style_graffiti;

  /// Art Style: Pop Art
  ///
  /// In en, this message translates to:
  /// **'Pop Art'**
  String get style_pop_art;

  /// Art Style: Vivid Realism
  ///
  /// In en, this message translates to:
  /// **'Vivid Realism'**
  String get style_vivid_realism;

  /// Art Style: Color
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get style_color;

  /// Art Style: 80s
  ///
  /// In en, this message translates to:
  /// **'80s'**
  String get style_eighties;

  /// Art Style: Showa
  ///
  /// In en, this message translates to:
  /// **'Showa'**
  String get style_showa;

  /// Art Style: 3D Model
  ///
  /// In en, this message translates to:
  /// **'3D Model'**
  String get style_model_3d;

  /// Art Style: Photography
  ///
  /// In en, this message translates to:
  /// **'Photography'**
  String get style_photography;

  /// Art Style: Japanese Anime
  ///
  /// In en, this message translates to:
  /// **'Japanese Anime'**
  String get style_japanese_anime;

  /// Art Style: Tattoo
  ///
  /// In en, this message translates to:
  /// **'Tattoo'**
  String get style_tattoo;

  /// Art Style: Retro Arcade
  ///
  /// In en, this message translates to:
  /// **'Retro Arcade'**
  String get style_retro_arcade;

  /// Art Style: Black & White
  ///
  /// In en, this message translates to:
  /// **'Black & White'**
  String get style_black_white;

  /// Art Style: Pixar
  ///
  /// In en, this message translates to:
  /// **'Pixar'**
  String get style_pixar;

  /// Art Style: Cyberpunk
  ///
  /// In en, this message translates to:
  /// **'Cyberpunk'**
  String get style_cyberpunk;

  /// Art Style: Line Art
  ///
  /// In en, this message translates to:
  /// **'Line Art'**
  String get style_line_art;

  /// Art Style: Watercolor
  ///
  /// In en, this message translates to:
  /// **'Watercolor'**
  String get style_watercolor;

  /// Hint text for social sharing
  ///
  /// In en, this message translates to:
  /// **'Tag our official social media @quickartai'**
  String get share_social_hint;

  /// Label for Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get share_save;

  /// Label for TikTok button
  ///
  /// In en, this message translates to:
  /// **'TikTok'**
  String get share_tiktok;

  /// Label for Instagram button
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get share_instagram;

  /// Label for Facebook button
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get share_facebook;

  /// Error message when prompt is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter prompt!'**
  String get common_enter_prompt;

  /// Label for draw button
  ///
  /// In en, this message translates to:
  /// **'Draw'**
  String get common_draw;

  /// Hint text for prompt input
  ///
  /// In en, this message translates to:
  /// **'Enter your prompt, it can be anything you want to create'**
  String get common_prompt_hint;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get common_unknown_error;

  /// Status text on waiting screen
  ///
  /// In en, this message translates to:
  /// **'Creating...'**
  String get waiting_creating;

  /// Hint text on waiting screen
  ///
  /// In en, this message translates to:
  /// **'The masterpiece is being generated'**
  String get waiting_generating_hint;

  /// Button label to run task in background
  ///
  /// In en, this message translates to:
  /// **'Run in Background'**
  String get waiting_run_in_background;

  /// Label for retry button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get common_retry;

  /// Prefix for error messages
  ///
  /// In en, this message translates to:
  /// **'Error: '**
  String get common_error_prefix;

  /// Title for Tools screen
  ///
  /// In en, this message translates to:
  /// **'AI Tools'**
  String get tools_title;

  /// Title for AI Video feature
  ///
  /// In en, this message translates to:
  /// **'AI Video'**
  String get tools_ai_video;

  /// Title for Artistic Photo feature
  ///
  /// In en, this message translates to:
  /// **'Artistic Photo'**
  String get tools_artistic_photo;

  /// Title for AI Face Swap feature
  ///
  /// In en, this message translates to:
  /// **'AI Face Swap'**
  String get tools_ai_face_swap;

  /// Title for Text to Video feature
  ///
  /// In en, this message translates to:
  /// **'Text to Video'**
  String get tools_text_to_video;

  /// Title for Start & End Frame feature
  ///
  /// In en, this message translates to:
  /// **'Start & End Frame'**
  String get tools_start_end_frame;

  /// Title for Multi-Subject feature
  ///
  /// In en, this message translates to:
  /// **'Multi-Subject'**
  String get tools_multi_subject;

  /// Label for start frame upload
  ///
  /// In en, this message translates to:
  /// **'Upload Start Frame'**
  String get tools_upload_start_frame;

  /// Label for end frame upload
  ///
  /// In en, this message translates to:
  /// **'Upload End Frame'**
  String get tools_upload_end_frame;

  /// Title for prompt section
  ///
  /// In en, this message translates to:
  /// **'Prompt'**
  String get tools_prompt_title;

  /// Error message when frames are missing
  ///
  /// In en, this message translates to:
  /// **'Please upload both start and end frames'**
  String get tools_upload_both_frames_error;

  /// Label for random option
  ///
  /// In en, this message translates to:
  /// **'Random'**
  String get tools_random;

  /// Label for 1:1 ratio
  ///
  /// In en, this message translates to:
  /// **'1:1'**
  String get tools_ratio_1_1;

  /// Hint text for social sharing in tools
  ///
  /// In en, this message translates to:
  /// **'Tag our official social media @quickartai'**
  String get tools_social_hint;

  /// Label for Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get tools_save;

  /// Label for TikTok button
  ///
  /// In en, this message translates to:
  /// **'TikTok'**
  String get tools_tiktok;

  /// Label for Instagram button
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get tools_instagram;

  /// Label for Facebook button
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get tools_facebook;

  /// Badge text for new items
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get tools_new_badge;

  /// Tab: Popular
  ///
  /// In en, this message translates to:
  /// **'Popular!'**
  String get tools_tab_popular;

  /// Tab: Kiss
  ///
  /// In en, this message translates to:
  /// **'Kiss'**
  String get tools_tab_kiss;

  /// Tab: Hug
  ///
  /// In en, this message translates to:
  /// **'Hug'**
  String get tools_tab_hug;

  /// Tab: AI Effects
  ///
  /// In en, this message translates to:
  /// **'AI Effects'**
  String get tools_tab_ai_effects;

  /// Tab: Style Transfer
  ///
  /// In en, this message translates to:
  /// **'Style Transfer'**
  String get tools_tab_style_transfer;

  /// Tab: My Rich Life
  ///
  /// In en, this message translates to:
  /// **'My Rich Life'**
  String get tools_tab_rich_life;

  /// Tab: Cross-Dimension Love
  ///
  /// In en, this message translates to:
  /// **'Cross-Dimension Love'**
  String get tools_tab_cross_dimension;

  /// Tab: Animal Effects
  ///
  /// In en, this message translates to:
  /// **'Animal Effects'**
  String get tools_tab_animal_effects;

  /// Tab: Romantic Day
  ///
  /// In en, this message translates to:
  /// **'Romantic Day'**
  String get tools_tab_romantic_day;

  /// Tab: Movie Life
  ///
  /// In en, this message translates to:
  /// **'Movie Life'**
  String get tools_tab_movie_life;

  /// Tab: Cross-Dressing
  ///
  /// In en, this message translates to:
  /// **'Cross-Dressing'**
  String get tools_tab_cross_dressing;

  /// Tab: Let's Dance!
  ///
  /// In en, this message translates to:
  /// **'Let\'s Dance!'**
  String get tools_tab_dance;

  /// Tab: Micro World
  ///
  /// In en, this message translates to:
  /// **'Micro World'**
  String get tools_tab_micro_world;

  /// Template: French Kiss Pro
  ///
  /// In en, this message translates to:
  /// **'French Kiss Pro'**
  String get tools_template_kiss_pro;

  /// Template: Turn into Cat
  ///
  /// In en, this message translates to:
  /// **'Turn into Cat'**
  String get tools_template_cat;

  /// Template: Heartbeat 404
  ///
  /// In en, this message translates to:
  /// **'Heartbeat 404'**
  String get tools_template_heartbeat_404;

  /// Template: Skull Universe
  ///
  /// In en, this message translates to:
  /// **'Skull Universe'**
  String get tools_template_skull_universe;

  /// Template: Koi Fortune
  ///
  /// In en, this message translates to:
  /// **'Koi Fortune'**
  String get tools_template_koi;

  /// Template: Redemption Rain
  ///
  /// In en, this message translates to:
  /// **'Redemption Rain'**
  String get tools_template_redemption_rain;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
