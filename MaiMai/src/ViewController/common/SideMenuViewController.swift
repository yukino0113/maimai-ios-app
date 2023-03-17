//
//  SideMenu.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/17.
//

import Foundation
import UIKit

class SideMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        let refreshButton = UIButton(type: .system)
        refreshButton.setTitle("Refresh", for: .normal)
        refreshButton.addTarget(self, action: #selector(refreshButtonTapped), for: .touchUpInside)
        view.addSubview(refreshButton)

        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            refreshButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }

    @objc private func refreshButtonTapped() {
        // Add your code to present the web view here
    }
}
