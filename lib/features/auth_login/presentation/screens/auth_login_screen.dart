import 'package:flutter/material.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/resource_management/app_video_image.dart';
import 'package:quick_art/features/auth_login/presentation/widgets/login_agreement_bar.dart';
import 'package:quick_art/features/auth_login/presentation/widgets/wechat_login_button.dart';

/// 登录页面
class AuthLoginScreen extends StatefulWidget {
  /// 构造
  const AuthLoginScreen({
    super.key,
    this.onWechatLogin,
    this.onAgreementChanged,
    this.onUserAgreementTap,
    this.onPrivacyPolicyTap,
  });

  /// 微信登录点击回调
  final VoidCallback? onWechatLogin;

  /// 协议勾选状态变化回调
  final ValueChanged<bool>? onAgreementChanged;

  /// 用户协议点击回调
  final VoidCallback? onUserAgreementTap;

  /// 隐私政策点击回调
  final VoidCallback? onPrivacyPolicyTap;

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  bool _isAgreementChecked = false;

  void _toggleAgreement() {
    setState(() {
      _isAgreementChecked = !_isAgreementChecked;
    });
    widget.onAgreementChanged?.call(_isAgreementChecked);
  }

  void _handleWechatLogin() {
    if (!_isAgreementChecked) {
      return;
    }
    widget.onWechatLogin?.call();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Positioned.fill(child: _LoginBackground()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: IgnorePointer(
              child: SizedBox(
                height: screenHeight * 0.4,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xFF0D0D12)],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(bottom: false, child: SizedBox(height: 1)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 24, right: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.auth_login_title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.auth_login_subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 40),
                    WechatLoginButton(
                      text: l10n.auth_login_wechat_button,
                      onTap: _handleWechatLogin,
                    ),
                    const SizedBox(height: 32),
                    LoginAgreementBar(
                      isChecked: _isAgreementChecked,
                      onToggle: _toggleAgreement,
                      onUserAgreementTap: widget.onUserAgreementTap,
                      onPrivacyPolicyTap: widget.onPrivacyPolicyTap,
                      leadingText: l10n.auth_login_agreement_prefix,
                      userAgreementText: l10n.auth_login_agreement_user,
                      andText: l10n.auth_login_agreement_and,
                      privacyPolicyText: l10n.auth_login_agreement_privacy,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginBackground extends StatelessWidget {
  const _LoginBackground();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppVideoImage.authLoginBackground,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => Image.asset(
        AppVideoImage.aiFaceSwapping,
        fit: BoxFit.cover,
      ),
    );
  }
}
