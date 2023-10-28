class TaskModel {
  final String name;
  final String status;
  final String time;

  const TaskModel({
    required this.name,
    required this.status,
     required this.time,
  });
  static const List<TaskModel> taskModel = [
    TaskModel(
        name: 'Plant 1',
        status:
            'Not Done',
        time:'2023-06-10',
        ),
    TaskModel(
        name: 'Plant 2',
        status:
            'Not Done',
        time:'2023-07-09',
        ),
    TaskModel(
        name: 'Plant 3',
        status:
            'Done',
        time:'2023-06-08',
        ),
    TaskModel(
        name: 'Plant 4',
        status:
            'Done',
         time:'2023-05-06',
        ),
    TaskModel(
        name: 'Plant 5',
        status:
            'Done',
         time:'2023-04-201',
        ),
      TaskModel(
        name: 'Plant 6',
        status:
            'Done',
         time:'2023-04-23',
        ),
  ];
}
