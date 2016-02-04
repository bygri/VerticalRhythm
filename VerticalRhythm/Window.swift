import Cocoa

class Window: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        guard let window = window else { return }
        window.backgroundColor = NSColor.clearColor()
        window.opaque = false
        window.movableByWindowBackground = true
        window.level = 2
    }

}
