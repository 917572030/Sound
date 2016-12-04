//
//  ViewController.m
//  ShakeAndSound
//
//  Created by chenbo on 16/6/29.
//  Copyright © 2016年 chenbo. All rights reserved.
//

#import "ViewController.h"
#import "CBShakeAdSounds.h"

@interface ViewController ()
{
    CBShakeAdSounds *_shakeAdSound;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//震动
- (IBAction)shakeClick:(id)sender {
    
    _shakeAdSound = [[CBShakeAdSounds alloc]initForShake];
    [_shakeAdSound play];
    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);//震动
}
//声音
- (IBAction)soundClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.selected ^= 1;
    if (btn.selected) {
        //调用系统声音(方法1)
        _shakeAdSound = [[CBShakeAdSounds alloc]initForPlayingSystemSoundEffectWith:@"dtmf-0" ofType:@"caf"];
        //方法2
        //    AudioServicesPlaySystemSound (1007);//声音
    }else{
        //调用自定义声音
        _shakeAdSound = [[CBShakeAdSounds alloc]initForPlayingSoundEffectWith:@"7200.mp3"];
    }
    [_shakeAdSound play];

}
@end
