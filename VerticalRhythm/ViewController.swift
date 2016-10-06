import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var rhythmLabel: NSTextField?
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        return nf
    }()

    var rhythm = 18.0 {
        didSet {
            rhythmLabel?.stringValue = numberFormatter.string(from: NSNumber(value: rhythm)) ?? "?"
            if let view = view as? View {
                view.rhythm = CGFloat(rhythm)
                view.needsDisplay = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rhythmLabel?.stringValue = numberFormatter.string(from: NSNumber(value: rhythm)) ?? "?"
    }

    @IBAction func increaseRhythm(_ sender: AnyObject?) {
        rhythm += 0.25
    }

    @IBAction func decreaseRhythm(_ sender: AnyObject?) {
        rhythm -= 0.25
    }

    @IBAction func segmentedControl(_ sender: AnyObject?) {
        if let control = sender as? NSSegmentedControl {
            if control.selectedSegment == 0 {
                decreaseRhythm(self)
            } else {
                increaseRhythm(self)
            }
        }
    }

}
