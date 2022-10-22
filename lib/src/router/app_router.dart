import 'package:go_router/go_router.dart';
import 'package:so_very_good/src/editor_feature/editor_view.dart';
import 'package:so_very_good/src/router/not_found_screen.dart';
import 'package:so_very_good/src/save_feature/save_page.dart';

enum AppRoute { home, editor }

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.editor.name,
      builder: (context, state) => const EditorView(),
      routes: [
        GoRoute(
          path: 'save',
          name: AppRoute.home.name,
          builder: (context, state) => const SaveView(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
