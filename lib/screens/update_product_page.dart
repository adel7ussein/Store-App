import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatelessWidget {
      UpdateProductPage({super.key});
   static String id = 'update product';
   String ? productName , desc, image;
   int ? price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Update Product', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(hintText: 'Product Name',onChanged: (data){
                productName = data;
              },),
              const SizedBox(height: 10,),
              CustomTextField(hintText: 'description',onChanged: (data){
                 desc = data;
              },),
              const SizedBox(height: 10,),
              CustomTextField(hintText: 'price',inputType: TextInputType.number,
              onChanged: (data){ price = int.parse(data);},
              ),
              const SizedBox(height: 10,),
              CustomTextField(hintText: 'image',onChanged: (data){ image = data;},),
              const SizedBox(height: 50,),
              CustomButton(onTap: (){
              }, text: 'Update')
        
        
            ],
          ),
        ),
      ),
    );
  }
}