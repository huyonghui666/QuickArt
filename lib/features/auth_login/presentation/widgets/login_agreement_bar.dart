import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 协议勾选区
class LoginAgreementBar extends StatelessWidget {
  /// 构造
  const LoginAgreementBar({
    required this.isChecked,
    required this.leadingText,
    required this.userAgreementText,
    required this.andText,
    required this.privacyPolicyText,
    super.key,
    this.onToggle,
    this.onUserAgreementTap,
    this.onPrivacyPolicyTap,
  });

  /// 是否勾选
  final bool isChecked;

  /// 协议前置文本
  final String leadingText;

  /// 用户协议文本
  final String userAgreementText;

  /// 中间连接文本
  final String andText;

  /// 隐私政策文本
  final String privacyPolicyText;

  /// 勾选框点击回调
  final VoidCallback? onToggle;

  /// 用户协议点击回调
  final VoidCallback? onUserAgreementTap;

  /// 隐私政策点击回调
  final VoidCallback? onPrivacyPolicyTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onToggle,
          behavior: HitTestBehavior.deferToChild,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isChecked
                  ? const Color(0xCCFFFFFF)
                  : const Color(0x66FFFFFF),
              border: isChecked
                  ? null
                  : Border.all(
                      color: Colors.white70,
                    ),
            ),
            child: isChecked
                ? const Center(
                    child: Text(
                      '✓',
                      style: TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(width: 6),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 12),
            children: [
              TextSpan(
                text: leadingText,
                style: const TextStyle(color: Colors.white54),
              ),
              TextSpan(
                text: userAgreementText,
                style: const TextStyle(color: Colors.white70),
                recognizer: TapGestureRecognizer()..onTap = onUserAgreementTap,
              ),
              TextSpan(
                text: andText,
                style: const TextStyle(color: Colors.white54),
              ),
              TextSpan(
                text: privacyPolicyText,
                style: const TextStyle(color: Colors.white70),
                recognizer: TapGestureRecognizer()..onTap = onPrivacyPolicyTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
