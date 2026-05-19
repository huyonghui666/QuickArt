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

  /// No description provided for @widgets_prompt_text_field_enter_prompt.
  ///
  /// In en, this message translates to:
  /// **'Please enter prompt!'**
  String get widgets_prompt_text_field_enter_prompt;

  /// No description provided for @widgets_prompt_text_field_prompt_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your prompt, it can be anything you want to create'**
  String get widgets_prompt_text_field_prompt_hint;

  /// No description provided for @widgets_draw_button_draw.
  ///
  /// In en, this message translates to:
  /// **'Draw'**
  String get widgets_draw_button_draw;

  /// No description provided for @widgets_waiting_screen_creating.
  ///
  /// In en, this message translates to:
  /// **'Creating...'**
  String get widgets_waiting_screen_creating;

  /// No description provided for @widgets_waiting_screen_generating_hint.
  ///
  /// In en, this message translates to:
  /// **'The masterpiece is being generated'**
  String get widgets_waiting_screen_generating_hint;

  /// No description provided for @widgets_waiting_screen_run_in_background.
  ///
  /// In en, this message translates to:
  /// **'Run in Background'**
  String get widgets_waiting_screen_run_in_background;

  /// No description provided for @common_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get common_retry;

  /// No description provided for @common_unknown_error.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get common_unknown_error;

  /// No description provided for @common_error_prefix.
  ///
  /// In en, this message translates to:
  /// **'Error: '**
  String get common_error_prefix;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @setting_discord.
  ///
  /// In en, this message translates to:
  /// **'Join Discord'**
  String get setting_discord;

  /// No description provided for @setting_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get setting_language;

  /// No description provided for @setting_rate_us.
  ///
  /// In en, this message translates to:
  /// **'Rate Us'**
  String get setting_rate_us;

  /// No description provided for @setting_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get setting_privacy_policy;

  /// No description provided for @setting_terms_of_service.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get setting_terms_of_service;

  /// No description provided for @setting_member_center.
  ///
  /// In en, this message translates to:
  /// **'Member Center'**
  String get setting_member_center;

  /// No description provided for @setting_social_media.
  ///
  /// In en, this message translates to:
  /// **'Social Media'**
  String get setting_social_media;

  /// No description provided for @setting_version.
  ///
  /// In en, this message translates to:
  /// **'Version:'**
  String get setting_version;

  /// No description provided for @nav_quickart.
  ///
  /// In en, this message translates to:
  /// **'QUICKART'**
  String get nav_quickart;

  /// No description provided for @nav_explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get nav_explore;

  /// No description provided for @nav_tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get nav_tools;

  /// No description provided for @nav_studio.
  ///
  /// In en, this message translates to:
  /// **'Studio'**
  String get nav_studio;

  /// No description provided for @home_describe.
  ///
  /// In en, this message translates to:
  /// **'Describe'**
  String get home_describe;

  /// No description provided for @home_add_photo.
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get home_add_photo;

  /// No description provided for @home_history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get home_history;

  /// No description provided for @home_inspiration_new.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get home_inspiration_new;

  /// No description provided for @home_inspiration_manga.
  ///
  /// In en, this message translates to:
  /// **'Manga'**
  String get home_inspiration_manga;

  /// No description provided for @home_inspiration_photography.
  ///
  /// In en, this message translates to:
  /// **'Photography'**
  String get home_inspiration_photography;

  /// No description provided for @home_inspiration_watercolor.
  ///
  /// In en, this message translates to:
  /// **'Watercolor'**
  String get home_inspiration_watercolor;

  /// No description provided for @home_inspiration_funny.
  ///
  /// In en, this message translates to:
  /// **'Funny'**
  String get home_inspiration_funny;

  /// No description provided for @home_inspiration_tattoo.
  ///
  /// In en, this message translates to:
  /// **'Tattoo'**
  String get home_inspiration_tattoo;

  /// No description provided for @home_inspiration_cyberpunk.
  ///
  /// In en, this message translates to:
  /// **'Cyberpunk'**
  String get home_inspiration_cyberpunk;

  /// No description provided for @home_inspiration_surrealism.
  ///
  /// In en, this message translates to:
  /// **'Surrealism'**
  String get home_inspiration_surrealism;

  /// No description provided for @home_inspiration_christmas.
  ///
  /// In en, this message translates to:
  /// **'Christmas'**
  String get home_inspiration_christmas;

  /// No description provided for @home_try_it.
  ///
  /// In en, this message translates to:
  /// **'Try'**
  String get home_try_it;

  /// No description provided for @home_try_prompt.
  ///
  /// In en, this message translates to:
  /// **'Try Prompt'**
  String get home_try_prompt;

  /// No description provided for @home_art_style.
  ///
  /// In en, this message translates to:
  /// **'Art Style'**
  String get home_art_style;

  /// No description provided for @home_style_no_style.
  ///
  /// In en, this message translates to:
  /// **'No Style'**
  String get home_style_no_style;

  /// No description provided for @home_style_cute_cartoon.
  ///
  /// In en, this message translates to:
  /// **'Cute Cartoon'**
  String get home_style_cute_cartoon;

  /// No description provided for @home_style_ancient_style.
  ///
  /// In en, this message translates to:
  /// **'Ancient Style'**
  String get home_style_ancient_style;

  /// No description provided for @home_style_graffiti.
  ///
  /// In en, this message translates to:
  /// **'Graffiti'**
  String get home_style_graffiti;

  /// No description provided for @home_style_pop_art.
  ///
  /// In en, this message translates to:
  /// **'Pop Art'**
  String get home_style_pop_art;

  /// No description provided for @home_style_vivid_realism.
  ///
  /// In en, this message translates to:
  /// **'Vivid Realism'**
  String get home_style_vivid_realism;

  /// No description provided for @home_style_color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get home_style_color;

  /// No description provided for @home_style_eighties.
  ///
  /// In en, this message translates to:
  /// **'80s'**
  String get home_style_eighties;

  /// No description provided for @home_style_showa.
  ///
  /// In en, this message translates to:
  /// **'Showa'**
  String get home_style_showa;

  /// No description provided for @home_style_model_3d.
  ///
  /// In en, this message translates to:
  /// **'3D Model'**
  String get home_style_model_3d;

  /// No description provided for @home_style_photography.
  ///
  /// In en, this message translates to:
  /// **'Photography'**
  String get home_style_photography;

  /// No description provided for @home_style_japanese_anime.
  ///
  /// In en, this message translates to:
  /// **'Japanese Anime'**
  String get home_style_japanese_anime;

  /// No description provided for @home_style_tattoo.
  ///
  /// In en, this message translates to:
  /// **'Tattoo'**
  String get home_style_tattoo;

  /// No description provided for @home_style_retro_arcade.
  ///
  /// In en, this message translates to:
  /// **'Retro Arcade'**
  String get home_style_retro_arcade;

  /// No description provided for @home_style_black_white.
  ///
  /// In en, this message translates to:
  /// **'Black & White'**
  String get home_style_black_white;

  /// No description provided for @home_style_pixar.
  ///
  /// In en, this message translates to:
  /// **'Pixar'**
  String get home_style_pixar;

  /// No description provided for @home_style_cyberpunk.
  ///
  /// In en, this message translates to:
  /// **'Cyberpunk'**
  String get home_style_cyberpunk;

  /// No description provided for @home_style_line_art.
  ///
  /// In en, this message translates to:
  /// **'Line Art'**
  String get home_style_line_art;

  /// No description provided for @home_style_watercolor.
  ///
  /// In en, this message translates to:
  /// **'Watercolor'**
  String get home_style_watercolor;

  /// No description provided for @bottom_sheet_social_hint.
  ///
  /// In en, this message translates to:
  /// **'Tag our official social media @quickartai'**
  String get bottom_sheet_social_hint;

  /// No description provided for @bottom_sheet_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get bottom_sheet_save;

  /// No description provided for @bottom_sheet_tiktok.
  ///
  /// In en, this message translates to:
  /// **'TikTok'**
  String get bottom_sheet_tiktok;

  /// No description provided for @bottom_sheet_instagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get bottom_sheet_instagram;

  /// No description provided for @bottom_sheet_facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get bottom_sheet_facebook;

  /// No description provided for @tools_title.
  ///
  /// In en, this message translates to:
  /// **'AI Tools'**
  String get tools_title;

  /// No description provided for @tools_ai_video.
  ///
  /// In en, this message translates to:
  /// **'AI Video'**
  String get tools_ai_video;

  /// No description provided for @tools_artistic_photo.
  ///
  /// In en, this message translates to:
  /// **'Artistic Photo'**
  String get tools_artistic_photo;

  /// No description provided for @tools_ai_face_swap.
  ///
  /// In en, this message translates to:
  /// **'AI Face Swap'**
  String get tools_ai_face_swap;

  /// No description provided for @tools_ai_face_swap_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Let you become a character in anime'**
  String get tools_ai_face_swap_subtitle;

  /// No description provided for @tools_ai_face_swap_custom_photo.
  ///
  /// In en, this message translates to:
  /// **'Custom Photo'**
  String get tools_ai_face_swap_custom_photo;

  /// No description provided for @tools_ai_face_swap_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading, please wait.'**
  String get tools_ai_face_swap_loading;

  /// No description provided for @tools_ai_face_swap_guide_title.
  ///
  /// In en, this message translates to:
  /// **'Please use a front-facing photo with no obstructions'**
  String get tools_ai_face_swap_guide_title;

  /// No description provided for @tools_ai_face_swap_guide_good.
  ///
  /// In en, this message translates to:
  /// **'Suitable photos'**
  String get tools_ai_face_swap_guide_good;

  /// No description provided for @tools_ai_face_swap_guide_bad.
  ///
  /// In en, this message translates to:
  /// **'Unsuitable photos'**
  String get tools_ai_face_swap_guide_bad;

  /// No description provided for @tools_ai_face_swap_guide_tip.
  ///
  /// In en, this message translates to:
  /// **'Do not use non-frontal, eyes-closed, face-obscured, or overly exaggerated expression photos.'**
  String get tools_ai_face_swap_guide_tip;

  /// No description provided for @tools_ai_face_swap_guide_got_it.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get tools_ai_face_swap_guide_got_it;

  /// No description provided for @tools_ai_face_swap_select_face.
  ///
  /// In en, this message translates to:
  /// **'Select the face to swap'**
  String get tools_ai_face_swap_select_face;

  /// No description provided for @tools_ai_face_swap_all.
  ///
  /// In en, this message translates to:
  /// **'ALL'**
  String get tools_ai_face_swap_all;

  /// No description provided for @tools_ai_face_swap_no_face_hint.
  ///
  /// In en, this message translates to:
  /// **'Try using a front-facing photo'**
  String get tools_ai_face_swap_no_face_hint;

  /// No description provided for @tools_ai_face_swap_select_which_face.
  ///
  /// In en, this message translates to:
  /// **'Which face do you want to swap?'**
  String get tools_ai_face_swap_select_which_face;

  /// No description provided for @tools_ai_face_swap_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get tools_ai_face_swap_confirm;

  /// No description provided for @tools_text_to_video.
  ///
  /// In en, this message translates to:
  /// **'Text to Video'**
  String get tools_text_to_video;

  /// No description provided for @tools_start_end_frame.
  ///
  /// In en, this message translates to:
  /// **'Start & End Frame'**
  String get tools_start_end_frame;

  /// No description provided for @tools_multi_subject.
  ///
  /// In en, this message translates to:
  /// **'Multi-Subject'**
  String get tools_multi_subject;

  /// No description provided for @tools_upload_start_frame.
  ///
  /// In en, this message translates to:
  /// **'Upload Start Frame'**
  String get tools_upload_start_frame;

  /// No description provided for @tools_upload_end_frame.
  ///
  /// In en, this message translates to:
  /// **'Upload End Frame'**
  String get tools_upload_end_frame;

  /// No description provided for @tools_prompt_title.
  ///
  /// In en, this message translates to:
  /// **'Prompt'**
  String get tools_prompt_title;

  /// No description provided for @tools_upload_both_frames_error.
  ///
  /// In en, this message translates to:
  /// **'Please upload both start and end frames'**
  String get tools_upload_both_frames_error;

  /// No description provided for @tools_random.
  ///
  /// In en, this message translates to:
  /// **'Random'**
  String get tools_random;

  /// No description provided for @tools_ratio_1_1.
  ///
  /// In en, this message translates to:
  /// **'1:1'**
  String get tools_ratio_1_1;

  /// No description provided for @tools_new_badge.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get tools_new_badge;

  /// No description provided for @tools_tab_popular.
  ///
  /// In en, this message translates to:
  /// **'Popular!'**
  String get tools_tab_popular;

  /// No description provided for @tools_tab_kiss.
  ///
  /// In en, this message translates to:
  /// **'Kiss'**
  String get tools_tab_kiss;

  /// No description provided for @tools_tab_hug.
  ///
  /// In en, this message translates to:
  /// **'Hug'**
  String get tools_tab_hug;

  /// No description provided for @tools_tab_ai_effects.
  ///
  /// In en, this message translates to:
  /// **'AI Effects'**
  String get tools_tab_ai_effects;

  /// No description provided for @tools_tab_style_transfer.
  ///
  /// In en, this message translates to:
  /// **'Style Transfer'**
  String get tools_tab_style_transfer;

  /// No description provided for @tools_tab_rich_life.
  ///
  /// In en, this message translates to:
  /// **'My Rich Life'**
  String get tools_tab_rich_life;

  /// No description provided for @tools_tab_cross_dimension.
  ///
  /// In en, this message translates to:
  /// **'Cross-Dimension Love'**
  String get tools_tab_cross_dimension;

  /// No description provided for @tools_tab_animal_effects.
  ///
  /// In en, this message translates to:
  /// **'Animal Effects'**
  String get tools_tab_animal_effects;

  /// No description provided for @tools_tab_romantic_day.
  ///
  /// In en, this message translates to:
  /// **'Romantic Day'**
  String get tools_tab_romantic_day;

  /// No description provided for @tools_tab_movie_life.
  ///
  /// In en, this message translates to:
  /// **'Movie Life'**
  String get tools_tab_movie_life;

  /// No description provided for @tools_tab_cross_dressing.
  ///
  /// In en, this message translates to:
  /// **'Cross-Dressing'**
  String get tools_tab_cross_dressing;

  /// No description provided for @tools_tab_dance.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Dance!'**
  String get tools_tab_dance;

  /// No description provided for @tools_tab_micro_world.
  ///
  /// In en, this message translates to:
  /// **'Micro World'**
  String get tools_tab_micro_world;

  /// No description provided for @tools_template_kiss_pro.
  ///
  /// In en, this message translates to:
  /// **'French Kiss Pro'**
  String get tools_template_kiss_pro;

  /// No description provided for @tools_template_cat.
  ///
  /// In en, this message translates to:
  /// **'Turn into Cat'**
  String get tools_template_cat;

  /// No description provided for @tools_template_heartbeat_404.
  ///
  /// In en, this message translates to:
  /// **'Heartbeat 404'**
  String get tools_template_heartbeat_404;

  /// No description provided for @tools_template_skull_universe.
  ///
  /// In en, this message translates to:
  /// **'Skull Universe'**
  String get tools_template_skull_universe;

  /// No description provided for @tools_template_koi.
  ///
  /// In en, this message translates to:
  /// **'Koi Fortune'**
  String get tools_template_koi;

  /// No description provided for @tools_template_redemption_rain.
  ///
  /// In en, this message translates to:
  /// **'Redemption Rain'**
  String get tools_template_redemption_rain;

  /// No description provided for @tools_start_end_frame_default_prompt.
  ///
  /// In en, this message translates to:
  /// **'The first photo slowly fades into the second photo.'**
  String get tools_start_end_frame_default_prompt;

  /// No description provided for @workshop_title.
  ///
  /// In en, this message translates to:
  /// **'Workshop'**
  String get workshop_title;

  /// No description provided for @workshop_load_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load: {error}'**
  String workshop_load_failed(Object error);

  /// No description provided for @workshop_pro_banner_description.
  ///
  /// In en, this message translates to:
  /// **'Unlock more unique effects'**
  String get workshop_pro_banner_description;

  /// No description provided for @workshop_pro_banner_action.
  ///
  /// In en, this message translates to:
  /// **'Get'**
  String get workshop_pro_banner_action;

  /// No description provided for @workshop_task_processing.
  ///
  /// In en, this message translates to:
  /// **'Drawing in progress, please wait'**
  String get workshop_task_processing;

  /// No description provided for @workshop_task_failed.
  ///
  /// In en, this message translates to:
  /// **'Generation failed, please retry!'**
  String get workshop_task_failed;
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
