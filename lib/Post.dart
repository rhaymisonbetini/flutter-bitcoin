class Post {
  int _userId;
  int _id;
  String _title;
  String _body;

  Post(this._userId, this._id, this._title, this._body);

  // ignore: unnecessary_getters_setters
  String get body => _body;

  // ignore: unnecessary_getters_setters
  set body(String value) {
    _body = value;
  }

  // ignore: unnecessary_getters_setters
  String get title => _title;

  // ignore: unnecessary_getters_setters
  set title(String value) {
    _title = value;
  }

  // ignore: unnecessary_getters_setters
  int get id => _id;

  // ignore: unnecessary_getters_setters
  set id(int value) {
    _id = value;
  }

  // ignore: unnecessary_getters_setters
  int get userId => _userId;

  // ignore: unnecessary_getters_setters
  set userId(int value) {
    _userId = value;
  }
}
