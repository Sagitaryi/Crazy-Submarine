import UIKit

final class GameOverViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var rebootButton: UIButton!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var mainWallpaper: UIImageView!
    
    // MARK: - let/var
    static let identifier = "GameOverViewController"
    var crashSubmarineImageView = UIImageView()
    var screenHeight: CGFloat = 0
    var screenWidth: CGFloat = 0
    var totalScore = 0

    // MARK: - lifecicle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsSetting()
        addCrashSubmarine()
        self.view.sendSubviewToBack(mainWallpaper)
    }
    
     // MARK: - ABActions
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func rebootButtonPressed(_ sender: UIButton) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: GameViewController.identifier) as? GameViewController else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - flow funcs
    func labelsSetting() {
        let fontLabelGameOver = UIFont(name: "Rockwell-Bold", size: 50)
        self.gameOverLabel.font = fontLabelGameOver
        self.gameOverLabel.dropShadow()
        textOptions()
        self.totalScoreLabel.dropShadow()
        
        func textOptions() {
               let attributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.foregroundColor: UIColor.systemGreen,
                   NSAttributedString.Key.underlineStyle: NSUnderlineStyle.patternDash.rawValue
               ]
            let attrString = NSMutableAttributedString(string: "You score: ", attributes: attributes)
               
               let secondAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.foregroundColor: UIColor.systemRed,
                   NSAttributedString.Key.underlineStyle: NSUnderlineStyle.patternDot.rawValue
               ]
            let newAttrString = NSAttributedString(string: String(self.totalScore), attributes: secondAttributes)
               attrString.append(newAttrString)
               let firstFont = UIFont(name: "Rockwell-Bold", size: 25)
            self.totalScoreLabel.font = firstFont 
               self.totalScoreLabel.attributedText = attrString
            
           }
    }
    
    func addCrashSubmarine() {
        let crashSubmarineImage = UIImage(named: "crashSubmarineFire")
        self.crashSubmarineImageView.image = crashSubmarineImage
        self.crashSubmarineImageView.frame.origin.x = self.screenWidth / 2 - self.crashSubmarineImageView.frame.width / 2
        self.crashSubmarineImageView.frame.origin.y = self.screenHeight * 0.6
        self.view.addSubview(self.crashSubmarineImageView)
    }
    
}
