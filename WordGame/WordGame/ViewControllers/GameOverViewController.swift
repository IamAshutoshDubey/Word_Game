//
//  GameOverViewController.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 10/10/20.
//


import UIKit
import RxSwift
import RxCocoa

class GameOverViewController: UIViewController {
    @IBOutlet weak var gamerOverLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var viewModel: GameOverViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.hidesBackButton = true
        gamerOverLabel.text = viewModel.isGameOver ? L10n.gameOverLable : L10n.wellDoneLable
        imageView.image = viewModel.isGameOver ? #imageLiteral(resourceName: "Sad") :  #imageLiteral(resourceName: "Smile")
        
    }
}
