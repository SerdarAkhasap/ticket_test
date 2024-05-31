import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_plane_ticket/app/app.dart';
import 'package:online_plane_ticket/app/components/stub.dart';
import 'package:online_plane_ticket/app/pages/home/flight_settings_view.dart';
import 'package:online_plane_ticket/app/pages/home/home_controller.dart';
import 'package:online_plane_ticket/app/pages/home/home_view.dart';
import 'package:online_plane_ticket/app/pages/ticket_search/ticket_search_view.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routes = GoRouter(navigatorKey: _rootNavigatorKey, routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, child) => App(child: child),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(navigatorKey: _shellNavigatorKey, routes: [
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) => NoTransitionPage<void>(child: HomePage()),
            routes: [
              GoRoute(
                  path: 'stub',
                  name: 'stub',
                  pageBuilder: (context, state) => const NoTransitionPage<void>(child: Stub()),
              ),
              GoRoute(
                path: 'flight-settings',
                name: 'flight-settings',
                pageBuilder: (context, state) =>  NoTransitionPage<void>(child: FlightSettingsView(
                  homeController: state.extra as HomeController,
                )),
              ),
              GoRoute(
                path: 'ticket-search',
                name: 'ticket-search',
                pageBuilder: (context, state) =>   NoTransitionPage<void>(child: TicketSearchView()),
              ),
            ]
          ),
          // GoRoute(
          //     path: '/',
          //     name: 'home',
          //     pageBuilder: (context, state) =>
          //         NoTransitionPage<void>(child: MainPage()),
          //     routes: [
          //       GoRoute(
          //           path: 'search',
          //           pageBuilder: (context, state) => NoTransitionPage<void>(
          //             child: SearchPage(
          //               keyword: state.extra as String,
          //             ),
          //           )),
          //       GoRoute(
          //         path: 'product-detail',
          //         name: 'product-detail',
          //         pageBuilder: (context, state) => NoTransitionPage<void>(
          //           child: ProductDetail(
          //               item: state.extra != null
          //                   ? (state.extra as ProductModel)
          //                   : ProductModel.emptyProduct()),
          //         ),
          //       ),
          //       GoRoute(
          //         path: 'best-products',
          //         name: 'best-products',
          //         pageBuilder: (context, state) => NoTransitionPage<void>(
          //           child: BestProductsPage(
          //             item: state.extra as BestProductsModel,
          //           ),
          //         ),
          //       ),
          //       GoRoute(
          //           path: 'category-detail',
          //           pageBuilder: (context, state) {
          //             final item = state.extra as CategoryDetailPageModel;
          //             return NoTransitionPage<void>(
          //               child: CategoryDetail(
          //                 item: item.item,
          //                 hasSubCategory: item.hasSubCategory,
          //               ),
          //             );
          //           }),
          //     ]
          //   // builder: (context, state) => NoTransitionPage<void>(child: MainPage()),
          // ),
        ]),
        // StatefulShellBranch(routes: [
        //
        // ]),
        // StatefulShellBranch(routes: [
        //
        // ]),
        // StatefulShellBranch(routes: [
        //
        // ]),
        // StatefulShellBranch(routes: [
        //
        // ]),
      ]),
]);

String getCurrentLocation(BuildContext context) {
  final router = GoRouter.of(context);
  final RouteMatch lastMatch = router.routerDelegate.currentConfiguration.last;
  final RouteMatchList matchList =
  lastMatch is ImperativeRouteMatch ? lastMatch.matches : router.routerDelegate.currentConfiguration;
  final String location = matchList.uri.toString();

  return location;
}

void changeNavBar(BuildContext context, int index) {
  switch(index) {
    case 0:
      context.go('/');
      break;
    case 1:
      context.go('/hotels');
      break;
    case 2:
      context.go('/geo');
      break;
    case 3:
      context.go('/subscriptions');
      break;
    case 4:
      context.go('/profile');
      break;
  }
}
