import Foundation

struct NameProvider {

  private let nameList: NameList

  init() {
    guard let url = Bundle.main.url(forResource: "Strings", withExtension: "plist") else {
      fatalError("Could not find Strings.plist in module")
    }

    let decoder = PropertyListDecoder()
    do {
      let data = try Data(contentsOf: url)
      self.nameList = try decoder.decode(NameList.self, from: data)
    } catch {
      fatalError("Could not decode property list into a `NameList` instance")
    }
  }

}

// MARK: - DogBreedProviding

extension NameProvider: DogBreedProviding {

  func randomDogBreed() -> DogBreed? {
    guard let name = nameList.dogBreeds.randomElement() else { return nil }
    return DogBreed(name: name)
  }

}
