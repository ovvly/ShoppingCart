import UIKit

final class ProductCell: UITableViewCell {
    static let identifier = "ProductCell"

    let productNameLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    let unitLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    let priceLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()

    let increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .darkGray
        return button
    }()

    let decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = .darkGray
        return button
    }()

    let amountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "0"
        return label
    }()

    var increaseAction: (()-> ())?
    var decreaseAction: (()-> ())?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none

        setupCell()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        increaseAction = nil
        decreaseAction = nil
    }

    private func setupCell() {
        addSubviews()
        setupActions()
        setupCustomConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(productNameLabel)
        contentView.addSubview(unitLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(increaseButton)
        contentView.addSubview(decreaseButton)
        contentView.addSubview(amountLabel)
    }

    private func setupActions() {
        increaseButton.addTarget(self, action: #selector(increaseButtonTapped), for: .primaryActionTriggered)
        decreaseButton.addTarget(self, action: #selector(decreaseButtonTapped), for: .primaryActionTriggered)
    }

    @objc
    private func increaseButtonTapped() {
        increaseAction?()
    }

    @objc
    private func decreaseButtonTapped() {
        decreaseAction?()
    }

    private func setupCustomConstraints() {
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        increaseButton.translatesAutoresizingMaskIntoConstraints = false
        decreaseButton.translatesAutoresizingMaskIntoConstraints = false

        let margins = layoutMarginsGuide
        productNameLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true

        unitLabel.leadingAnchor.constraint(equalTo: productNameLabel.trailingAnchor).isActive = true
        unitLabel.widthAnchor.constraint(equalTo: productNameLabel.widthAnchor).isActive = true
        unitLabel.centerYAnchor.constraint(equalTo: productNameLabel.centerYAnchor).isActive = true

        priceLabel.leadingAnchor.constraint(equalTo: unitLabel.trailingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: unitLabel.widthAnchor).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: productNameLabel.centerYAnchor).isActive = true

        amountLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20).isActive = true
        amountLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        amountLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        amountLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        amountLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true

        increaseButton.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor).isActive = true
        increaseButton.leadingAnchor.constraint(equalTo: amountLabel.trailingAnchor, constant: 20).isActive = true
        increaseButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        increaseButton.widthAnchor.constraint(equalToConstant: 40).isActive = true

        decreaseButton.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor).isActive = true
        decreaseButton.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: -20).isActive = true
        decreaseButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        decreaseButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
