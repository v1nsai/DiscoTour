//
//  DRViewController.m
//  DoubleBasicHelloWorld
//
//  Created by David Cann on 8/3/13.
//  Copyright (c) 2013 Double Robotics, Inc. All rights reserved.
//

#import "DRViewController.h"
#import <DoubleControlSDK/DoubleControlSDK.h>
#import "ViewController.h"

@interface DRViewController () <DRDoubleDelegate>
@end

@implementation DRViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[DRDouble sharedDouble].delegate = self;
	NSLog(@"SDK Version: %@", kDoubleBasicSDKVersion);
    
    //capture live preview
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    session.sessionPreset = AVCaptureSessionPresetMedium;
    
    CALayer *viewLayer = cameraPreview.layer;
    NSLog(@"viewLayer = %@", viewLayer);
    
    AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    
    captureVideoPreviewLayer.frame = cameraPreview.bounds;
    [cameraPreview.layer addSublayer:captureVideoPreviewLayer];
    
    NSArray *possibleDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    AVCaptureDevice *device = [possibleDevices lastObject];
    
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (!input) {
        // Handle the error appropriately.
        NSLog(@"ERROR: trying to open camera: %@", error);
    }
    
    [session addInput:input];
    
    [session startRunning];
    
    //ViewController *vc = [[ViewController alloc] init];
    //[vc startStopReading];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return UIInterfaceOrientationIsPortrait(toInterfaceOrientation);
}

#pragma mark - Actions

- (IBAction)poleUp:(id)sender {
	[[DRDouble sharedDouble] poleUp];
}

- (IBAction)poleStop:(id)sender {
	[[DRDouble sharedDouble] poleStop];
}

- (IBAction)poleDown:(id)sender {
	[[DRDouble sharedDouble] poleDown];
}

- (IBAction)kickstandsRetract:(id)sender {
	[[DRDouble sharedDouble] retractKickstands];
}

- (IBAction)kickstandsDeploy:(id)sender {
	[[DRDouble sharedDouble] deployKickstands];
}

- (IBAction)startTravelData:(id)sender {
	[[DRDouble sharedDouble] startTravelData];
}

- (IBAction)stopTravelData:(id)sender {
	[[DRDouble sharedDouble] stopTravelData];
}

#pragma mark - DRDoubleDelegate

- (void)doubleDidConnect:(DRDouble *)theDouble {
	statusLabel.text = @"Connected";
}

- (void)doubleDidDisconnect:(DRDouble *)theDouble {
	statusLabel.text = @"Not Connected";
}

- (void)doubleStatusDidUpdate:(DRDouble *)theDouble {
	/*poleHeightPercentLabel.text = [NSString stringWithFormat:@"%f", [DRDouble sharedDouble].poleHeightPercent];
	kickstandStateLabel.text = [NSString stringWithFormat:@"%d", [DRDouble sharedDouble].kickstandState];
	batteryPercentLabel.text = [NSString stringWithFormat:@"%f", [DRDouble sharedDouble].batteryPercent];
	batteryIsFullyChargedLabel.text = [NSString stringWithFormat:@"%d", [DRDouble sharedDouble].batteryIsFullyCharged];
	firmwareVersionLabel.text = [DRDouble sharedDouble].firmwareVersion;
	serialLabel.text = [DRDouble sharedDouble].serial;*/
}

- (void)doubleDriveShouldUpdate:(DRDouble *)theDouble {
	float drive = (driveForwardButton.highlighted) ? kDRDriveDirectionForward : ((driveBackwardButton.highlighted) ? kDRDriveDirectionBackward : kDRDriveDirectionStop);
	float turn = (driveRightButton.highlighted) ? 1.0 : ((driveLeftButton.highlighted) ? -1.0 : 0.0);
	[theDouble drive:drive turn:turn];
}

- (void)doubleTravelDataDidUpdate:(DRDouble *)theDouble {
	/*leftEncoderLabel.text = [NSString stringWithFormat:@"%.02f", [leftEncoderLabel.text floatValue] + [DRDouble sharedDouble].leftEncoderDeltaInches];
	rightEncoderLabel.text = [NSString stringWithFormat:@"%.02f", [rightEncoderLabel.text floatValue] + [DRDouble sharedDouble].rightEncoderDeltaInches];
	NSLog(@"Left Encoder: %f, Right Encoder: %f", theDouble.leftEncoderDeltaInches, theDouble.rightEncoderDeltaInches);*/
}

- (IBAction)switchScanView {
    
    [self presentViewController:[[ViewController alloc] init] animated:true completion:nil];
    
}
@end
