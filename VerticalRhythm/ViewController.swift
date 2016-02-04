import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var rhythmLabel: NSTextField?
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        return nf
    }()

    var rhythm = 18.0 {
        didSet {
            rhythmLabel?.stringValue = numberFormatter.stringFromNumber(rhythm) ?? "?"
            if let view = view as? View {
                view.rhythm = CGFloat(rhythm)
                view.needsDisplay = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rhythmLabel?.stringValue = numberFormatter.stringFromNumber(rhythm) ?? "?"
    }

    @IBAction func increaseRhythm(sender: AnyObject?) {
        rhythm += 0.25
    }

    @IBAction func decreaseRhythm(sender: AnyObject?) {
        rhythm -= 0.25
    }

    @IBAction func segmentedControl(sender: AnyObject?) {
        if let control = sender as? NSSegmentedControl {
            if control.selectedSegment == 0 {
                decreaseRhythm(self)
            } else {
                increaseRhythm(self)
            }
        }
    }

}
