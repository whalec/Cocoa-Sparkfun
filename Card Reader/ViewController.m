//
//  ViewController.m
//  Card Reader
//
//  Created by Cameron Barrie on 25/11/2015.
//  Copyright © 2015 Bilue Pty Ltd. All rights reserved.
//

#define DEVICE_PATH @"/dev/cu.usbserial-AI02KQN0"

#import "ViewController.h"

@interface ViewController ()

@property (strong, readwrite) NSMutableData *cardData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cardData = [NSMutableData data];
    ORSSerialPort *port = [ORSSerialPort serialPortWithPath:DEVICE_PATH];
    
    port.baudRate = @(9600);
    port.parity = ORSSerialPortParityNone;
    port.numberOfStopBits = 1;
    port.usesRTSCTSFlowControl = YES;
    
    port.delegate = self;
    [port open];
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}



- (void)serialPortWasRemovedFromSystem:(ORSSerialPort *)serialPort {
    [serialPort close];
}


/**
 *  Called any time new data is received by the serial port from an external source.
 *
 *  @param serialPort The `ORSSerialPort` instance representing the port that received `data`.
 *  @param data       An `NSData` instance containing the data received.
 */
- (void)serialPort:(ORSSerialPort *)serialPort didReceiveData:(NSData *)data {
    [self.cardData appendData:data];
    if (self.cardData.length >= 16) {
        self.textField.stringValue = [[NSString alloc] initWithData:self.cardData encoding:NSUTF8StringEncoding];
        self.cardData = [NSMutableData data];
    }
}

@end
