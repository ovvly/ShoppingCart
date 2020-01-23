import UIKit

final class ProductCell: UITableViewCell {
    static let identifier = "ProductCell"
        
    let productNameLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let unitLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let priceLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none

        setupCell()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        addSubviews()
        setupCustomConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(productNameLabel)
        contentView.addSubview(unitLabel)
        contentView.addSubview(priceLabel)
    }

    private func setupCustomConstraints() {
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = layoutMarginsGuide
        productNameLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        productNameLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        unitLabel.leadingAnchor.constraint(equalTo: productNameLabel.trailingAnchor).isActive = true
        unitLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        unitLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        unitLabel.widthAnchor.constraint(equalTo: productNameLabel.widthAnchor).isActive = true

        priceLabel.leadingAnchor.constraint(equalTo: unitLabel.trailingAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: unitLabel.widthAnchor).isActive = true
    }
    
}
