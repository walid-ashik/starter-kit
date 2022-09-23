import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

extension BlocExtensions<Event, State> on Bloc<Event, State> {
  Stream<State> get behaviorStream {
    final _behaviorSubject = BehaviorSubject.seeded(state);
    _behaviorSubject
        .addStream(stream)
        .then<void>((value) => _behaviorSubject.close());
    return _behaviorSubject.stream;
  }
}

extension CubitExtensions<Event, State> on Cubit<State> {
  Stream<State> get behaviorStream {
    final _behaviorSubject = BehaviorSubject.seeded(state);
    _behaviorSubject
        .addStream(stream)
        .then<void>((value) => _behaviorSubject.close());
    return _behaviorSubject.stream;
  }
}
