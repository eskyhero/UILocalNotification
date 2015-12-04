//
//  AppDelegate.swift
//  demo
//
//  Created by eskyhero on 15/12/3.
//  Copyright © 2015年 eskyhero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //接受按钮
        let acceptAction = UIMutableUserNotificationAction()
        acceptAction.identifier = "acceptAction"
        acceptAction.title = "接受"
        acceptAction.activationMode = UIUserNotificationActivationMode.Foreground
        
        //拒绝按钮
        let rejectAction = UIMutableUserNotificationAction()
        rejectAction.identifier = "rejectAction"
        rejectAction.title = "拒绝"
        rejectAction.activationMode = UIUserNotificationActivationMode.Background
        rejectAction.authenticationRequired = true
        rejectAction.destructive = true
        
        let categorys = UIMutableUserNotificationCategory()
        categorys.identifier = "MyNotification"
        categorys.setActions([acceptAction,rejectAction], forContext: UIUserNotificationActionContext.Minimal)
        
        let settings = UIUserNotificationSettings(forTypes: [UIUserNotificationType.Alert,UIUserNotificationType.Sound,UIUserNotificationType.Badge], categories: NSSet(object: categorys) as? Set<UIUserNotificationCategory>)
        application.registerForRemoteNotifications()
        application.registerUserNotificationSettings(settings)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        UIApplication.sharedApplication().cancelAllLocalNotifications()
        
        let notification = UILocalNotification()
        //notification.fireDate = NSDate().dateByAddingTimeInterval(1)
        //setting timeZone as localTimeZone
        notification.timeZone = NSTimeZone.localTimeZone()
        notification.repeatInterval = NSCalendarUnit.Calendar
        notification.alertTitle = "This is a local notification"
        notification.alertBody = "Hey,It's great to see you again"
        notification.alertAction = "OK"
        notification.category = "MyNotification" //这个很重要，跟上面的动作集合（UIMutableUserNotificationCategory）的identifier一样
        notification.soundName = UILocalNotificationDefaultSoundName
        //setting app's icon badge
        notification.applicationIconBadgeNumber = 1
        
        var userInfo:[NSObject : AnyObject] = [NSObject : AnyObject]()
        userInfo["kLocalNotificationID"] = "LocalNotificationID"
        userInfo["key"] = "Attention Please"
        notification.userInfo = userInfo
        
        //UIApplication.sharedApplication().scheduleLocalNotification(notification)
        //UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        application.presentLocalNotificationNow(notification)
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        print("identifier=\(identifier)")  //这里的identifier是按钮的identifier
        
        completionHandler()  //最后一定要调用这上方法
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

