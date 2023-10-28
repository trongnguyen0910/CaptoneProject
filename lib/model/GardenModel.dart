class GardenModel {
  final String name;
  final String description;
  final String region;
  final String nameFarmer;

  const GardenModel({
    required this.name,
    required this.description,
     required this.region,
    required this.nameFarmer,
  });
  static const List<GardenModel> gardenModel = [
    GardenModel(
        name: 'Farm 1',
        description:
            'Farm Description 1',
        region:'Region 1',
        nameFarmer:'Farmer User 1',),
    GardenModel(
        name: 'Farm 2',
        description:
            'Farm Description 2',
        region:'Region 1',
        nameFarmer:'Farmer User 2',),
    GardenModel(
        name: 'Farm 3',
        description:
            'Farm Description 3',
        region:'Region 2',
        nameFarmer:'Farmer User 3',),
    GardenModel(
        name: 'Farm 4',
        description:
            'Farm Description 4',
        region:'Region 2',
        nameFarmer:'Farmer User 4',),
    GardenModel(
        name: 'Farm 5',
        description:
            'Farm Description 5',
        region:'Region 1',
        nameFarmer:'Farmer User 5',),
    GardenModel(
        name: 'Farm 6',
        description:
            'Farm Description 6',
        region:'Region 1',
        nameFarmer:'Farmer User 6',),
    
    
   
  ];
}
