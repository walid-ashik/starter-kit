import 'package:equatable/equatable.dart';

class PageConfig extends Equatable {
  PageConfig({
    required String location,
    this.args,
  }) {
    path = location.isNotEmpty ? Uri.parse(location) : Uri.parse('/');
    route = path.toString();
  }

  ///full path to the page
  late final Uri path;

  ///to make it easier to use the path with different interfaces
  late final String route;

  ///page args: can be added in the path as a string literal,
  ///or manually when creating the route
  final Map<String, dynamic>? args;

  ///Our route description, this is where actual builds happen
  // late final Page page;

  @override
  String toString() {
    return 'PageConfig: path = $path, args = $args';
  }

  @override
  List<Object?> get props => [path, args];
}

///An extension function to facilitate adding nullable Maps
///(I need it in other places, declared it here for clarity)
extension AddNullableMap on Map {
  void addIfNotNull(Map? other) {
    if (other != null) {
      addAll(other);
    }
  }
}
