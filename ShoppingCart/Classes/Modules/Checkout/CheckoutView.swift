import Foundation
import UIKit

final class CheckoutView: UIView {

    let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        return label
    }()

    let changeCurrencyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("Change currency", for: .normal)
        return button
    }()

    convenience init() {
        self.init(frame: CGRect.zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .white
        addSubview(priceLabel)
        addSubview(changeCurrencyButton)
        setupCustomConstraints()
    }

    private func setupCustomConstraints() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        changeCurrencyButton.translatesAutoresizingMaskIntoConstraints = false

        let margins = layoutMarginsGuide
        priceLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 30).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true

        changeCurrencyButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30).isActive = true
        changeCurrencyButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        changeCurrencyButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        changeCurrencyButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
