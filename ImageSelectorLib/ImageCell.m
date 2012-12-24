//
//  ImageCell.m
//  ImageSelectorLib
//
//  Created by Javier González Pérez on 23/12/12.
//  Copyright (c) 2012 Develplace. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

@synthesize imageOverlay1, imageOverlay2, imageOverlay3, imageOverlay4;
@synthesize button1, button2, button3, button4;
@synthesize arrayPositionFirstImage;
@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)selectImage1:(id)sender {
    [self.delegate reloadTableAfterSelectImage:arrayPositionFirstImage];
}

-(IBAction)selectImage2:(id)sender {
    [self.delegate reloadTableAfterSelectImage:arrayPositionFirstImage+1];
}

-(IBAction)selectImage3:(id)sender {
    [self.delegate reloadTableAfterSelectImage:arrayPositionFirstImage+2];
}

-(IBAction)selectImage4:(id)sender {
    [self.delegate reloadTableAfterSelectImage:arrayPositionFirstImage+3];
}


@end
