//
//  SplashViewController.m
//  sample-chat
//
//  Created by Igor Khomenko on 10/16/13.
//  Copyright (c) 2013 Igor Khomenko. All rights reserved.
//

#import "SplashViewController.h"



@interface SplashViewController () <QBActionStatusDelegate>

@end

@implementation SplashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    loadingView = [[UIView alloc]initWithFrame:self.view.frame];
    loadingView.backgroundColor=[UIColor grayColor];
    loadingView.alpha=0.5f;
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.alpha = 1.0;
    activityIndicator.center = self.view.center;
    activityIndicator.hidesWhenStopped = NO;
    [loadingView addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
}

-(IBAction)Login:(id)sender {
    // Do any additional setup after loading the view.
    
    // Your app connects to QuickBlox server here.
    //
    // QuickBlox session creation
    
    
    
    [self.view addSubview:loadingView];
    QBASessionCreationRequest *extendedAuthRequest = [QBASessionCreationRequest request];
    extendedAuthRequest.userLogin = txtFeildName.text;
    extendedAuthRequest.userPassword = txtFeildPassword.text;
    //
	[QBAuth createSessionWithExtendedRequest:extendedAuthRequest delegate:self];
 
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return TRUE;
}


#pragma mark -
#pragma mark QBActionStatusDelegate

// QuickBlox API queries delegate
- (void)completedWithResult:(Result *)result{
    
    // QuickBlox session creation  result
    if([result isKindOfClass:[QBAAuthSessionCreationResult class]]){
        
        // Success result
        if(result.success){

            QBAAuthSessionCreationResult *res = (QBAAuthSessionCreationResult *)result;
            
            // Save current user
            //
            QBUUser *currentUser = [QBUUser user];
            currentUser.ID = res.session.userID;
            currentUser.login = txtFeildName.text;
            currentUser.password = txtFeildPassword.text;
            //
            [[LocalStorageService shared] setCurrentUser:currentUser];
            
            // Login to QuickBlox Chat
            //
            [[ChatService instance] loginWithUser:currentUser completionBlock:^{
                
                // hide alert after delay
                double delayInSeconds = 1.0;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    [loadingView removeFromSuperview];
                    [self dismissViewControllerAnimated:YES completion:nil];
                });
            }];

        }else{
           [loadingView removeFromSuperview];
            NSString *errorMessage = [[result.errors description] stringByReplacingOccurrencesOfString:@"(" withString:@""];
            errorMessage = [errorMessage stringByReplacingOccurrencesOfString:@")" withString:@""];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Errors"
                                                            message:errorMessage
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
}

@end
