import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:le_messager/blocs/contact.action.dart';
import 'package:le_messager/blocs/contact.state.dart';
import 'package:le_messager/global.enum.dart';
import 'package:le_messager/repositories/contact.repo.dart';

class ContactsBloc extends Bloc<ContactEvent, ContactsState> {
  ContactRepository contactRepository;
  ContactsBloc(ContactsState intialState, this.contactRepository)
      : super(intialState) {
    on<LoadAllContactsEvent>((event, emit) async {
      emit(ContactsState(
          contacts: [],
          requestState: RequestState.LOADING,
          errorMessage: "",
          curentEvent: LoadAllContactsEvent()));
      try {
        final conatcts = await contactRepository.allContacts();
        emit(ContactsState(
            contacts: conatcts,
            requestState: RequestState.LOADED,
            errorMessage: "",
            curentEvent: event));
      } catch (e) {
        emit(ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.toString(),
            curentEvent: event));
      }
    });
    on<LoadStudentsContactsEvent>((event, emit) async {
      emit(ContactsState(
          contacts: [],
          requestState: RequestState.LOADING,
          errorMessage: "",
          curentEvent: LoadStudentsContactsEvent()));
      try {
        final conatcts = await contactRepository.contactByType("Student");
        emit(ContactsState(
            contacts: conatcts,
            requestState: RequestState.LOADED,
            errorMessage: "",
            curentEvent: event));
      } catch (e) {
        emit(ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.toString(),
            curentEvent: event));
      }
    });
    on<LoadDeveloppersContactsEvent>((event, emit) async {
      emit(ContactsState(
          contacts: [],
          requestState: RequestState.LOADING,
          errorMessage: "",
          curentEvent: LoadDeveloppersContactsEvent()));
      try {
        final conatcts = await contactRepository.contactByType("Developper");
        emit(ContactsState(
            contacts: conatcts,
            requestState: RequestState.LOADED,
            errorMessage: "",
            curentEvent: event));
      } catch (e) {
        emit(ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.toString(),
            curentEvent: event));
      }
    });

    on<AddContact>((event, emit) async {
      emit(ContactsState(
          contacts: [],
          requestState: RequestState.LOADING,
          errorMessage: "",
          curentEvent: LoadDeveloppersContactsEvent()));
      try {
        final conatcts = await contactRepository.addContact(event.contact);
        emit(ContactsState(
            contacts: conatcts,
            requestState: RequestState.LOADED,
            errorMessage: "",
            curentEvent: event));
      } catch (e) {
        emit(ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.toString(),
            curentEvent: event));
      }
    });
  }
}
