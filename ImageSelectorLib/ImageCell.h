//
//  ImageCell.h
//  ImageSelectorLib
//
//  Created by Javier González Pérez on 23/12/12.
//  Copyright (c) 2012 Develplace. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageCellDelegate

@optional
-(void) reloadTableAfterSelectImage:(int) selectedImage;
@end

@interface ImageCell : UITableViewCell {
    IBOutlet UIImageView *imageOverlay1;
    IBOutlet UIImageView *imageOverlay2;
    IBOutlet UIImageView *imageOverlay3;
    IBOutlet UIImageView *imageOverlay4;
    
    IBOutlet UIButton *button1;
    IBOutlet UIButton *button2;
    IBOutlet UIButton *button3;
    IBOutlet UIButton *button4;
    
    int arrayPositionFirstImage;
    
    __weak id<ImageCellDelegate> _delegate;
}

@property (nonatomic,retain) IBOutlet UIImageView *imageOverlay1;
@property (nonatomic,retain) IBOutlet UIImageView *imageOverlay2;
@property (nonatomic,retain) IBOutlet UIImageView *imageOverlay3;
@property (nonatomic,retain) IBOutlet UIImageView *imageOverlay4;
@property (nonatomic,retain) IBOutlet UIButton *button1;
@property (nonatomic,retain) IBOutlet UIButton *button2;
@property (nonatomic,retain) IBOutlet UIButton *button3;
@property (nonatomic,retain) IBOutlet UIButton *button4;
@property (nonatomic, assign) int arrayPositionFirstImage;
@property (nonatomic, weak) __weak id <ImageCellDelegate> delegate;

-(IBAction)selectImage1:(id)sender;
-(IBAction)selectImage2:(id)sender;
-(IBAction)selectImage3:(id)sender;
-(IBAction)selectImage4:(id)sender;



@end
