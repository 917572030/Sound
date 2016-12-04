//
//  CBShakeAdSounds.m
//  ShakeAndSound
//
//  Created by chenbo on 16/6/29.
//  Copyright © 2016年 chenbo. All rights reserved.
//

#import "CBShakeAdSounds.h"

@implementation CBShakeAdSounds

- (id)initForShake {
    self = [super init];
    if (self) {
        soundID = kSystemSoundID_Vibrate;
    }
    return self;
}

- (id)initForPlayingSystemSoundEffectWith:(NSString *)resourceName ofType:(NSString *)type
{
    self = [super init];
    if (self) {
        NSString *path = [NSString stringWithFormat:@"/System/Library/Audio/UISounds/%@.%@",resourceName,type];
        if (path) {
            SystemSoundID theSoundID;
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &theSoundID);
            if (error == kAudioServicesNoError) {
                soundID = theSoundID;
            }else {
                NSLog(@"创建音效失败");
            }
        }
    }
    return self;
}

- (id)initForPlayingSoundEffectWith:(NSString *)filename {
    
    self = [super init];
    if (self) {
        NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (fileUrl != nil) {
            SystemSoundID theSOundID;
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileUrl, &theSOundID);
            if (error == kAudioServicesNoError) {
                soundID = theSOundID;
            }else {
                NSLog(@"创建声音失败");
            }
        }
    }
    return self;
}

- (void)play {
    
    AudioServicesPlayAlertSound(soundID);
}

- (void)dealloc {
    AudioServicesDisposeSystemSoundID(soundID);
}
@end
