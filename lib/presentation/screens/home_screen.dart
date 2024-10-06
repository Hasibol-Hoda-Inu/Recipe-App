import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/data/model/recipe_data_model.dart';
import 'package:recipe_app/presentation/utility/app_color.dart';
import 'package:recipe_app/presentation/widgets/recipe_card_widget.dart';

import '../../data/model/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController textEditingController =TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<RecipeDataModel> recipeDataList = [];

  bool getRDInProgress = false;

  Future<void> getRecipeData() async {
    getRDInProgress = true;
    if (mounted) {
      setState(() {});
    }

    String url = "${Urls.dataUrl}${textEditingController.text.trim()}";
    final NetworkResponse response = await NetworkCaller.getRequest(url);

    if (response.isSuccess) {
      // Parse the response as a list
      recipeDataList = recipeDataModelFromJson(response.responseData!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Recipe data get failed")));
      }
    }
    getRDInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  bool willContainerShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe app"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          children: [
            if(willContainerShow) Expanded(child: onTapGenerateContainer(),),
            const SizedBox(height: 16,),
            Row(
              children: [
                Expanded(child:
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: "Name your recipe"
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a valid value";
                      }
                    },
                  ),
                )),
                const SizedBox(width: 10,),
                ElevatedButton(
                    onPressed: (){
                      onTapAllMethods();
                      willContainerShow = true;
                      clearFormText();
                      FocusScope.of(context).unfocus();
                      setState(() {});
                    },
                    child: const Text("Get Recipe", style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),))
              ],
            ),
            const SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }

  void onTapAllMethods(){
    if(_formKey.currentState!.validate());{
      getRecipeData();
    }
  }
  Widget onTapGenerateContainer(){
    return getRDInProgress ? const Center(child: CircularProgressIndicator(),) : ListView.separated(
      itemBuilder: (BuildContext context, index)=> RecipeCard(recipeDataModel: recipeDataList[index],),
      separatorBuilder: (BuildContext context, index)=>const SizedBox(height: 16,),
      itemCount: recipeDataList.length ?? 0,
    );
  }

  void clearFormText(){
    textEditingController.clear();
  }

  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }
}


