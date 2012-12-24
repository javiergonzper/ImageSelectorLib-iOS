//
//  ImageCell_iPad.h
//  ImageSelectorLib
//
//  Created by Javier González Pérez on 23/12/12.
//  Copyright (c) 2012 Develplace. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageCellDelegateIpad

@optional
-(void) reloadTableAfterSelectImage:(int) selectedImage;
@end

@interface ImageCell_iPad : UITableViewCell {
    IBOutlet UIImageView *imageOverlay1;
    IBOutlet UIImageView *imageOverlay2;
    IBOutlet UIImageView *imageOverlay3;
    IBOutlet UIImageView *imageOverlay4;
    IBOutlet UIImageView *imageOverlay5;
    IBOutlet UIImageView *imageOverlay6;
    
    IBOutlet UIButton *button1;
    IBOutlet UIButton *button2;
    IBOutlet UIButton *button3;
    IBOutlet UIButton *button4;
    IBOutlet UIButton *button5;
    IBOutlet UIButton *button6;
    
    int arrayPositionFirstImage;
    
    __weak id<ImageCellDelegateIpad> _delegate;
}

@property (nonatomic,retain) IBOutlet UIImageView *imageOverlay1;
@property (nonatomic,retain) IBOutlet UIImageView *imageOverlay2;
@property (nonatomic,retain) IBOutlet UIImageView *imageOverlay3;
@property (nonatomic,retain) IBOutlet UIImageView *imageOverlay4;
@property (nonatomic,retain) IBOutlet UIImageView *imageOverlay5;
@property (nonatomic,retain) IBOutlet UIImageView *imageOverlay6;
@property (nonatomic,retain) IBOutlet UIButton *button1;
@property (nonatomic,retain) IBOutlet UIButton *button2;
@property (nonatomic,retain) IBOutlet UIButton *button3;
@property (nonatomic,retain) IBOutlet UIButton *button4;
@property (nonatomic,retain) IBOutlet UIButton *button5;
@property (nonatomic,retain) IBOutlet UIButton *button6;
@property (nonatomic, assign) int arrayPositionFirstImage;
@property (nonatomic, weak) __weak id <ImageCellDelegateIpad> delegate;

-(IBAction)selectImage1:(id)sender;
-(IBAction)selectImage2:(id)sender;
-(IBAction)selectImage3:(id)sender;
-(IBAction)selectImage4:(id)sender;
-(IBAction)selectImage5:(id)sender;
-(IBAction)selectImage6:(id)sender;

@end
