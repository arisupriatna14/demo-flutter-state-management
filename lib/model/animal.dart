class Animal {
  final String name;
  final String imageUri;
  final String origin;

  Animal({
    this.name,
    this.imageUri,
    this.origin
  });
}

List<Animal> dataAnimal = [
  Animal(
    name: 'Persian Cat',
    imageUri: 'https://www.aaha.org/contentassets/f557d057200b4d7197d67acce3ea725f/image9iii.png',
    origin: 'Iran'
  ),
  Animal(
    name: 'Koala',
    imageUri: 'https://resize.hswstatic.com/w_907/gif/koalas-1.jpg',
    origin: 'Australia'
  ),
  Animal(
    name: 'Panda',
    imageUri: 'https://asset.kompas.com/crops/N4OSinpgj4CQl1xqfAGCSJQdwrM=/0x77:1000x577/750x500/data/photo/2017/11/29/3672865328.jpg',
    origin: 'China'
  )
];

