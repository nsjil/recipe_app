class Category {
  final String name;
  final String image;

  Category({
    required this.name,
    required this.image,
  });
}

List<Category> categories = [
  Category(
      name: 'BreakFast',
      image:
          'https://media.istockphoto.com/id/533645537/photo/breakfast-with-bacon-eggs-pancakes-and-toast.jpg?s=612x612&w=0&k=20&c=TumrEwImmLi4TIVeirgynvTpHhyvt9LeiDXLci45NWg='),
  Category(
      name: 'Lunch',
      image:
          'https://t4.ftcdn.net/jpg/04/84/16/15/360_F_484161588_JxKB5H0URVd3UC5AhtGwWB7y7QghYYHs.jpg'),
  Category(
      name: 'Dinner',
      image:
          'https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?cs=srgb&dl=pexels-chanwalrus-958545.jpg&fm=jpg'),
  Category(
      name: 'Supper',
      image:
          'https://images.immediate.co.uk/production/volatile/sites/30/2014/05/Epic-summer-salad-hub-2646e6e.jpg'),
];

List<String> tag = [
  'chinies',
  'indian',
  'italian',
  'mexican',
  'thai',
  'japanese',
  'american',
  'arabian',
  'pakistani',
];

class CategoryPrefference {
  final String title;
  final String imageUrl;

  CategoryPrefference({
    required this.title,
    required this.imageUrl,
  });
}

List<CategoryPrefference> categoryPrefference = [
  CategoryPrefference(
      title: 'Easy',
      imageUrl:
          'https://pinchofyum.com/wp-content/uploads/Instant-Pot-Chicken-and-Dumplings-1-2-800x800.jpg'),
  CategoryPrefference(
      title: 'Quick',
      imageUrl:
          'https://www.eatingwell.com/thmb/P3WwF1tZ1iFaOvKQDnJthqT4kdY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Quick-Cooking-Oats-0175-1-b7bb0c5ed67a43569c1d7bae7a75ae7a.jpg'),
  CategoryPrefference(
      title: 'Beef',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXHB9-wxf4_6ClG3AHtYrwM9lZi2-AdMUCQg&s'),
  CategoryPrefference(
      title: 'Low Fat',
      imageUrl:
          'https://images.immediate.co.uk/production/volatile/sites/30/2023/03/Types-of-good-fat-aebeef1.jpg'),
];
