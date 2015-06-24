//
//  ViewController.swift
//  SwiftBook
//
//  Created by Brian Coleman on 2014-07-07.
//  Copyright (c) 2014 Brian Coleman. All rights reserved.
//

import UIKit

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView : FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        
    }
    
    // Facebook Delegate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
  
        var friendsRequest : FBRequest = FBRequest.requestForMyFriends()
        friendsRequest.startWithCompletionHandler{(connection:FBRequestConnection!, result:AnyObject!, error:NSError!) -> Void in
            var resultdict = result as NSDictionary
            println("Result Dict: \(resultdict)")
            var data : NSArray = resultdict.objectForKey("data") as NSArray
            
            for i in 0 ..< data.count
            {
                let valueDict : NSDictionary = data[i] as NSDictionary
                let id = valueDict.objectForKey("id") as String
                println("the id value is \(id)")
            }
            
            var friends = resultdict.objectForKey("data") as NSArray
            println("Found \(friends.count) friends")
        
            var friend = friends[0].objectForKey("first_name") as NSString;
            println("This is \(friend)")
          
            

        }
}
    
    
    
    
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
        println("User Email: \(userEmail)")
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   }

