Map<String, dynamic> scenarios = {
  "scenario1": {
    "detail":
        "The sheep only eats carrots or hay. The horse only eats carrots. The cow only eats hay or grass. The pig only eats wheat, rye or carrots and the chicken only eats wheat or rye. Jim has hay and carrots and grass. Karl has grass and carrots. Otto has carrots wheat and rye. Martin has wheat and rye and Laura has carrots, wheat and rye.",
    "farmer": {
      "Karl": ["Carrots", "Grass"],
      "Otto": ["Carrots", "Wheat", "Rye"],
      "Jim": ["Carrots", "Hay"],
      "Martin": ["Wheat", "Rye"],
      "Laura": ["Carrots", "Wheat", "Rye"]
    },
    "animals": {
      "Chicken": ["Wheat", "Rye"],
      "Pig": ["Wheat", "Rye"],
      "Sheep": ["Carrots", "Hay"],
      "Cow": ["Grass", "Hay"],
      "Horse": ["Carrots"]
    },
    "score": {
      "Chicken": 5,
      "Pig": 3,
      "Sheep": 1,
      "Cow": 7,
      "Horse": 9,
    },
  },
  "scenario2": {
    "detail":
        "The sheep only eats grass. The horse eats carrots. The cow only eats carrots or grass. The pig only eats wheat, rye or carrots and the chicken only eats wheat or rye. Jim has hay and carrots and grass. Karl has grass and carrots. Otto has carrots wheat and rye. Martin has wheat and rye and Laura has carrots, wheat and rye.",
    "farmer": {
      "Karl": ["Carrots", "Grass"],
      "Otto": ["Carrots", "Wheat", "Rye"],
      "Jim": ["Carrots", "Grass", "Hay"],
      "Martin": ["Wheat", "Rye"],
      "Laura": ["Carrots", "Wheat", "Rye"]
    },
    "animals": {
      "Chicken": ["Wheat", "Rye"],
      "Pig": ["Wheat", "Rye", "Carrots"],
      "Sheep": ["Grass"],
      "Cow": ["Grass", "Carrots"],
      "Horse": ["Carrots"]
    },
    "score": {
      "Chicken": 5,
      "Pig": 3,
      "Sheep": 1,
      "Cow": 7,
      "Horse": 9,
    },
  },
  "scenario3": {
    "detail":
        "The cow only eats wheat or rye and the sheep only eats hay. The horse eats carrots. The pig only eats rye and the chicken only eats grass. Jim only has hay and carrots. Karl has wheat, while Otto has wheat and rye. Laura has grass and Martin has grass, wheat and rye.",
    "farmer": {
      "Karl": ["Wheat"],
      "Otto": ["Wheat", "Rye"],
      "Jim": ["Carrots", "Hay"],
      "Martin": ["Wheat", "Rye", "Grass"],
      "Laura": ["Grass"]
    },
    "animals": {
      "Chicken": ["Grass"],
      "Pig": ["Rye"],
      "Sheep": ["Hay"],
      "Cow": ["Wheat", "Rye"],
      "Horse": ["Carrots"]
    },
    "score": {
      "Chicken": 5,
      "Pig": 3,
      "Sheep": 1,
      "Cow": 7,
      "Horse": 9,
    },
  },
  "scenario4": {
    "detail":
        "The cow eats wheat, carrots or hay. The sheep eats hay or carrots. The horse eats hay, carrots or wheat. The pig eats rye or grass, and the chicken also eats rye or grass. Jim has hay, carrots and wheat. Karl has hay, carrots and wheat. Otto has grass and rye. Laura has rye and grass and Martin also has rye and grass.",
    "farmer": {
      "Karl": ["Wheat", "Carrots", "Hay"],
      "Otto": ["Grass", "Rye"],
      "Jim": ["Wheat", "Carrots", "Hay"],
      "Martin": ["Grass", "Rye"],
      "Laura": ["Grass", "Rye"]
    },
    "animals": {
      "Chicken": ["Rye", "Grass"],
      "Pig": ["Rye", "Grass"],
      "Sheep": ["Hay", "Carrots"],
      "Cow": ["Wheat", "Carrots", "Hay"],
      "Horse": ["Wheat", "Carrots", "Hay"]
    },
    "score": {
      "Chicken": 5,
      "Pig": 3,
      "Sheep": 1,
      "Cow": 7,
      "Horse": 9,
    },
  },
  "scenario5": {
    "detail":
        "The cow eats wheat or carrots, and the sheep eats hay, rye or grass. The horse eats carrots or wheat. The pig eats hay or rye. The chicken eats grass, rye or hay. Jim has hay, rye and grass. Karl has carrots and wheat. Otto has wheat and carrots. Laura has wheat and carrots and Martin has wheat and carrots.",
    "farmer": {
      "Karl": ["Wheat", "Carrots"],
      "Otto": ["Wheat", "Carrots"],
      "Jim": ["Hay", "Rye", "Grass"],
      "Martin": ["Wheat", "Carrots"],
      "Laura": ["Wheat", "Carrots"]
    },
    "animals": {
      "Chicken": ["Grass", "Rye", "Hay"],
      "Pig": ["Rye", "Hay"],
      "Sheep": ["Hay", "Rye", "Grass"],
      "Cow": ["Wheat", "Carrots"],
      "Horse": ["Carrots", "Wheat"]
    },
    "score": {
      "Chicken": 5,
      "Pig": 3,
      "Sheep": 1,
      "Cow": 7,
      "Horse": 9,
    },
  },
  "scenario6": {
    "detail":
        "The cow eats wheat or rye. The sheep eats hay. The horse eats wheat. The pig eats rye. The chicken eats grass. Jim has hay and wheat. Karl has carrots. Otto has wheat. Laura has rye and Martin has rye and grass.",
    "farmer": {
      "Karl": ["Carrots"],
      "Otto": ["Wheat"],
      "Jim": ["Hay", "Wheat"],
      "Martin": ["Rye", "Grass"],
      "Laura": ["Rye"]
    },
    "animals": {
      "Chicken": ["Grass"],
      "Pig": ["Rye"],
      "Sheep": ["Hay"],
      "Cow": ["Wheat", "Rye"],
      "Horse": ["Wheat"]
    },
  },
  "scenario7": {
    "detail":
        "The cow eats grass. The sheep eats wheat or rye. The horse eats carrots. The pig eats grass and the chicken eats hay. Jim has carrots, wheat and rye. Karl has carrots and hay. Otto has carrots and grass. Laura has grass, wheat and rye. Martin has grass.",
    "farmer": {
      "Karl": ["Carrots", "Hay"],
      "Otto": ["Carrots", "Grass"],
      "Jim": ["Carrots", "Wheat", "Hay"],
      "Martin": ["Grass"],
      "Laura": ["Grass", "Wheat", "Rye"]
    },
    "animals": {
      "Chicken": ["Hay"],
      "Pig": ["Grass"],
      "Sheep": ["Wheat", "Rye"],
      "Cow": ["Grass"],
      "Horse": ["Carrots"]
    },
    "score": {
      "Chicken": 5,
      "Pig": 3,
      "Sheep": 1,
      "Cow": 7,
      "Horse": 9,
    },
  },
};

// every scenario should make sure the number of farmers and the animals are the same, so that players can get the maximum matching
class ScenarioData {
  static const farmerNumber = 5;
  static const animalNumber = 5;
}
