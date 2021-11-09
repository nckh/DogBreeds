import UIKit

final class ViewControllerFactory {

  private var storyboard: UIStoryboard {
    UIStoryboard(name: "Main", bundle: nil)
  }

  func makeRandomBreedViewController(presenter: RandomDogBreedPresenting) -> RandomDogBreedViewController {
    storyboard.instantiateViewController(identifier: "RandomDogBreed") { coder in
      RandomDogBreedViewController(coder: coder, presenter: presenter)
    }
  }

}
