import Foundation
import UIKit

protocol CheckoutViewControllerDelegate: class {
    func userSelectsCurrencyChange()
}

final class CheckoutViewController: UIViewController {
    weak var delegate: CheckoutViewControllerDelegate?

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

    func selected(currency: String, rate: Decimal) {
        viewModel.update(currency: currency, rate: rate)
        checkoutView.priceLabel.text = viewModel.priceString
    }

    private func setupView() {
        checkoutView.priceLabel.text = viewModel.priceString
        checkoutView.changeCurrencyButton.addTarget(self, action: #selector(changeCurrencyButtonTapped), for: .primaryActionTriggered)
    }

    @objc
    private func changeCurrencyButtonTapped() {
        delegate?.userSelectsCurrencyChange()
    }
}
