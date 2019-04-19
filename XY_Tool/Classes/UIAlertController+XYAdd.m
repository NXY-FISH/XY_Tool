//
//  UIAlertController+XYAdd.m
//  tool
//
//  Created by 聂晓昀 on 2019/3/26.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "UIAlertController+XYAdd.h"

@implementation UIAlertController (XYAdd)

+(instancetype)xy_alertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle confirmBlok:(confirmBlock)confirmBlcok cancelBlock:(cancelBlock)cancelBlock
{
    UIAlertController *alertController = [self alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *confrimAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlcok) {
            confirmBlcok();
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:confrimAction];
    return alertController;
}

+(instancetype)xy_alertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle actionTitlte:(NSString *)actionTitle actionStyle:(UIAlertActionStyle)actionStyle actionBlock:(confirmBlock)actionBlock
{
    UIAlertController *alertController = [self alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:actionStyle handler:^(UIAlertAction * _Nonnull action) {
        if (actionBlock) {
            actionBlock();
        }
    }];
    [alertController addAction:action];
    return alertController;
}


+(instancetype)xy_alertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle leftActionTitle:(NSString *)leftActionTitle leftActionStyle:(UIAlertActionStyle)leftActionStyle rightActionTitle:(NSString *)rightActionTitle rightActionStyle:(UIAlertActionStyle)rightActionStyle leftBlok:(confirmBlock)leftBlok rightBlock:(cancelBlock)rightBlock
{
    UIAlertController *alertController = [self alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftActionTitle style:leftActionStyle handler:^(UIAlertAction * _Nonnull action) {
        if (leftBlok) {
            leftBlok();
        }
    }];
    UIAlertAction *rightAction = [UIAlertAction actionWithTitle:rightActionTitle style:rightActionStyle handler:^(UIAlertAction * _Nonnull action) {
        if (rightBlock) {
            rightBlock();
        }
    }];
    [alertController addAction:leftAction];
    [alertController addAction:rightAction];
    return alertController;
}

@end
