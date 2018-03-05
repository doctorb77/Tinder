import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var profileImage: UIImageView!
  var image: UIImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let image = image {
      profileImage.image = image
    }
  }
  
  @IBAction func didTapDone(_ sender: UITapGestureRecognizer) {
      dismiss(animated: true, completion: nil)
  }
    
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
