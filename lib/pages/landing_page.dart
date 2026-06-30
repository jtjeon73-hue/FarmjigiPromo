import 'package:flutter/material.dart';
import 'package:farmjigipromo/theme/app_theme.dart';
import 'package:farmjigipromo/widgets/landing_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _HeroSection(),
            _ValuesSection(),
            _FeaturesSection(),
            _AppPreviewSection(),
            _RecommendSection(),
            _RoadmapSection(),
            _FaqSection(),
            _CtaSection(),
            _FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
      ),
      child: SectionContainer(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.fromLTRB(24, 72, 24, 64),
        child: Column(
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.25),
                  width: 1.5,
                ),
              ),
              child: const Icon(
                Icons.eco_rounded,
                size: 48,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '베타 개발 중 · 프로모션 사이트',
                style: TextStyle(
                  color: AppColors.accentLight,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '팜지기',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.textOnPrimary,
                    fontSize: MediaQuery.sizeOf(context).width < 600 ? 34 : 42,
                    letterSpacing: 2,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              '스마트 농장 관리 플랫폼',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textOnPrimary.withValues(alpha: 0.75),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '온실·축사 환경을 실시간으로 모니터링하고,\n장비를 원격 제어하며, 에너지·정비·일일 보고서를 관리하세요.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textOnPrimary.withValues(alpha: 0.85),
                  ),
            ),
            const SizedBox(height: 36),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () =>
                      showComingSoonDialog(context, '앱 미리보기'),
                  icon: const Icon(Icons.phone_android, size: 20),
                  label: const Text('앱 미리보기'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: AppColors.primaryDark,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () => _launchEmail(),
                  icon: const Icon(Icons.mail_outline, size: 20),
                  label: const Text('문의하기'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textOnPrimary,
                    side: BorderSide(
                      color: AppColors.textOnPrimary.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'farmjigi@example.com',
      query: 'subject=팜지기 문의',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _ValuesSection extends StatelessWidget {
  static const _values = [
    (
      Icons.sensors_rounded,
      '실시간 모니터링',
      '온도, 습도, CO₂, 조도, 토양 습도 등 환경 데이터를 한눈에 확인합니다.',
      AppColors.error,
    ),
    (
      Icons.settings_remote_rounded,
      '원격 제어',
      '온풍기, 관수 펌프, 환기 팬을 앱에서 원격으로 켜고 끌 수 있습니다.',
      AppColors.primary,
    ),
    (
      Icons.agriculture_rounded,
      '농장 관리',
      '농장 등록·편집과 온실·축사별 운영 정보를 체계적으로 관리합니다.',
      AppColors.success,
    ),
    (
      Icons.bar_chart_rounded,
      '데이터 분석',
      '24시간 환경 추이와 7일 데이터 차트로 운영 패턴을 파악합니다.',
      AppColors.info,
    ),
    (
      Icons.bolt_rounded,
      '에너지 관리',
      '조명·난방·급수 등 에너지 사용 비율과 예상 전기 요금을 확인합니다.',
      AppColors.warning,
    ),
    (
      Icons.assignment_rounded,
      '정비·기록',
      '정비 이력, 운영 알림, 작물 성장 일일 보고서를 기록하고 관리합니다.',
      AppColors.accent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        children: [
          const SectionHeader(
            title: '팜지기가 돕는 일',
            subtitle: '농장 운영에 필요한 모니터링, 제어, 분석, 기록을 하나의 앱에서.',
          ),
          ResponsiveGrid(
            children: _values
                .map(
                  (v) => InfoCard(
                    icon: v.$1,
                    title: v.$2,
                    description: v.$3,
                    iconColor: v.$4,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _FeaturesSection extends StatelessWidget {
  static const _features = [
    (
      Icons.dashboard_rounded,
      '팜지기 대시보드',
      '실시간 운영 현황과 센서 요약, 24시간 온도 추이를 확인합니다.',
      '베타',
    ),
    (
      Icons.add_location_alt_rounded,
      '농장 등록·관리',
      '농장 이름, 위치, 종류(온실·축사), 운영 방식을 등록하고 관리합니다.',
      '베타',
    ),
    (
      Icons.toggle_on_rounded,
      '장비 원격 제어',
      '온풍기, 관수 펌프, 환기 팬의 켜짐/꺼짐 상태를 원격으로 제어합니다.',
      '베타',
    ),
    (
      Icons.pie_chart_rounded,
      '에너지 사용량',
      '조명·난방·급수·기타 에너지 비율과 월별 사용량을 분석합니다.',
      '베타',
    ),
    (
      Icons.build_circle_outlined,
      '정비 이력',
      '설비 정비 기록과 운영 알림 내역을 확인하고 관리합니다.',
      '베타',
    ),
    (
      Icons.description_outlined,
      '일일 보고서',
      '작물 성장 및 환경 일일 보고서를 작성하고 열람합니다.',
      '베타',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.surfaceVariant,
      child: Column(
        children: [
          const SectionHeader(
            title: '주요 기능 미리보기',
            subtitle: '앱에서 개발·테스트 중인 핵심 기능입니다. 일부 데이터는 데모로 표시될 수 있습니다.',
          ),
          ResponsiveGrid(
            children: _features
                .map(
                  (f) => InfoCard(
                    icon: f.$1,
                    title: f.$2,
                    description: f.$3,
                    badge: f.$4,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _AppPreviewSection extends StatelessWidget {
  static const _tabs = [
    ('홈', '팜지기 대시보드', Icons.home_rounded),
    ('제어', '농장 제어 및 관리', Icons.tune_rounded),
    ('분석', '데이터 분석 및 리포트', Icons.analytics_rounded),
    ('기록', '운영 알림 및 기록', Icons.history_rounded),
    ('설정', '계정 및 설정', Icons.settings_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        children: [
          const SectionHeader(
            title: '앱 화면 구성',
            subtitle: 'Farmjigi 앱의 5개 메인 탭 구조를 미리 살펴보세요.',
          ),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: AppColors.primary.withValues(alpha: 0.1)),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.surface, AppColors.surfaceVariant],
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.eco_rounded, color: AppColors.accent, size: 20),
                        SizedBox(width: 8),
                        Text(
                          '팜지기 대시보드',
                          style: TextStyle(
                            color: AppColors.textOnPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ..._tabs.map(
                    (tab) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(tab.$3, color: AppColors.primary, size: 20),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tab.$1,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  tab.$2,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        fontSize: 16,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.textSecondary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendSection extends StatelessWidget {
  static const _items = [
  '온실·축사 환경을 스마트하게 관리하고 싶은 농장 운영자',
  '온풍기·펌프·환기 팬을 원격으로 제어하고 싶은 분',
  '에너지 사용량과 전기 요금을 한눈에 파악하고 싶은 농가',
  '정비 이력과 일일 보고서를 체계적으로 기록하고 싶은 분',
  '여러 농장을 등록해 통합 관리하고 싶은 스마트팜 운영자',
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.surfaceVariant,
      child: Column(
        children: [
          const SectionHeader(title: '이런 분들께 추천합니다'),
          ...List.generate(_items.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                elevation: 0,
                color: AppColors.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(
                    color: AppColors.primary.withValues(alpha: 0.08),
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: Text(
                      '${i + 1}',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  title: Text(
                    _items[i],
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _RoadmapSection extends StatelessWidget {
  static const _steps = [
    ('1단계', '프로모션 사이트 공개', true),
    ('2단계', '농장 등록·관리 기능', true),
    ('3단계', '원격 제어·센서 모니터링', true),
    ('4단계', '에너지·정비·일일 보고서', true),
    ('5단계', '정식 출시 준비', false),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        children: [
          const SectionHeader(
            title: '현재 준비 단계',
            subtitle: 'Farmjigi 앱은 베타 개발 중이며, 단계적으로 기능을 안정화하고 있습니다.',
          ),
          ...List.generate(_steps.length, (i) {
            final step = _steps[i];
            final isActive = step.$3;
            final isLast = i == _steps.length - 1;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.primary
                            : AppColors.surfaceVariant,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isActive ? Icons.check_rounded : Icons.circle,
                        size: isActive ? 20 : 10,
                        color: isActive ? Colors.white : AppColors.primary,
                      ),
                    ),
                    if (!isLast)
                      Container(
                        width: 2,
                        height: 40,
                        color: AppColors.primary.withValues(alpha: 0.2),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.$1,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: isActive
                                ? AppColors.primary
                                : AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          step.$2,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: isActive
                                    ? AppColors.textPrimary
                                    : AppColors.textSecondary,
                              ),
                        ),
                        if (isActive && i < 4)
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              '베타 개발 중',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        if (i == 4)
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              '다음 목표',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _FaqSection extends StatelessWidget {
  static const _faqs = [
    (
      '팜지기는 어떤 앱인가요?',
      '온실·축사 등 농장 환경을 모니터링하고, 장비를 원격 제어하며, 에너지·정비·일일 보고서를 관리하는 스마트 농장 관리 앱입니다.',
    ),
    (
      '지금 바로 사용할 수 있나요?',
      '현재 베타 개발 단계입니다. 핵심 기능은 동작하지만, 일부 화면은 데모 데이터로 표시될 수 있으며 정식 출시 전까지 개선이 이어집니다.',
    ),
    (
      '어떤 장비를 원격 제어할 수 있나요?',
      '온풍기, 관수 펌프, 환기 팬의 켜짐/꺼짐 상태를 앱에서 제어할 수 있습니다. 실제 설비 연동 범위는 농장 환경에 따라 달라질 수 있습니다.',
    ),
    (
      '어떤 센서 데이터를 볼 수 있나요?',
      '온도, 습도, CO₂, 조도, 토양 습도 등 환경 데이터를 대시보드와 차트로 확인할 수 있습니다. 실시간 센서 연동은 단계적으로 확대할 예정입니다.',
    ),
    (
      '농장을 여러 개 등록할 수 있나요?',
      '네. 농장 등록·편집 기능을 통해 여러 농장을 관리할 수 있도록 설계되어 있습니다.',
    ),
    (
      '문의나 피드백은 어떻게내나요?',
      '하단 문의하기 버튼을 통해 의견을 보내주시면 서비스 개선에 반영하겠습니다.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.surfaceVariant,
      child: Column(
        children: [
          const SectionHeader(title: '자주 묻는 질문'),
          ..._faqs.map(
            (faq) => Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 10),
              color: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(
                  color: AppColors.primary.withValues(alpha: 0.08),
                ),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    'Q. ${faq.$1}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'A. ${faq.$2}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
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

class _CtaSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: SectionContainer(
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            Text(
              '팜지기와 함께\n스마트 농장을 시작하세요',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppColors.textOnPrimary,
                    fontSize:
                        MediaQuery.sizeOf(context).width < 600 ? 24 : 28,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              '베타 개발 중인 팜지기의 출시 소식과 업데이트를 기다려 주세요.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textOnPrimary.withValues(alpha: 0.75),
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      showComingSoonDialog(context, '앱 미리보기'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: AppColors.primaryDark,
                  ),
                  child: const Text('앱 미리보기'),
                ),
                OutlinedButton(
                  onPressed: () => _launchEmail(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textOnPrimary,
                    side: BorderSide(
                      color: AppColors.textOnPrimary.withValues(alpha: 0.5),
                    ),
                  ),
                  child: const Text('문의하기'),
                ),
                OutlinedButton(
                  onPressed: () =>
                      showComingSoonDialog(context, '출시 소식 받기'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textOnPrimary,
                    side: BorderSide(
                      color: AppColors.textOnPrimary.withValues(alpha: 0.5),
                    ),
                  ),
                  child: const Text('출시 소식 받기'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'farmjigi@example.com',
      query: 'subject=팜지기 문의',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryDark,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              const Text(
                '팜지기',
                style: TextStyle(
                  color: AppColors.textOnPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '스마트 농장 관리 플랫폼',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Farmjigi · 베타 개발 중',
                style: TextStyle(
                  color: AppColors.textOnPrimary.withValues(alpha: 0.5),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '© ${DateTime.now().year} 팜지기. All rights reserved.',
                style: TextStyle(
                  color: AppColors.textOnPrimary.withValues(alpha: 0.35),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
