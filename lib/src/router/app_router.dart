import 'package:go_router/go_router.dart';
import 'package:so_very_good/src/editor_feature/editor_view.dart';
import 'package:so_very_good/src/router/not_found_screen.dart';

enum AppRoute { home, editor }

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    // GoRoute(
    //   path: '/',
    //   name: AppRoute.home.name,
    // ),
    GoRoute(
      path: '/',
      name: AppRoute.editor.name,
      builder: (context, state) => const EditorView(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
