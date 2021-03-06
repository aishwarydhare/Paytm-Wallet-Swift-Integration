//
//  TurfCommonFunctions.swift
//  Turf
//
//  Created by Krisha on 11/02/16.
//  Copyright © 2016 Macmini. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration

class CommonFunctions: NSObject {
    
    func alert_for(title: String!, message: String!) {
        
        let alertView:UIAlertView = UIAlertView()
        alertView.title = title
        alertView.message = message
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }
    
    func bottom_border(view: UIView!, table_view: UITableView!, cell: UITableViewCell) {
        
        let border_width = view.frame.size.width
        let view1 = UIView(frame: CGRectMake(0, table_view.rowHeight - 1, border_width, 0.3))
        view1.backgroundColor = UIColor(red: 203.0/255.0, green: 203.0/255.0, blue: 208.0/255.0, alpha: 1.0)
        cell.addSubview(view1)
    }

}

public class CheckNetwork {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
        
    }
}