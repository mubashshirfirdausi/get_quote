import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/settings/presentation/provider/settings_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'common/constants/theme_constants.dart';
import 'features/auth/data/data_source/auth_local_data_source.dart';
import 'features/auth/data/data_source/auth_remote_data_source.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/usecases/check_auth_state_usecase.dart';
import 'features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'features/auth/domain/usecases/sign_out_usecase.dart';
import 'features/auth/presentations/providers/auth_provider.dart';
import 'features/auth/presentations/screens/login_screen.dart';
import 'features/quote/data/data_sources/quote_remote_data_source.dart';
import 'features/quote/data/repository/quote_repository.dart';
import 'features/quote/domain/usecases/get_quote_usecase.dart';
import 'features/quote/presentation/provider/quote_provider.dart';
import 'features/quote/presentation/screens/home_screen.dart';
import 'features/user/data/data_source/user_local_data_source.dart';
import 'features/user/data/repository/user_repository_impl.dart';
import 'features/user/domain/usecases/get_current_user_usecase.dart';
import 'features/user/presentation/providers/user_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProvider(
              signInwithGoogleUsecase: SignInwithGoogleUsecase(
                authRepository: AuthRepositoryImpl(
                  authRemoteDataSource: AuthRemoteDataSource(
                    googleSignIn: GoogleSignIn(),
                  ),
                  authLocalDataSource: AuthLocalDataSource(
                    googleSignIn: GoogleSignIn(),
                  ),
                ),
              ),
              signOutUsecase: SignOutUsecase(
                authRepository: AuthRepositoryImpl(
                  authRemoteDataSource: AuthRemoteDataSource(
                    googleSignIn: GoogleSignIn(),
                  ),
                  authLocalDataSource: AuthLocalDataSource(
                    googleSignIn: GoogleSignIn(),
                  ),
                ),
              ),
              checkAuthStateUseCase: CheckAuthStateUseCase(
                authRepository: AuthRepositoryImpl(
                  authRemoteDataSource: AuthRemoteDataSource(
                    googleSignIn: GoogleSignIn(),
                  ),
                  authLocalDataSource: AuthLocalDataSource(
                    googleSignIn: GoogleSignIn(),
                  ),
                ),
              ),
            )..checkAuthState(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserProvider(
              getCurrentUserUsecase: GetCurrentUserUsecase(
                userRepository: UserRepositoryImpl(
                  userLocalDataSource: UserLocalDataSource(
                    googleSignIn: GoogleSignIn(),
                  ),
                ),
              ),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => QuotesProvider(
              getQuoteUseCase: GetQuoteUseCase(
                quoteRepository: QuoteRepositoryImpl(
                  quoteRemoteDataSource: QuoteRemoteDataSource(),
                ),
              ),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => SettingsProvider(),
          )
        ],
        child: Consumer<SettingsProvider>(
            builder: (context, themeProvider, child) {
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: themeProvider.getTheme(Brightness.light),
            darkTheme: themeProvider.getTheme(Brightness.dark),
            home: Consumer<AuthProvider>(
              builder: (context, authProvider, child) =>
                  authProvider.isAuthenticated
                      ? const HomeScreen()
                      : const LoginScreen(),
            ),
          );
        }),
      ),
    );
  }
}
