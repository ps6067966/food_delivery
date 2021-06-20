class APIPath {
  static String myBag(String uid)
  => 'users/$uid/myBag/';

  static String myBagItemId(String uid,String bagItemId)
  => 'users/$uid/myBag/$bagItemId';

  static String topFoods()
  => 'admin/foods/topFoods/';

  static String pizzas()
  => 'admin/foods/pizzas/';

  static String burgers()
  => 'admin/foods/burgers/';

  static String sandwich()
  => 'admin/foods/sandwich/';

  static String bevarege()
  => 'admin/foods/bevarege/';

  static String chinese()
  => 'admin/foods/chinese/';

  static String desserts()
  => 'admin/foods/desserts/';
}