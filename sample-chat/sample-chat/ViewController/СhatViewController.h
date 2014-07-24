//
//  СhatViewController.h
//  sample-chat
//
//  Created by Igor Khomenko on 10/18/13.
//  Copyright (c) 2013 Igor Khomenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


#define kNotificationDidReceiveNewMessage @"kNotificationDidReceiveNewMessage"
#define kNotificationDidReceiveNewMessageFromRoom @"kNotificationDidReceiveNewMessageFromRoom"
#define kMessage @"kMessage"
#define kRoomJID @"kRoomJID"


@interface ChatViewController : UIViewController<QBChatDelegate, AVAudioPlayerDelegate, UIAlertViewDelegate>{
    IBOutlet UILabel *ringigngLabel;
    IBOutlet UIActivityIndicatorView *callingActivityIndicator;
    IBOutlet UIActivityIndicatorView *startingCallActivityIndicator;
    IBOutlet UIImageView *opponentVideoView;
    IBOutlet UIImageView *myVideoView;
    IBOutlet UINavigationBar *navBar;
    IBOutlet UISegmentedControl *audioOutput;
    IBOutlet UISegmentedControl *videoOutput;
    IBOutlet UIView *viewCall;
    AVAudioPlayer *ringingPlayer;
    
    //
    NSUInteger videoChatOpponentID;
    enum QBVideoChatConferenceType videoChatConferenceType;
    NSString *sessionID;
    QBChat *chat;
    QBVideoChat *videoChat;
}

@property (nonatomic, strong) QBChatDialog *dialog;
@property (retain) QBVideoChat *videoChat;
@property (retain) UIAlertView *callAlert;

- (void)reject;
- (void)accept;

@end
