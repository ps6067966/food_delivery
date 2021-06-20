class FakeDB {
  static List<Map<String, dynamic>> topFoods = [
    {
      "foodName": "Italian Pizza",
      "foodUrl":
      'https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=369&q=80',
      "foodCategory": "Dinner",
      "foodIngredients": "Tomato,cheese,capsicum,jalepano,olive",
      "foodDeliveryTime": 29,
      "foodPrice": 250,
      "isVeg": true
    },
    {
      "foodName": "Masala Dosa",
      "foodUrl":
      'https://miro.medium.com/max/5120/1*Zu0W7CSU8wzDYjC_LinO5w.jpeg',
      "foodCategory": "Dinner",
      "foodIngredients": "Tomato,cheese,capsicum,jalepano,olive",
      "foodDeliveryTime": 28,
      "foodPrice": 200,
      "isVeg": true
    },
    {
      "foodName": "Paneer Tikka",
      "foodUrl":
      'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=819&q=80',
      "foodCategory": "Dinner",
      "foodIngredients": "Tomato,cheese,Paneer",
      "foodDeliveryTime": 30,
      "foodPrice": 300,
      "isVeg": true
    },
    {
      "foodName": "Chicken Biryani",
      "foodUrl":
      'https://images.unsplash.com/photo-1512058564366-18510be2db19?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80',
      "foodCategory": "Dinner",
      "foodIngredients": "Tomato,cheese,capsicum,jalepano,olive",
      "foodDeliveryTime": 18,
      "foodPrice": 300,
      "isVeg": false
    },
    {
      "foodName": "Donuts",
      "foodUrl":
      "https://images.unsplash.com/photo-1551024601-bec78aea704b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "Donut",
      "foodDeliveryTime": 20,
      "foodPrice": 60,
      "isVeg": true,
    },
    {
      "foodName": "Momos",
      "foodUrl":
      "https://images.unsplash.com/photo-1563245372-f21724e3856d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=829&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "Momos",
      "foodDeliveryTime": 20,
      "foodPrice": 55,
      "isVeg": true,
    },
  ];

  static List<Map<String, dynamic>> pizzas = [
    {
      "foodName": "Italian Pizza",
      "foodUrl":
      'https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=369&q=80',
      "foodCategory": "Dinner",
      "foodIngredients": "Tomato,cheese,capsicum,jalepano,olive",
      "foodDeliveryTime": 29,
      "foodPrice": 250,
      "isVeg": true
    },
    {
      "foodName": "Indian Pizza",
      "foodUrl":
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=714&q=80',
      "foodCategory": "Dinner",
      "foodIngredients": "Tomato,cheese,capsicum,jalepano,olive",
      "foodDeliveryTime": 29,
      "foodPrice": 180,
      "isVeg": true
    },
    {
      "foodName": "Chinese Pizza",
      "foodUrl":
      'https://images.unsplash.com/photo-1520201163981-8cc95007dd2a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      "foodCategory": "Dinner",
      "foodIngredients": "Tomato,cheese,capsicum,jalepano,olive",
      "foodDeliveryTime": 29,
      "foodPrice": 250,
      "isVeg": false
    },
    {
      "foodName": "Neapolitan Pizza",
      "foodUrl":
      'https://images.unsplash.com/photo-1595854341625-f33ee10dbf94?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      "foodCategory": "Dinner",
      "foodIngredients": "Tomato,cheese,capsicum,jalepano,olive",
      "foodDeliveryTime": 29,
      "foodPrice": 300,
      "isVeg": true
    },
    {
      "foodName": "Chicago Pizza",
      "foodUrl":
      'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
      "foodCategory": "Dinner",
      "foodIngredients": "Tomato,cheese,capsicum,jalepano,olive",
      "foodDeliveryTime": 29,
      "foodPrice": 150,
      "isVeg": false
    },
    {
      "foodName": "California Pizza",
      "foodUrl":
      'https://images.unsplash.com/photo-1599130143407-2a6ff8a196c9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
      "foodCategory": "Dinner",
      "foodIngredients": "Tomato,cheese,capsicum,jalepano,olive",
      "foodDeliveryTime": 29,
      "foodPrice": 150,
      "isVeg": false
    },
  ];

  static List<Map<String, dynamic>> burgers = [
    {
      "foodName": "Burger",
      "foodUrl":
      "https://images.unsplash.com/photo-1586190848861-99aa4a171e90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "Burger",
      "foodDeliveryTime": 20,
      "foodPrice": 100,
      "isVeg": true,
    },
    {
      "foodName": "Cheese Burger",
      "foodUrl":
      "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1901&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "Burger",
      "foodDeliveryTime": 20,
      "foodPrice": 140,
      "isVeg": true,
    },
    {
      "foodName": "Tomato Burger",
      "foodUrl":
      "https://images.unsplash.com/photo-1610440042657-612c34d95e9f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "Burger",
      "foodDeliveryTime": 20,
      "foodPrice": 100,
      "isVeg": true,
    },
    {
      "foodName": "Full Burger",
      "foodUrl":
      "https://images.unsplash.com/photo-1611005705440-0f3997394be7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "Burger",
      "foodDeliveryTime": 20,
      "foodPrice": 100,
      "isVeg": false,
    },
  ];


  static List<Map<String, dynamic>> sandwich = [
    {
      "foodName": "Sandwich",
      "foodUrl":
      "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=753&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "Sandwich",
      "foodDeliveryTime": 20,
      "foodPrice": 70,
      "isVeg": true,
    },
    {
      "foodName": "Cheese Sandwich",
      "foodUrl":
      "https://images.unsplash.com/photo-1509722747041-616f39b57569?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80",
      "foodCategory": "Meal",
      "foodIngredients": "Sandwich",
      "foodDeliveryTime": 20,
      "foodPrice": 60,
      "isVeg": true,
    },
    {
      "foodName": "Delicious Sandwich",
      "foodUrl":
      "https://images.unsplash.com/photo-1528736235302-52922df5c122?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=822&q=80",
      "foodCategory": "Meal",
      "foodIngredients": "Sandwich",
      "foodDeliveryTime": 20,
      "foodPrice": 130,
      "isVeg": false,
    },
  ];


  static List<Map<String, dynamic>> bevarege = [
    {
      "foodName": "Pepsi",
      "foodUrl":
      "https://images.unsplash.com/photo-1546695259-ad30ff3fd643?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=889&q=80",
      "foodCategory": "Drink",
      "foodIngredients": "Pepsi",
      "foodDeliveryTime": 20,
      "foodPrice": 40,
      "isVeg": true,
    },
    {
      "foodName": "Coca Cola",
      "foodUrl":
      "https://images.unsplash.com/photo-1514218953589-2d7d37efd2dc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
      "foodCategory": "Drink",
      "foodIngredients": "Coca Cola",
      "foodDeliveryTime": 20,
      "foodPrice": 60,
      "isVeg": true,
    },
    {
      "foodName": "Apple Juice",
      "foodUrl":
      "https://images.unsplash.com/photo-1572874272417-c06a8ad7d402?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "foodCategory": "Drink",
      "foodIngredients": "Apple Juice",
      "foodDeliveryTime": 20,
      "foodPrice": 45,
      "isVeg": true,
    },
    {
      "foodName": "Mango Juice",
      "foodUrl":
      "https://images.unsplash.com/photo-1525385133512-2f3bdd039054?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=632&q=80",
      "foodCategory": "Drink",
      "foodIngredients": "Mango Juice",
      "foodDeliveryTime": 20,
      "foodPrice": 45,
      "isVeg": true,
    },
    {
      "foodName": "Pineapple Juice",
      "foodUrl":
      "https://images.unsplash.com/photo-1534353473418-4cfa6c56fd38?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
      "foodCategory": "Drink",
      "foodIngredients": "Pineapple Juice",
      "foodDeliveryTime": 20,
      "foodPrice": 45,
      "isVeg": true,
    },
  ];

  static List<Map<String, dynamic>> chinese = [
    {
      "foodName": "Maggie",
      "foodUrl":
      "https://images.unsplash.com/photo-1602833280958-1657662ccc58?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "Maggie",
      "foodDeliveryTime": 20,
      "foodPrice": 60,
      "isVeg": true,
    },
    {
      "foodName": "Momos",
      "foodUrl":
      "https://images.unsplash.com/photo-1563245372-f21724e3856d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=829&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "Momos",
      "foodDeliveryTime": 20,
      "foodPrice": 55,
      "isVeg": true,
    },
    {
      "foodName": "Meat",
      "foodUrl":
      "https://images.unsplash.com/photo-1614277786110-1a64e457c4c3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "Meat",
      "foodDeliveryTime": 20,
      "foodPrice": 55,
      "isVeg": false,
    },
  ];

  static List<Map<String, dynamic>> desserts = [
    {
      "foodName": "Donuts",
      "foodUrl":
      "https://images.unsplash.com/photo-1551024601-bec78aea704b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "Donut",
      "foodDeliveryTime": 20,
      "foodPrice": 60,
      "isVeg": true,
    },
    {
      "foodName": "Choclate Icecream",
      "foodUrl":
      "https://images.unsplash.com/photo-1563805042-7684c019e1cb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "IceCream",
      "foodDeliveryTime": 20,
      "foodPrice": 200,
      "isVeg": true,
    },
    {
      "foodName": "Delicious Cookies",
      "foodUrl":
      "https://images.unsplash.com/photo-1499636136210-6f4ee915583e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80",
      "foodCategory": "Snack",
      "foodIngredients": "IceCream",
      "foodDeliveryTime": 20,
      "foodPrice": 170,
      "isVeg": true,
    },
  ];
}
