class Article {
  final String title;
  final String description;
  final String date;
  final String image;

  Article({
    required this.title,
    required this.description,
    required this.date,
    required this.image,
  });
}

List<Article> articles = [
  Article(
    title: "Perseid Meteor Shower",
    description:
        "One of the most popular meteor showers of the year, the Perseids occur every August. Known for its bright meteors and high frequency, it's a great event for stargazing enthusiasts.",
    date: "August 2024",
    image: "images/meteor.jpeg",
  ),
  Article(
    title: "Geminid Meteor Shower",
    description:
        "The Geminid meteor shower happens every December and is famous for its vibrant meteors. It's one of the most reliable and spectacular showers of the year.",
    date: "December 2024",
    image: "images/meteor2.jpeg",
  ),
  Article(
    title: "Solar Eclipse",
    description:
        "A total solar eclipse will be visible in certain regions in 2024. This rare celestial event occurs when the Moon completely blocks the Sun's light, turning day into night.",
    date: "April 8, 2024",
    image: "images/solar.webp",
  ),
  Article(
    title: "Starlink Satellites",
    description:
        "The launch of SpaceX's Starlink satellites provides a unique opportunity to see 'satellite trains' pass across the night sky. These satellites are part of a network designed to provide global internet access.",
    date: "Ongoing (2024)",
    image: "images/Starlink Satellites.jpeg",
  ),
  Article(
    title: "Hubble Space Telescope Anniversary",
    description:
        "The Hubble Space Telescope has been in operation since 1990, revolutionizing our understanding of the universe. Its anniversary is a reminder of the incredible discoveries it has made about stars, galaxies, and more.",
    date: "April 24, 2024",
    image: "images/Hubble Space Telescope Anniversary.jpeg",
  ),
  Article(
    title: "The Orion Nebula",
    description:
        "The Orion Nebula, one of the brightest nebulae visible to the naked eye, is a stellar nursery where new stars are born. It's a popular target for astronomers and stargazers alike.",
    date: "Year-round",
    image: "images/The Orion Nebula.jpeg",
  ),
  Article(
    title: "Supernova Observations",
    description:
        "A supernova is the explosion of a star, and while they are rare, they offer valuable insights into the life cycle of stars. Observing these explosions helps scientists learn about stellar evolution.",
    date: "Ongoing (2024)",
    image: "images/Supernova Observations.jpeg",
  ),
  Article(
    title: "Total Lunar Eclipse",
    description:
        "During a total lunar eclipse, the Earth casts its shadow on the Moon, giving it a striking red color. These events are both beautiful and scientifically significant.",
    date: "May 15, 2025",
    image: "images/Total Lunar Eclipse.webp",
  ),
];
