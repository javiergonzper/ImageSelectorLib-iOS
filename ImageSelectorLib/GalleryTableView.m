//
//  GalleryTableView.m
//  ImageSelectorLib
//
//  Created by Javier González Pérez on 23/12/12.
//  Copyright (c) 2012 Develplace. All rights reserved.
//

#import "GalleryTableView.h"
#import "ImageCell.h"
#import "ImageCell_iPad.h"

@interface GalleryTableView ()

@end

@implementation GalleryTableView
@synthesize imagesList = _imagesList;
@synthesize imagesNameList = _imagesNameList;
@synthesize selectedImage = _selectedImage;
@synthesize numberOfImagesPerRow = _numberOfImagesPerRow;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Choose Image"];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"choose" style:UIBarButtonItemStylePlain target:self action:@selector(chooseIcon)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.imagesNameList = [[NSMutableArray alloc] init];
    [self.imagesNameList addObject:@"orange_juice.png"];
    [self.imagesNameList addObject:@"sandwich.png"];
    [self.imagesNameList addObject:@"omelette.png"];
    [self.imagesNameList addObject:@"coke.png"];
    [self.imagesNameList addObject:@"lazo.png"];
    [self.imagesNameList addObject:@"hot_chocolate.png"];

    self.imagesList = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < [self.imagesNameList count] ; i++) {
        [self.imagesList addObject:[UIImage imageNamed:[self.imagesNameList objectAtIndex:i]]];
    }
    
    self.selectedImage = -1;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.numberOfImagesPerRow = 4;
    } else {
        self.numberOfImagesPerRow = 6;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) chooseIcon {
    NSLog(@"Icon selected: %@", [self.imagesNameList objectAtIndex:self.selectedImage]);
    
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    //iOS6
    [self dismissViewControllerAnimated:YES completion:nil];
    //iOS 5
    //[[self parentViewController] dismissModalViewControllerAnimated:YES];
    
    
    //[self.view removeFromSuperview];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int numberOfRows = [self.imagesList count]/self.numberOfImagesPerRow;
    
    if([self.imagesList count]%self.numberOfImagesPerRow > 0) {
        numberOfRows++;
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        static NSString *CellIdentifier = @"ImageCell";
        
        ImageCell *cell = (ImageCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
            
            for (id currentObject in topLevelObjects){
                if ([currentObject isKindOfClass:[UITableViewCell class]]){
                    cell =  (ImageCell *) currentObject;
                    break;
                }
            }
        }
        
        int imagePositionXY = 0;
        if(indexPath.row > 0) {
            imagePositionXY = (indexPath.row*self.numberOfImagesPerRow);
        }
        
        cell.delegate = self;
        
        cell.arrayPositionFirstImage = imagePositionXY;
        [cell.button1 setBackgroundImage:[self.imagesList objectAtIndex:imagePositionXY] forState:UIControlStateNormal];
        [cell.imageOverlay1 setHidden:YES];
        
        if([self.imagesList count]-1 >= imagePositionXY+1) {
            [cell.button2 setBackgroundImage:[self.imagesList objectAtIndex:imagePositionXY+1] forState:UIControlStateNormal];
            [cell.imageOverlay2 setHidden:YES];
        }
        
        if([self.imagesList count]-1 >= imagePositionXY+2) {
            [cell.button3 setBackgroundImage:[self.imagesList objectAtIndex:imagePositionXY+2] forState:UIControlStateNormal];
            [cell.imageOverlay3 setHidden:YES];
        }
        
        if([self.imagesList count]-1 >= imagePositionXY+3) {
            [cell.button4 setBackgroundImage:[self.imagesList objectAtIndex:imagePositionXY+3] forState:UIControlStateNormal];
            [cell.imageOverlay4 setHidden:YES];
        }
        
        if(self.selectedImage >= 0) {
            if(imagePositionXY == self.selectedImage) {
                [cell.imageOverlay1 setHidden:NO];
            } else if(imagePositionXY+1 == self.selectedImage){
                [cell.imageOverlay2 setHidden:NO];
            } else if(imagePositionXY+2 == self.selectedImage){
                [cell.imageOverlay3 setHidden:NO];
            } else if(imagePositionXY+3 == self.selectedImage){
                [cell.imageOverlay4 setHidden:NO];
            }
        }
        
        
        return cell;
    } else {
        static NSString *CellIdentifier = @"ImageCell_iPad";
        
        ImageCell_iPad *cell = (ImageCell_iPad *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
            
            for (id currentObject in topLevelObjects){
                if ([currentObject isKindOfClass:[UITableViewCell class]]){
                    cell =  (ImageCell_iPad *) currentObject;
                    break;
                }
            }
        }
        
        int imagePositionXY = 0;
        if(indexPath.row > 0) {
            imagePositionXY = (indexPath.row*self.numberOfImagesPerRow);
        }
        
        cell.delegate = self;
        
        cell.arrayPositionFirstImage = imagePositionXY;
        [cell.button1 setBackgroundImage:[self.imagesList objectAtIndex:imagePositionXY] forState:UIControlStateNormal];
        [cell.imageOverlay1 setHidden:YES];
        
        if([self.imagesList count]-1 >= imagePositionXY+1) {
            [cell.button2 setBackgroundImage:[self.imagesList objectAtIndex:imagePositionXY+1] forState:UIControlStateNormal];
            [cell.imageOverlay2 setHidden:YES];
        }
        
        if([self.imagesList count]-1 >= imagePositionXY+2) {
            [cell.button3 setBackgroundImage:[self.imagesList objectAtIndex:imagePositionXY+2] forState:UIControlStateNormal];
            [cell.imageOverlay3 setHidden:YES];
        }
        
        if([self.imagesList count]-1 >= imagePositionXY+3) {
            [cell.button4 setBackgroundImage:[self.imagesList objectAtIndex:imagePositionXY+3] forState:UIControlStateNormal];
            [cell.imageOverlay4 setHidden:YES];
        }
        if([self.imagesList count]-1 >= imagePositionXY+4) {
            [cell.button5 setBackgroundImage:[self.imagesList objectAtIndex:imagePositionXY+4] forState:UIControlStateNormal];
            [cell.imageOverlay5 setHidden:YES];
        }
        if([self.imagesList count]-1 >= imagePositionXY+5) {
            [cell.button6 setBackgroundImage:[self.imagesList objectAtIndex:imagePositionXY+5] forState:UIControlStateNormal];
            [cell.imageOverlay6 setHidden:YES];
        }
        
        if(self.selectedImage >= 0) {
            if(imagePositionXY == self.selectedImage) {
                [cell.imageOverlay1 setHidden:NO];
            } else if(imagePositionXY+1 == self.selectedImage){
                [cell.imageOverlay2 setHidden:NO];
            } else if(imagePositionXY+2 == self.selectedImage){
                [cell.imageOverlay3 setHidden:NO];
            } else if(imagePositionXY+3 == self.selectedImage){
                [cell.imageOverlay4 setHidden:NO];
            } else if(imagePositionXY+4 == self.selectedImage){
                [cell.imageOverlay5 setHidden:NO];
            } else if(imagePositionXY+5 == self.selectedImage){
                [cell.imageOverlay6 setHidden:NO];
            }
        }
        
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	float height;

    height = 79.0;
    
    return height;
	
}

-(void) reloadTableAfterSelectImage:(int) selectedImage {
    
    if(selectedImage < [self.imagesList count]) {
        self.selectedImage = selectedImage;
        [self.tableView reloadData];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
