//
//  PageViewController.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/11.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: Array<Page>
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator.init(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let pageViewController: UIPageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        (uiViewController as! UIPageViewController).setViewControllers([context.coordinator.controllers[self.currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers: Array<UIViewController> = Array<UIViewController>.init()
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
            self.controllers = self.parent.pages.map({ view in
                UIHostingController.init(rootView: view)
            })
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = self.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return self.controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = self.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == self.controllers.count {
                return self.controllers.first
            }
            return self.controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                self.parent.currentPage = index
            }
        }
    }
}
