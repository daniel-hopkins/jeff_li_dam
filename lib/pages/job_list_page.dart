import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobListPage extends ConsumerStatefulWidget {
  const JobListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobListPageState();
}

class _JobListPageState extends ConsumerState<JobListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text('ag'),
    );
  }
}
