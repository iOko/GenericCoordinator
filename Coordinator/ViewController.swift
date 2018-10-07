import UIKit
import Foundation

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didPushButton() {
        let viewModel = GenericViewModel(value: 999)
        let firstVC = FirstViewController.create(with: viewModel)
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
}



