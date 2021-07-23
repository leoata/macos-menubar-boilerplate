//
//  MenuBarImpl.swift
//  MyMenuBar
//
//  Created by Leonardo Atalla on 7/22/21.
//
import Foundation
import AppKit

class MenuBarImpl {
    var menuBar: NSStatusBar
    var menuBarItem: NSStatusItem
    var popover: NSPopover
    
    init(_ popover: NSPopover) {
        self.popover = popover
        self.menuBar = NSStatusBar.init()
        self.menuBarItem = menuBar.statusItem(withLength: 28.0)
        
        if let menuBarButton = menuBarItem.button {
            menuBarButton.image = #imageLiteral(resourceName: "MenuBarIcon")
            menuBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
            menuBarButton.image?.isTemplate = true
            
            menuBarButton.action = #selector(togglePopover(sender:))
            menuBarButton.target = self
        }
    }
    
    @objc func togglePopover(sender: AnyObject) {
        popover.isShown ? hidePopover(sender) : showPopover(sender)
    }
    
    func showPopover(_ sender: AnyObject) {
        if let menuBarButton = menuBarItem.button {
            popover.show(relativeTo: menuBarButton.bounds, of: menuBarButton, preferredEdge: NSRectEdge.maxY)
        }
    }
    
    func hidePopover(_ sender: AnyObject) {
        popover.performClose(sender)
    }
}
