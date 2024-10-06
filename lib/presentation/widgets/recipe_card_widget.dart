import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/data/model/recipe_data_model.dart';

class RecipeCard extends StatelessWidget {

  final RecipeDataModel recipeDataModel;
  const RecipeCard({
    super.key,
    required this.recipeDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(recipeDataModel.title ?? "", style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600
                )
            ),),
            const SizedBox(height: 8,),
            Text("Ingredients: ", style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                )
            ),),
            Text(recipeDataModel.ingredients ?? '', style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 18,
                )
            ),),
            const SizedBox(height: 8,),
            Text("Servings: ", style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                )
            ),),
            Text(recipeDataModel.servings ?? "", style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 18,
                )
            ),),
            const SizedBox(height: 16,),

            Text("Instructions: ", style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              )
            ),),
            Text(recipeDataModel.instructions ?? "", style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 18,
                )
            ),),
          ],
        ),
      ),
    );
  }
}