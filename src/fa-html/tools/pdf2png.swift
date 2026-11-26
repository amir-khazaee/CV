import Foundation
import PDFKit
import AppKit
let args = CommandLine.arguments
guard let doc = PDFDocument(url: URL(fileURLWithPath: args[1])) else { print("FAILED"); exit(1) }
let scale: CGFloat = 2.0
for i in 0..<doc.pageCount {
    let page = doc.page(at: i)!
    let b = page.bounds(for: .mediaBox)
    let w = Int(b.width * scale), h = Int(b.height * scale)
    let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: w, pixelsHigh: h, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
    let ctx = NSGraphicsContext(bitmapImageRep: rep)!
    NSGraphicsContext.current = ctx
    ctx.cgContext.setFillColor(NSColor.white.cgColor)
    ctx.cgContext.fill(CGRect(x: 0, y: 0, width: w, height: h))
    ctx.cgContext.scaleBy(x: scale, y: scale)
    page.draw(with: .mediaBox, to: ctx.cgContext)
    let out = "\(args[2])/page\(i+1).png"
    try! rep.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: out))
    print(out)
}
