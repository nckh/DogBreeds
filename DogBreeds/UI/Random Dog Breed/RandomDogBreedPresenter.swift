import os

final class RandomDogBreedPresenter {

  weak var presenterView: RandomDogBreedPresenterView?

  private let dogBreedProvider: DogBreedProviding

  init(dogBreedProvider: DogBreedProviding) {
    self.dogBreedProvider = dogBreedProvider
  }

  func showRandomDogBreed() {
    guard let dogBreed = dogBreedProvider.randomDogBreed() else {
      Logger.default.warning("No dog breed available in catalog")
      return
    }

    presenterView?.setLabelText(dogBreed.name)
  }

}

// MARK: - RandomDogBreedPresenting

extension RandomDogBreedPresenter: RandomDogBreedPresenting {

  func viewDidLoad() {
    showRandomDogBreed()
  }

  func buttonTapped() {
    showRandomDogBreed()
  }

}
