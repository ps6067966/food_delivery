class APIPath {
  static String myBag(String uid)
  => 'users/$uid/myBag/';

  static String myBagItemId(String uid,String bagItemId)
  => 'users/$uid/myBag/$bagItemId';
}