import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/chat_repository.dart';
import '../../data/models/chat_model.dart';

class ChatListState {
  final List<ChatModel> chats;
  final bool isLoading;
  final String? error;

  ChatListState({this.chats = const [], this.isLoading = false, this.error});
}

class ChatListCubit extends Cubit<ChatListState> {
  final ChatRepository chatRepository;

  ChatListCubit(this.chatRepository) : super(ChatListState());

  void fetchChats(String userId) {
    emit(ChatListState(isLoading: true));
    chatRepository.getChats(userId).listen((chats) {
      emit(ChatListState(chats: chats));
    }, onError: (error) {
      emit(ChatListState(error: error.toString()));
    });
  }
}