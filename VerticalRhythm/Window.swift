import Cocoa

class Window: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        guard let window = window else { return }
        window.backgroundColor = NSColor.clear
        window.isOpaque = false
        window.isMovableByWindowBackground = true
        window.level = 2
    }

}
