//
//  TIMActionManager.h
//  TUIChat
//
//  Created by zhangbeibei on 2024/7/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TIMActionManager : NSObject

+ (instancetype)shareManager;

- (void)configJumpAction:(void(^)(NSString *target,NSString *base64QueryStr))jumpAction;

- (void)handleJumpAction:(NSString *)target query:(NSString *)base64QueryStr;

// dic 包含target，query
- (void)handleJumpAction:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
