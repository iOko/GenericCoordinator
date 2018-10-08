import UIKit

class FirstViewController: UIViewController {
    var viewModel: GenericViewModel<Int>?
    
    @IBOutlet weak var label: UILabel!
    @IBAction func didPushButton() {
        guard let viewModel = viewModel else { return }
        let coordinator = Navigator(viewModel: viewModel, controller: self)
        coordinator.submitAndNavigate()
    }
    
    static func create(with viewModel: GenericViewModel<Int>) -> FirstViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController else { return FirstViewController() }
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        label.text = String(viewModel.value)
    }
}

extension FirstViewController: ControllerPresentable {
    var navigator: UINavigationController {
        return navigationController ?? UINavigationController()
    }
}
