//
//  TIMActionManager.m
//  TUIChat
//
//  Created by zhangbeibei on 2024/7/27.
//

#import "TIMActionManager.h"

@interface TIMActionManager ()

// 跳转处理block
@property (nonatomic,copy) void(^blockHandleAction)(NSString *target,NSString *base64QueryStr);

@end

@implementation TIMActionManager

+ (instancetype)shareManager {
    static TIMActionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TIMActionManager alloc] init];
    });
    return manager;
}


- (void)configJumpAction:(void(^)(NSString *target,NSString *base64QueryStr))jumpAction {
    self.blockHandleAction = jumpAction;
}


- (void)handleJumpAction:(NSString *)target query:(NSString *)base64QueryStr {
    if (self.blockHandleAction) {
        self.blockHandleAction(target, base64QueryStr);
    }
}

// dic 包含target，query
- (void)handleJumpAction:(NSDictionary *)dic {
    [self handleJumpAction:dic[@"target"] query:dic[@"query"]];
}

@end
