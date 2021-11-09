import UIKit

class RandomDogBreedViewController: UIViewController {

  private let presenter: RandomDogBreedPresenting

  @IBOutlet private weak var label: UILabel!

  init?(coder: NSCoder, presenter: RandomDogBreedPresenting) {
    self.presenter = presenter

    super.init(coder: coder)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    presenter.viewDidLoad()
  }

}

extension RandomDogBreedViewController {

  @IBAction private func buttonTapped() {
    presenter.buttonTapped()
  }

}

// MARK: - RandomDogBreedPresenterView

extension RandomDogBreedViewController: RandomDogBreedPresenterView {

  func setLabelText(_ string: String) {
    label.text = string
  }

}
