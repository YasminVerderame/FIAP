import 'package:flutter/material.dart';
import 'package:github/components/all.dart';
import 'package:github/constants/typography.dart';
import 'package:github/mocks/repositories_mock.dart';
import 'package:github/models/repository.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final list = kRepositoriesMock;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(bottom: CustomSearchBar(onChanged: (search) => debugPrint('search'),
      onPressed: () {},),
      ),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
           const CustomText(
            text: "Resultado", 
            style: TypographyType.title,),
           ListView.separated(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index){
              Repository repository = list[index];
        
              return ListTile(
                leading: CustomAvatar(
                  avatarUrl: repository.owner?.avatar,),
                  title: CustomText(
                    text: '${repository.name}',
                    style: TypographyType.body),
                  subtitle: CustomText( text: repository.owner?.login ?? '-',
                  style: TypographyType.body ),
              );
            },
            separatorBuilder: (context, index){
              return const CustomDivider();
            },
           )
          ],
              ),
        )),

    );
  }
}