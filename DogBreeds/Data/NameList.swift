struct NameList: Decodable {

  let dogBreeds: [String]

  private enum CodingKeys: String, CodingKey {
    case dogBreeds = "DogBreeds"
  }

}
