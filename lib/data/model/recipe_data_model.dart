class RecipeDataModel {
  String? title;
  String? ingredients;
  String? servings;
  String? instructions;

  RecipeDataModel({
    this.title,
    this.ingredients,
    this.servings,
    this.instructions,
  });

  // Factory constructor to create a RecipeDataModel from JSON
  factory RecipeDataModel.fromJson(Map<String, dynamic> json) {
    return RecipeDataModel(
      title: json['title'],
      ingredients: json['ingredients'],
      servings: json['servings'],
      instructions: json['instructions'],
    );
  }

  // Convert RecipeDataModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'ingredients': ingredients,
      'servings': servings,
      'instructions': instructions,
    };
  }
}

// Function to parse a list of JSON objects into a List of RecipeDataModel objects
List<RecipeDataModel> recipeDataModelFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => RecipeDataModel.fromJson(json)).toList();
}
