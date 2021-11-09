import UIKit

final class Coordinator {

  private let window: UIWindow

  private let viewControllerFactory = ViewControllerFactory()

  init(window: UIWindow) {
    self.window = window

    showRandomBreed()
    window.makeKeyAndVisible()
  }

  func showRandomBreed() {
    let nameProvider = NameProvider()
    let presenter = RandomDogBreedPresenter(dogBreedProvider: nameProvider)
    let viewController = viewControllerFactory.makeRandomBreedViewController(presenter: presenter)
    presenter.presenterView = viewController

    window.rootViewController = viewController
  }

}
