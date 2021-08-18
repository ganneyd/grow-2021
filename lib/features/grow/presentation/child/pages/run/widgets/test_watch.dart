// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grow_run_v1/features/grow/presentation/child/pages/run/cubit/run_page_cubit.dart';
// import 'package:grow_run_v1/features/grow/presentation/child/pages/run/cubit/run_state.dart';

// class TestWatch extends StatelessWidget {
//   ///
//   const TestWatch({required this.state}) : super(key: const Key('sdcfd'));
//   final RunPageState state;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Test For watch'),
//       ),
//       body: StreamBuilder(
//         stream: context.read<RunPageCubit>().stopWatch(),
//         builder: (BuildContext context, AsyncSnapshot<int> data) {
//           if (data.hasData) {
//             data.data;
//           }
//           return Center(
//             child: Text(
//               data.data.toString(),
//               textScaleFactor: 4,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
