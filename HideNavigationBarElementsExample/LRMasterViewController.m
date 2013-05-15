//
//  LRMasterViewController.m
//  HideNavigationBarElementsExample
//
//  Created by Larry Ryan on 5/14/13.
//  Copyright (c) 2013 Thinkr LLC. All rights reserved.
//

#import "LRMasterViewController.h"

#import "UINavigationBar+LRHideElements.h"

@interface LRMasterViewController ()

@property (nonatomic, strong) UINavigationBar *navigationBar;

@property (weak, nonatomic) IBOutlet UIButton *toggleBackgroundButton;
@property (weak, nonatomic) IBOutlet UIButton *toggleTitleButton;
@property (weak, nonatomic) IBOutlet UIButton *toggleLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *toggleRightButton;


- (IBAction)toggleBackground:(UIButton *)sender;
- (IBAction)toggleTitle:(UIButton *)sender;
- (IBAction)toggleLeftButton:(UIButton *)sender;
- (IBAction)toggleRightButton:(UIButton *)sender;

@end

@implementation LRMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationBar = self.navigationController.navigationBar;
    self.navigationBar.tintColor = [UIColor colorWithHue:0.6 saturation:1.0 brightness:0.8 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        
    }
}

- (IBAction)toggleBackground:(UIButton *)sender
{
    sender.selected = sender.selected ? NO : YES;
    
    [self.navigationBar hideNavigationBarSubviews:sender.selected withOptions:NavigationBarOptionHideBackground animated:YES];
}

- (IBAction)toggleTitle:(UIButton *)sender
{
    sender.selected = sender.selected ? NO : YES;
    
    [self.navigationBar hideNavigationBarSubviews:sender.selected withOptions:NavigationBarOptionHideTitle animated:YES];
}

- (IBAction)toggleLeftButton:(UIButton *)sender
{
    sender.selected = sender.selected ? NO : YES;
    
    [self.navigationBar hideNavigationBarSubviews:sender.selected withOptions:NavigationBarOptionHideLeftItems animated:YES];
}

- (IBAction)toggleRightButton:(UIButton *)sender
{
    sender.selected = sender.selected ? NO : YES;
    
    [self.navigationBar hideNavigationBarSubviews:sender.selected withOptions:NavigationBarOptionHideRightItems animated:YES];
}

@end
