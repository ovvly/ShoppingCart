import Foundation
import UIKit

final class CheckoutViewController: UIViewController {
    private let viewModel: CheckoutViewModel
    private let checkoutView = CheckoutView()

    init(viewModel: CheckoutViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Used unimplemented initializer")
    }

    override func loadView() {
        view = checkoutView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        checkoutView.priceLabel.text = viewModel.priceString
    }
}
