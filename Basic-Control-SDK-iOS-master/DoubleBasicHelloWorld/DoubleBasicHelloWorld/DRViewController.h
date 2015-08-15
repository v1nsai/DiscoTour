//
//  DRViewController.h
//  DoubleBasicHelloWorld
//
//  Created by David Cann on 8/3/13.
//  Copyright (c) 2013 Double Robotics, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface DRViewController : UIViewController  {
	IBOutlet UILabel *statusLabel;
	IBOutlet UIButton *driveForwardButton;
	IBOutlet UIButton *driveBackwardButton;
	IBOutlet UIButton *driveLeftButton;
	IBOutlet UIButton *driveRightButton;
    
    IBOutlet UIView *cameraPreview;
}
- (IBAction)switchScanView;

@end
