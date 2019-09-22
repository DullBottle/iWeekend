//
//  ViewController.swift
//  TT
//
//  Created by 銀色魔頭號 on 2019/9/22.
//  Copyright © 2019 Dressroseend. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UITextView = {
        let size = UIScreen.main.bounds.size
        let label = UITextView(frame: CGRect(x: 0, y: 100, width: size.width, height: 60))
        label.isUserInteractionEnabled = true
        label.isEditable = false
        label.textAlignment = .center
        
        var paragraph = NSMutableParagraphStyle.default.mutableCopy() as? NSMutableParagraphStyle
        paragraph?.alignment = .center
        
        let attributedString: NSMutableAttributedString =
            NSMutableAttributedString(string: "冲田海", attributes: [
            NSAttributedString.Key.paragraphStyle: paragraph ?? NSParagraphStyle.default,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0)
        ])
        let attString = NSAttributedString(string: "三吉彩花", attributes: [
            NSAttributedString.Key.paragraphStyle: paragraph ?? NSParagraphStyle.default,
            NSAttributedString.Key.foregroundColor: UIColor.orange,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0),
            NSAttributedString.Key.underlineStyle: 1
        ])
        attributedString.append(attString)
        
        let imageAttachment = NSTextAttachment(image: UIImage.init(named: "copy.png")?.withRenderingMode(.alwaysOriginal) ?? UIImage())
        imageAttachment.bounds = CGRect(x: 0, y: -5, width: 23, height: 23)
        let imageString = NSAttributedString(attachment: imageAttachment)
        attributedString.append(imageString)
        label.attributedText = attributedString
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        tap.delegate = self
        label.addGestureRecognizer(tap)
        view.addSubview(label)
    }

    @objc func tap(_ sender: UITapGestureRecognizer) {
        
    }
    
}

extension ViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        guard let textView = gestureRecognizer.view as? UITextView else { return false }
        
        let nsstring = NSString(string: textView.text)
        let underlineRange = nsstring.range(of: "三吉彩花")
        textView.selectedRange = underlineRange
        
        var rects: [CGRect] = []
        let selectionRects = textView.selectionRects(for: textView.selectedTextRange ?? UITextRange())
        for textRect in selectionRects {
            rects.append(textRect.rect)
        }
        
        let point = gestureRecognizer.location(in: textView)
        
        
//        let range: UITextRange = UITextRange()
//        let rects = textView.selectionRects(for: range)
        
//        print(gestureRecognizer.location(in: gestureRecognizer.view))
        
        return true
    }
}

