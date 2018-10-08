import UIKit

class SecondViewController: UIViewController {
    var viewModel: SecondViewModel?
    
    @IBOutlet weak var label: UILabel!
    @IBAction func didPushButton() {
        guard let viewModel = viewModel else { return }
        let coordinator = Navigator(viewModel: viewModel, controller: self)
        coordinator.submitAndNavigate()
    }

    static func create(with viewModel: SecondViewModel) -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return SecondViewController() }
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        label.text = viewModel.value
    }
}

extension SecondViewController: ControllerPresentable {
    var navigator: UINavigationController {
        return navigationController ?? UINavigationController()
    }
}
