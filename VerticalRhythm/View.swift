import Cocoa

class View: NSView {

    var rhythm: CGFloat = 18.0

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        // The first line begins just beneath the controls, then draw lines all the way down.
        var y = bounds.height - 36.0
        let width = bounds.width - 2
        NSColor.blackColor().setFill()
        while y > 0 {
            NSBezierPath(rect: NSRect(x: 1, y: round(y), width: width, height: 1)).fill()
            y -= rhythm
        }
        // Draw a border around the window to help the user resize it.
        NSColor.lightGrayColor().setStroke()
        let path = NSBezierPath(roundedRect: bounds.insetBy(dx: 2, dy: 2), xRadius: 4, yRadius: 4)
        path.lineWidth = 2.0
        path.stroke()
    }

}
