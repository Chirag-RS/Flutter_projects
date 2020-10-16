import 'package:flutterapp_bloc/models/category_model.dart';

List<CategoryModels> getCategories()
{
  List<CategoryModels> category = List<CategoryModels>();
  CategoryModels categoryModels = CategoryModels();
  //1
  categoryModels.imageUrl="https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";
  categoryModels.categoryName = "Business";

  category.add(categoryModels);

  //2
    categoryModels = CategoryModels();
    categoryModels.imageUrl="https://images.unsplash.com/photo-1459865264687-595d652de67e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";
    categoryModels.categoryName = "Sports";
    category.add(categoryModels);

  //3
  categoryModels = CategoryModels();
  categoryModels.imageUrl="https://images.unsplash.com/photo-1535378917042-10a22c95931a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";
  categoryModels.categoryName = "Technology";
  category.add(categoryModels);

  //4
  categoryModels = CategoryModels();
  categoryModels.imageUrl="https://images.unsplash.com/photo-1496169514208-d9affacc58ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80";
  categoryModels.categoryName = "Entertainment";
  category.add(categoryModels);

  //5
  categoryModels = CategoryModels();
  categoryModels.imageUrl="https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";
  categoryModels.categoryName = "General";
  category.add(categoryModels);
 return category;

}