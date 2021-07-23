//
//  AppDelegate.swift
//  MyMenuBar
//
//  Created by Leonardo Atalla on 7/22/21.
//
import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var menuBar: MenuBarImpl?
    var popover = NSPopover.init()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = ContentView()
        
        popover.contentSize = NSSize(width: 75, height: 360)
        popover.contentViewController = NSHostingController(rootView: contentView)
        menuBar = MenuBarImpl.init(popover)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

