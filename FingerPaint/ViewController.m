//
//  ViewController.m
//  FingerPaint
//
//  Created by Tenzin Phagdol on 2016-03-18.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "ViewController.h"
#import "Pallet.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet Pallet *pallet;
@end


@implementation ViewController

//buttons connected to this view controller will effect the Pallet UIView
- (IBAction)pencilPressed:(UIButton *)sender {
    switch(sender.tag)
    {
        case 0:
            self.pallet.colorChange = [UIColor blackColor];
            break;
        case 1:
            self.pallet.colorChange = [UIColor blueColor];
            break;
        case 2:
            self.pallet.colorChange = [UIColor redColor];
            break;
        case 3:
            self.pallet.colorChange = [UIColor greenColor];
            break;
        case 4:
            self.pallet.colorChange = [UIColor yellowColor];
            break;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
