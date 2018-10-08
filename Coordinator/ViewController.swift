import UIKit
import Foundation

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didPushButton() {
        let viewModel = FirstViewModel(value: 999)
        let firstVC = FirstViewController.create(with: viewModel)
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
}

protocol ControllerPresentable {
    var navigator: UINavigationController { get }
}
