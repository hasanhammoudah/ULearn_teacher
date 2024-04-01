import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_teacher/common/values/colors.dart';
import 'package:ulearn_teacher/pages/messages/message/cubit/message_cubit.dart';
import 'package:ulearn_teacher/pages/messages/message/cubit/message_state.dart';
import 'package:ulearn_teacher/pages/messages/message/message_controller.dart';
import 'package:ulearn_teacher/pages/messages/message/widgets/message_widgets.dart';
import 'package:ulearn_teacher/pages/sign_in/widgets/sign_in_widget.dart';


class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late MessagesController _messagesController;
  @override
  void didChangeDependencies() {
    _messagesController = MessagesController(context: context);
    _messagesController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: BlocBuilder<MessageCubit, MessageStates>(
          builder: (context, state) {
            return Scaffold(
             // appBar: buildAppBar('Messages'),
              body: state.loadStatus == true
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryElement,
                      ),
                    )
                  : CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25.w,
                            vertical: 0.h,
                          ),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                var item = state.message.elementAt(index);
                                return buildChatList(
                                    context, item, _messagesController);
                              },
                              childCount: state.message.length,
                            ),
                          ),
                        ),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
