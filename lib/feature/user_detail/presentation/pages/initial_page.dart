import 'package:clean_code_practice/feature/user_detail/presentation/cubit/user_info_cubit.dart';
import 'package:clean_code_practice/feature/user_detail/presentation/widgets/loading_widget.dart';
import 'package:clean_code_practice/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/user_info_state.dart';
import '../widgets/message_display.dart';
import '../widgets/user_display.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<UserInfoCubit> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UserInfoCubit>(),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              BlocBuilder<UserInfoCubit, UserInfoState>(
                builder: (context, state) {
                  if (state is UserInfoInitialState) {
                    return Column(
                      children: [
                        const Center(
                          child: SizedBox(
                            height: 50,
                            child: MessageDisplay(
                              message: 'Lets start searching information',
                            ),
                          ),
                        ),
                        const SizedBox(height: 100),
                        TextButton(
                            onPressed: () {
                              context.read<UserInfoCubit>().getUserInfo();
                            },
                            child: Text(
                              "Search",
                              style: TextStyle(
                                  backgroundColor: Colors.grey.shade400,
                                  color: Colors.black,
                                  fontSize: 25),
                            )),
                      ],
                    );
                  } else if (state is UserInfoErrorState) {
                    return MessageDisplay(message: state.message);
                  } else if (state is UserInfoLoadingState) {
                    return const LoadingWidget(isLoading: true);
                  } else if (state is UserInfoLoadedState) {
                    return UserInfoDisplay(userEntity: state.userEntity);
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
