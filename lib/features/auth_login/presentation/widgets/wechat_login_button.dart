import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/core/resource_management/app_icons.dart';

/// 微信登录按钮
class WechatLoginButton extends StatelessWidget {
  /// 构造
  const WechatLoginButton({required this.text, super.key, this.onTap});

  /// 点击回调
  final VoidCallback? onTap;

  /// 按钮文案
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(26),
        child: Ink(
          height: 52,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: _WeChatSvgIcon(),
                  ),
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeChatSvgIcon extends StatelessWidget {
  const _WeChatSvgIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.authLoginWeChat,
      width: 24,
      height: 24,
    );
  }
}
