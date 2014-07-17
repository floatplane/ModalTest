//
//  ViewController.m
//  ModalTest
//
//  Created by Brian Sharon on 7/17/14.
//  Copyright (c) 2014 Brian Sharon. All rights reserved.
//

#import "ViewController.h"
#import "BackgroundView.h"
#import "ModalViewController.h"

@interface ViewController () <BackgroundViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *viewTouchesBegan;
@property (weak, nonatomic) IBOutlet UILabel *viewTouchesMoved;
@property (weak, nonatomic) IBOutlet UILabel *viewTouchesCancelled;
@property (weak, nonatomic) IBOutlet UILabel *viewTouchesEnded;
@property (weak, nonatomic) IBOutlet UILabel *touchesBegan;
@property (weak, nonatomic) IBOutlet UILabel *touchesMoved;
@property (weak, nonatomic) IBOutlet UILabel *touchesEnded;
@property (weak, nonatomic) IBOutlet UILabel *touchesCancelled;
@property (strong, nonatomic) IBOutlet BackgroundView *backgroundView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.backgroundView.touchDelegate = self;
    for (UIView *item in @[self.viewTouchesBegan, self.viewTouchesCancelled, self.viewTouchesEnded, self.viewTouchesMoved,
                           self.touchesBegan, self.touchesCancelled, self.touchesEnded, self.touchesMoved])
    {
        item.alpha = 0.f;
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fadeUpDown:(UIView *)control
{
    control.layer.opacity = [control.layer.presentationLayer opacity];
    [control.layer removeAllAnimations];
    [UIView animateWithDuration:0.25f animations:^{
        control.alpha = 1.0f;
    } completion:^(BOOL finished) {
        if (finished)
        {
            [UIView animateWithDuration:1.f animations:^{
                control.alpha = 0.0f;
            }];
        }
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self fadeUpDown:self.touchesBegan];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self fadeUpDown:self.touchesCancelled];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [self fadeUpDown:self.touchesMoved];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self fadeUpDown:self.touchesEnded];
}

- (void)gotTouchesBegan
{
    [self fadeUpDown:self.viewTouchesBegan];
}

- (void)gotTouchesMoved
{
    [self fadeUpDown:self.viewTouchesMoved];
}

- (void)gotTouchesCancelled
{
    [self fadeUpDown:self.viewTouchesCancelled];
}

- (void)gotTouchesEnded
{
    [self fadeUpDown:self.viewTouchesEnded];
}

- (IBAction)showSystemAlert:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Consider yourself alerted" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil] show];
}

- (IBAction)showModalFormSheet:(id)sender {
    ModalViewController *modal = [[ModalViewController alloc] init];
    modal.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:modal animated:YES completion:^{
    }];
}
@end
