import UIKit

class CardsViewController: UIViewController {
  
  @IBOutlet weak var profileImage: UIImageView!
  
  var initialCenter: CGPoint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialCenter = profileImage.center
  }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let destination = segue.destination as? DetailViewController {
        if let image = profileImage.image {
            destination.image = image
        }
     }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
    
    let location = sender.location(in: view)
    let translation = sender.translation(in: view)
    
    if sender.state == .began {
      initialCenter = profileImage.center
    } else if sender.state == .changed {
      profileImage.center = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y)// + translation.y)
      
      if (location.y > profileImage.center.y) {
        let rotation = CGAffineTransform(rotationAngle: -translation.x / 600)
        self.profileImage.transform = rotation
      } else {
        let rotation = CGAffineTransform(rotationAngle: translation.x / 600)
        self.profileImage.transform = rotation
      }
      
    } else if sender.state == .ended {
      if (translation.x > 120 || translation.x < -120) {
        UIView.animate(withDuration: 1, animations: {
          if(translation.x > 120) {
            self.profileImage.center.x += 1000
          }
          else {
            self.profileImage.center.x -= 1000
          }
          
        })
      }
      else {
        self.profileImage.transform  = CGAffineTransform.identity
        self.profileImage.center = initialCenter
        
      }
    }
    
  }
  
  @IBAction func didTapImage(_ sender: UITapGestureRecognizer) {
    self.performSegue(withIdentifier: "detailSegue", sender: nil)
  }
}
