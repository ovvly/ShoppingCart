import Foundation
import UIKit

final class ProductListView: UIView {
    let tableView = UITableView()

    let checkoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("Checkout", for: .normal)
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

        addSubview(tableView)
        addSubview(checkoutButton)
        setupCustomConstraints()
    }

    private func setupCustomConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        checkoutButton.translatesAutoresizingMaskIntoConstraints = false

        let margins = layoutMarginsGuide
        tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true

        checkoutButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        checkoutButton.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        checkoutButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        checkoutButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        checkoutButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
