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
    @IBOutlet weak var playButton: ActionButton!
    
    @IBOutlet weak var loader: UIImageView!
    private let disposeBag = DisposeBag()
    var viewModel: PlayGameViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
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
        playButton.setTitle(L10n.playButtonTitle, for: .normal)
        
        startPlayMode(isPlay: false)
    }
    
    private func setupBinding() {
        
        viewModel.setupBinding(input: InputTrigger(correctTrigger: correctButton.rx.tap.asObservable(), wrongTrigger: wrongButton.rx.tap.asObservable(), playTrigger: playButton.rx.tap.asObservable()))
        
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
        
        viewModel.gameStartSubject.subscribe(onNext: { [weak self] gameStarted in
            if gameStarted {
                self?.startPlayMode(isPlay: true)
            } else {
                self?.showAlert()
            }
        }).disposed(by: disposeBag)
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
    
    private func startPlayMode(isPlay: Bool) {
        correctButton.isHidden = !isPlay
        wrongButton.isHidden = !isPlay
        correctAttempsLabel.isHidden = !isPlay
        wrongAttmptsLabel.isHidden = !isPlay
        englishLabel.isHidden = !isPlay
        translationLabel.isHidden = !isPlay
        playButton.isHidden = isPlay
    }
    
    
    //MARK: Error Alert
    private func showAlert() {
        let alert = UIAlertController(title: L10n.errorTitle, message: L10n.unableToStartGameError, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
}

