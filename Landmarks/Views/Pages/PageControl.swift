//
//  PageControl.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/11.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Self.Coordinator.init(self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let control: UIPageControl = UIPageControl.init()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator, action: #selector(Self.Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        (uiView as! UIPageControl).currentPage = self.currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            self.control.currentPage = sender.currentPage
        }
    }
}
