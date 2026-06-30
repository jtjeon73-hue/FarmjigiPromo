import 'package:flutter_test/flutter_test.dart';
import 'package:farmjigipromo/main.dart';

void main() {
  testWidgets('랜딩 페이지 히어로 섹션이 표시된다', (WidgetTester tester) async {
    await tester.pumpWidget(const FarmjigiPromoApp());

    expect(find.text('팜지기'), findsWidgets);
    expect(find.text('스마트 농장 관리 플랫폼'), findsWidgets);
    expect(find.text('앱 미리보기'), findsWidgets);
  });
}
