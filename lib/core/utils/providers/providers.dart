import 'package:ai_task/screens/mainScreen/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

providers(){
  return [
    BlocProvider(create: (context) => HomeCubit(),),
  ];
}