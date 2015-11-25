//
//  ViewController.h
//  Card Reader
//
//  Created by Cameron Barrie on 25/11/2015.
//  Copyright © 2015 Bilue Pty Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ORSSerialPort.h"

@interface ViewController : NSViewController <ORSSerialPortDelegate>

@property (weak, readwrite) IBOutlet NSTextField *textField;

@end

