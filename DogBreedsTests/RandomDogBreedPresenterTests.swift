import XCTest
@testable import DogBreeds

final class RandomDogBreedPresenterTests: XCTestCase {

  private var presenter: RandomDogBreedPresenter!
  private var presenterViewMock: RandomDogBreedPresenterViewMock!
  private var providerFake: DogBreedProvidingFake!

  override func setUp() {
    providerFake = DogBreedProvidingFake()
    presenterViewMock = RandomDogBreedPresenterViewMock()

    presenter = RandomDogBreedPresenter(dogBreedProvider: providerFake)
    presenter.presenterView = presenterViewMock
  }

  func testShowRandomDogBreedWhenViewDidLoad() {
    providerFake.dogBreed = DogBreed(name: "Zombie Dog")
    presenter.viewDidLoad()

    XCTAssertEqual(presenterViewMock.labelText, "Zombie Dog")
  }

  func testShowRandomDogBreedWhenButtonTapped() {
    providerFake.dogBreed = DogBreed(name: "Robodog")
    presenter.buttonTapped()

    XCTAssertEqual(presenterViewMock.labelText, "Robodog")
  }

}

// MARK: -

private final class RandomDogBreedPresenterViewMock: RandomDogBreedPresenterView {

  private(set) var labelText: String?

  func setLabelText(_ string: String) {
    labelText = string
  }

}

private final class DogBreedProvidingFake: DogBreedProviding {

  var dogBreed: DogBreed?

  func randomDogBreed() -> DogBreed? {
    dogBreed
  }

}
