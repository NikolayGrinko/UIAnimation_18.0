//
//  ViewController.swift
//  UIAnimation_18.0
//
//  Created by Николай Гринько on 16.01.2025.
//


// Random Animation UIUpdateLink
import UIKit

class ViewController: UIViewController {

    private let animatedView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var updateLink: UIUpdateLink?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupUpdateLink()
    }

    private func setupUI() {
        // Add subview
        view.addSubview(animatedView)

        // Constraints for animatedView
        NSLayoutConstraint.activate([
            animatedView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animatedView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animatedView.widthAnchor.constraint(equalToConstant: 100),
            animatedView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func setupUpdateLink() {
        let updateLink = UIUpdateLink(view: view, actionTarget: self, selector: #selector(update))
        updateLink.requiresContinuousUpdates = true
        updateLink.isEnabled = true
        self.updateLink = updateLink
    }

    @objc func update(updateLink: UIUpdateLink, updateInfo: UIUpdateInfo) {
        animatedView.center.y = sin(updateInfo.modelTime) * 100 + view.bounds.midY
    }
}







// Random Animation
//import UIKit
//
//class ViewController: UIViewController {
//
//    private let animatedView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .systemRed
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private let animateButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Start Random Animation", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(startRandomAnimation), for: .touchUpInside)
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupUI()
//    }
//
//    private func setupUI() {
//        // Add subviews
//        view.addSubview(animatedView)
//        view.addSubview(animateButton)
//
//        // Constraints for animatedView
//        NSLayoutConstraint.activate([
//            animatedView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            animatedView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            animatedView.widthAnchor.constraint(equalToConstant: 100),
//            animatedView.heightAnchor.constraint(equalToConstant: 100)
//        ])
//
//        // Constraints for animateButton
//        NSLayoutConstraint.activate([
//            animateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            animateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
//        ])
//    }
//
//    @objc private func startRandomAnimation() {
//        let randomX = CGFloat.random(in: -150...150)
//        let randomY = CGFloat.random(in: -300...300)
//
//        UIView.animate(withDuration: 1.0, animations: {
//            self.animatedView.transform = CGAffineTransform(translationX: randomX, y: randomY)
//        }) { _ in
//            UIView.animate(withDuration: 1.0, animations: {
//                self.animatedView.transform = .identity
//            })
//        }
//    }
//}
//


// Анимация старт стоп +++
//import UIKit
//
//class ViewController: UIViewController {
//
//    private let animatedView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .systemBlue
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private let animateButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Start Animation", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(startRandomAnimation), for: .touchUpInside)
//        return button
//    }()
//
//    private let stopButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Stop Animation", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(stopAnimation), for: .touchUpInside)
//        return button
//    }()
//
//    private var isAnimating = false
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupUI()
//    }
//
//    private func setupUI() {
//        view.addSubview(animatedView)
//        view.addSubview(animateButton)
//        view.addSubview(stopButton)
//
//        // Констрейнты для анимируемого представления
//        NSLayoutConstraint.activate([
//            animatedView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            animatedView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            animatedView.widthAnchor.constraint(equalToConstant: 100),
//            animatedView.heightAnchor.constraint(equalToConstant: 100)
//        ])
//
//        // Констрейнты для кнопки запуска анимации
//        NSLayoutConstraint.activate([
//            animateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            animateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60)
//        ])
//
//        // Констрейнты для кнопки остановки анимации
//        NSLayoutConstraint.activate([
//            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stopButton.bottomAnchor.constraint(equalTo: animateButton.topAnchor, constant: -20)
//        ])
//    }
//
//    @objc private func startRandomAnimation() {
//        guard !isAnimating else { return }
//        isAnimating = true
//        animateRandomly()
//    }
//
//    @objc private func stopAnimation() {
//        isAnimating = false
//    }
//
//    private func animateRandomly() {
//        guard isAnimating else { return }
//
//        // Генерация случайной позиции
//        let randomX = CGFloat.random(in: -150...150)
//        let randomY = CGFloat.random(in: -300...300)
//
//        UIView.animate(withDuration: 3.0, animations: {
//            self.animatedView.transform = CGAffineTransform(translationX: randomX, y: randomY)
//        }, completion: { _ in
//            UIView.animate(withDuration: 3.0, animations: {
//                self.animatedView.transform = .identity
//            }, completion: { _ in
//                self.animateRandomly()
//            })
//        })
//    }
//}

// Анимация старт

//import UIKit
//
//class ViewController: UIViewController {
//
//    private let appleImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "applelogo") // Используем системный значок Apple
//        imageView.tintColor = .systemBlue
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    lazy var animateButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Animate", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(animateAppleLogo), for: .touchUpInside)
//        return button
//    }()
//
//    private var isMovedUp = false
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupUI()
//    }
//
//    private func setupUI() {
//        // Добавляем элементы на экран
//        view.addSubview(appleImageView)
//        view.addSubview(animateButton)
//
//        // Устанавливаем констрейнты для значка Apple
//        NSLayoutConstraint.activate([
//            appleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            appleImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            appleImageView.widthAnchor.constraint(equalToConstant: 100),
//            appleImageView.heightAnchor.constraint(equalToConstant: 100)
//        ])
//
//        // Устанавливаем констрейнты для кнопки
//        NSLayoutConstraint.activate([
//            animateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            animateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
//        ])
//    }
//
//    @objc private func animateAppleLogo() {
//        // Меняем положение значка Apple с анимацией
//        UIView.animate(withDuration: 1.0, animations: {
//            if self.isMovedUp {
//                self.appleImageView.transform = .identity // Возвращаем в исходное положение
//            } else {
//                self.appleImageView.transform = CGAffineTransform(translationX: 0, y: -150) // Сдвиг вверх
//            }
//        }) { _ in
//            self.isMovedUp.toggle() // Меняем состояние
//        }
//    }
//}






// UICollectionView - 18.0

/*
 import UIKit

 class CompositionalLayoutViewController: UIViewController, UICollectionViewDataSource {
     var collectionView: UICollectionView!

     override func viewDidLoad() {
         super.viewDidLoad()

         let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
             let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1.0))
             let item = NSCollectionLayoutItem(layoutSize: itemSize)

             let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
             let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

             let section = NSCollectionLayoutSection(group: group)
             section.orthogonalScrollingBehavior = .continuous

             return section
         }

         collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
         collectionView.dataSource = self
         collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
         view.addSubview(collectionView)
     }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 20
     }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
         cell.backgroundColor = .systemBlue
         return cell
     }
 }
 */
