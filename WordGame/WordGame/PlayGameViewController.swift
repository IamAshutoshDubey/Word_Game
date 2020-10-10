//
//  PlayGameViewController.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import UIKit
import RxSwift
import RxCocoa

class PlayGameViewController: UIViewController {
    
    @IBOutlet var correctAttempsLabel: UILabel!
    @IBOutlet var wrongAttmptsLabel: UILabel!
    
    @IBOutlet var englishLabel: UILabel!
    @IBOutlet var translationLabel: UILabel!
    
    @IBOutlet var correctButton: ActionButton!
    @IBOutlet var wrongButton: ActionButton!
    
    
    private let disposeBag = DisposeBag()
    var viewModel: PlayGameViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
        viewModel.startGame()
    }
    
    private func setupUI() {
        self.title = L10n.playGameScreenTitle
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black,
                                                                   .font: UIFont(name: "helvetica-bold", size: 16.0)]
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        correctButton.setTitle(L10n.correctButtonTitle, for: .normal)
        wrongButton.setTitle(L10n.wrongButtonTitle, for: .normal)

    }
    
    private func setupBinding() {
        
        viewModel.setupBinding(correctTrigger: correctButton.rx.tap.asDriver(), wrongTrigger: wrongButton.rx.tap.asDriver())
        
        viewModel.liveCorrectAttempts.distinctUntilChanged()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] correctScore in
                guard let weakSelf = self else { return }
                weakSelf.correctAttempsLabel.text =  L10n.correctAttemptsStatusLabel(correctScore)
                weakSelf.animateCorrectStatus()
            }).disposed(by: disposeBag)
        
        viewModel.liveWrongAttempts.distinctUntilChanged()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] wrongScore in
                guard let weakSelf = self else { return }
                weakSelf.wrongAttmptsLabel.text = L10n.wrongAttemptsStatusLabel(wrongScore)
                weakSelf.animateWrongStatus()
            }).disposed(by: disposeBag)
        
        viewModel.attmept.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (question,translation) in
                guard let weakSelf = self else { return }
                weakSelf.englishLabel.text = question
                weakSelf.translationLabel.text = translation
                weakSelf.animateAttemptOption()
            }).disposed(by: disposeBag)
        
        correctButton.rx.tap.map({false}).bind(to: correctButton.rx.isEnabled).disposed(by: disposeBag)
        wrongButton.rx.tap.map({false}).bind(to: wrongButton.rx.isEnabled).disposed(by: disposeBag)
    }
    
    private func animateAttemptOption() {
        englishLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        translationLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.4) {
            self.englishLabel.transform = .identity
            self.translationLabel.transform = .identity
        } completion: { completed in
            if completed {
                self.correctButton.isEnabled = true
                self.wrongButton.isEnabled = true
            }
        }
    }
    
    private func animateCorrectStatus() {
        correctAttempsLabel.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        UIView.animate(withDuration: 0.2) {
            self.correctAttempsLabel.transform = .identity
        }
    }
    
    private func animateWrongStatus() {
        wrongAttmptsLabel.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        UIView.animate(withDuration: 0.2) {
            self.wrongAttmptsLabel.transform = .identity
        }
    }
}

