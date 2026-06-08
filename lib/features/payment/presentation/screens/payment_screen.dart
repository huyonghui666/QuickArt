import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/resource_management/app_icons.dart';
import 'package:quick_art/core/resource_management/app_video_image.dart';
import 'package:quick_art/features/payment/presentation/notifiers/payment_notifier.dart';
import 'package:quick_art/features/setting/presentation/notifiers/user_profile_notifier.dart';

/// 支付页面
class PaymentScreen extends ConsumerStatefulWidget {
  /// 构造
  const PaymentScreen({super.key});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  int _selectedPlan = 0;

  Future<void> _handleContinue() {
    final productCode = _selectedPlan == 0
        ? 'pro_100_points'
        : 'max_1000_points';
    return ref
        .read(paymentNotifierProvider.notifier)
        .createOrderAndPay(productCode: productCode);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final paymentState = ref.watch(paymentNotifierProvider);

    ref.listen<PaymentState>(paymentNotifierProvider, (previous, next) {
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage!)),
        );
        ref.read(paymentNotifierProvider.notifier).clearError();
      }

      if (next.successMessage != null &&
          next.successMessage != previous?.successMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.successMessage!)),
        );
        ref.read(paymentNotifierProvider.notifier).clearSuccess();
        ref.read(userProfileNotifierProvider.notifier).refresh();
        context.pop();
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF05062A),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppVideoImage.paymentBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF05062A).withValues(alpha: 0.74),
              ),
            ),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        _BackButton(),
                        const SizedBox(height: 120),
                        Text(
                          l10n.payment_title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          l10n.payment_subtitle,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _BenefitItem(
                          text: l10n.payment_benefit_points(
                            _selectedPlan == 0 ? 100 : 1000,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _BenefitItem(text: l10n.payment_benefit_fast),
                        const SizedBox(height: 10),
                        _BenefitItem(
                          text: l10n.payment_benefit_no_watermark,
                        ),
                        const SizedBox(height: 22),
                        Row(
                          children: [
                            Expanded(
                              child: _PriceCard(
                                isSelected: _selectedPlan == 0,
                                price: '¥ 10.00',
                                onTap: () => setState(
                                  () => _selectedPlan = 0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: _PriceCard(
                                isSelected: _selectedPlan == 1,
                                price: '¥ 50.00',
                                originalPrice: '¥ 100.00',
                                badgeText: l10n.payment_save_badge,
                                onTap: () => setState(
                                  () => _selectedPlan = 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),
                        SizedBox(
                          width: double.infinity,
                          height: 70,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF7443FF),
                                  Color(0xFFF8AE2B),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(36),
                            ),
                            child: TextButton(
                              onPressed: paymentState.isLoading
                                  ? null
                                  : _handleContinue,
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(36),
                                ),
                              ),
                              child: paymentState.isLoading
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      l10n.payment_continue,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        height: 1,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: SizedBox(
        width: 36,
        height: 36,
        child: Center(
          child: SvgPicture.asset(
            AppIcons.backPreviousPage,
            width: 22,
            height: 22,
          ),
        ),
      ),
    );
  }
}

class _BenefitItem extends StatelessWidget {
  const _BenefitItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            color: Color(0xFFF8B025),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              '✓',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}

class _PriceCard extends StatelessWidget {
  const _PriceCard({
    required this.isSelected,
    required this.price,
    required this.onTap,
    this.originalPrice,
    this.badgeText,
  });

  final bool isSelected;
  final String price;
  final String? originalPrice;
  final String? badgeText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 122,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0x33F8B025)
              : const Color(0xFF171A4A).withValues(alpha: 0.92),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFF8B025)
                : const Color(0xFF2D326B),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (badgeText != null)
              Positioned(
                top: -14,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8B025),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      badgeText!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFFF8B025),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                  if (originalPrice != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      originalPrice!,
                      style: const TextStyle(
                        color: Color(0xFF8F93BD),
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Color(0xFF8F93BD),
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
