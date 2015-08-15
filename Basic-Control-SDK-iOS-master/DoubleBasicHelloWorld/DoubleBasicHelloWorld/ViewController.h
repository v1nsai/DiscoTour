//
//  ViewController.h
//  QRCodeReader
//
//  Created by Gabriel Theodoropoulos on 27/11/13.
//  Copyright (c) 2013 Gabriel Theodoropoulos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>

@property (strong, nonatomic) IBOutlet UIView *mviewPreview;
@property (strong, nonatomic) IBOutlet UILabel *lblStatus;

- (IBAction)startStopReading;

- (IBAction)goBack;


@end
