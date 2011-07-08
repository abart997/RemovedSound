#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#define TRASH_PATH @"/var/mobile/Library/RemovedApp/emptytrash.aif"

AVAudioPlayer *audioPlayer;

%hook SBDeleteIconAlertItem
-(void)alertView:(id)view clickedButtonAtIndex:(int)index{

NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.abart997.removedapp.plist"];


static BOOL value = NO;


value = [[plist objectForKey:@"apps"]boolValue];

if(!value){
return %orig;
} else if (value){

if(index == 0){
%orig;

 NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:TRASH_PATH]];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        audioPlayer.numberOfLoops = 0;
		audioPlayer.volume = 1.0;
		[audioPlayer play];
	}
	}
	}

%end


%hook MailboxContentViewController

-(void)_reallyDeleteMessages:(id)messages{


NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.abart997.removedapp.plist"];


static BOOL values = NO;

values = [[plist objectForKey:@"mail"]boolValue];

if(!values){
return %orig;
} else if (values){
%orig;

 NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:TRASH_PATH]];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        audioPlayer.numberOfLoops = 0;
		audioPlayer.volume = 1.0;
		[audioPlayer play];
	}
	}
	

%end

%hook NotesDisplayController

-(void)actionSheet:(id)sheet clickedButtonAtIndex:(int)index{


NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.abart997.removedapp.plist"];

static BOOL valuet = NO;

valuet = [[plist objectForKey:@"notes"]boolValue];

if(!valuet){
return %orig;
} else if (valuet){
if(index == 0){
%orig;

 NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:TRASH_PATH]];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        audioPlayer.numberOfLoops = 0;
		audioPlayer.volume = 1.0;
		[audioPlayer play];
		}
	}
}	
	
%end


