//
//  ViewController.swift
//  MyNotes
//
//  Created by Belyantsev Sergey on 01.12.2025.
//

import UIKit

enum NoteState {
    case empty
    case editing
}

class ViewController: UIViewController {
    
    private let doneButton = UIBarButtonItem()
    private let titleLabel = UILabel()
    private let largeTextInput = UITextView()
    private var state: NoteState = .empty

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .white
    }
    
    private func configure() {
        setUpButton()
        setUpTitle()
        setUpLargeTextInput()
    }
    
    private func setUpButton() {
        doneButton.title = "Изменить"
        doneButton.target = self
        doneButton.action = #selector(doneButtonTapped)
        navigationItem.rightBarButtonItem = doneButton
        navigationController?.isToolbarHidden = false
    }
    
    private func setUpTitle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.text = "Мои заметки"
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        titleLabel.font = .systemFont(ofSize: 16)
    }
    
    private func setUpLargeTextInput() {
        largeTextInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(largeTextInput)
        largeTextInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22).isActive = true
        largeTextInput.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        largeTextInput.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        largeTextInput.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    @objc private func doneButtonTapped() {
        switch state {
        case .empty:
            doneButton.title = "Сохранить"
            state = .editing
            largeTextInput.becomeFirstResponder()
            
        case .editing:
            state = .empty
            doneButton.title = "Изменить"
            largeTextInput.resignFirstResponder()
        }
    }

}

