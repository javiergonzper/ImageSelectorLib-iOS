//
//  ViewController.m
//  ImageSelectorLib
//
//  Created by Javier González Pérez on 23/12/12.
//  Copyright (c) 2012 Develplace. All rights reserved.
//

#import "ViewController.h"
#import "GalleryTableView.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)openGallery:(id)sender{
    GalleryTableView *viewController = nil;
    
    //TODO: check iPad
    viewController = [[GalleryTableView alloc]initWithNibName:@"GalleryTableView_iPhone" bundle:nil];
    
    //Hide tabbar
    viewController.hidesBottomBarWhenPushed = YES;
    
    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:viewController];

    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        navBar.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
        navBar.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    
    //iOS 5
    //[self.navigationController pushViewController:navBar animated:YES];
    
    //iOS6
    [self presentViewController:navBar animated:YES completion:nil];
    
}

@end
