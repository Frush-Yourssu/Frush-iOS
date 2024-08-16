//
//  BaseViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
        makeConstraints()
        viewTransition()
        view.backgroundColor = .white
    }
    
    // MARK: Configuration
    func configureSubviews() {
        
    }
    
    // MARK: Layout
    func makeConstraints() {
    }

    // MARK: View Transition
    func viewTransition() {
    }
}
