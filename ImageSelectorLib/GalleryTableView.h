//
//  GalleryTableView.h
//  ImageSelectorLib
//
//  Created by Javier González Pérez on 23/12/12.
//  Copyright (c) 2012 Develplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCell.h"
#import "ImageCell_iPad.h"

@interface GalleryTableView : UITableViewController <ImageCellDelegate, ImageCellDelegateIpad> {
    NSMutableArray *_imagesList;
    NSMutableArray *_imagesNameList;
    int _selectedImage;
    int _numberOfImagesPerRow;
}
@property (strong, nonatomic) NSMutableArray *imagesList;
@property (strong, nonatomic) NSMutableArray *imagesNameList;
@property (nonatomic, assign) int selectedImage;
@property (nonatomic, assign) int numberOfImagesPerRow;

@end
