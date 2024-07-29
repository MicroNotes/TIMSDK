//
//  TUICardCellData.m
//  TUIChat
//
//  Created by zhangbeibei on 2024/7/27.
//

#import "TUICardCellData.h"

@implementation TUICardCellData

+ (TUIMessageCellData *)getCellData:(V2TIMMessage *)message {
    NSDictionary *param = [NSJSONSerialization JSONObjectWithData:message.customElem.data options:NSJSONReadingAllowFragments error:nil];
    TUICardCellData *cellData = [[TUICardCellData alloc] initWithDirection:message.isSelf ? MsgDirectionOutgoing : MsgDirectionIncoming];
    cellData.innerMessage = message;
    cellData.msgID = message.msgID;
    cellData.title = param[@"title"];
    NSString *strActionJson = param[@"action"];
    
    NSError *error;
    NSData *jsonData = [strActionJson dataUsingEncoding:NSUTF8StringEncoding];
    cellData.actionDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"error:%@",error.description);
    }
#warning 测试数据
//    cellData.actionDic = @{@"target":@"h5",@"query":@"ewogICJ1cmwiOiAiaHR0cHM6Ly9oYmMtaW5mby50ZXN0Lmh1YW5nYmFvY2hlLmNvbS9oNVRvQXBwLyIsCiAgInF1ZXJ5IjogInRhYj0xIgp9"};
    
    cellData.imgUrl = param[@"imgUrl"];
    NSString *copyright = param[@"copyright"];
    if (copyright.length == 0) {
        copyright = @"皇包车旅行";
    }
    cellData.copyright = copyright;
    cellData.avatarUrl = [NSURL URLWithString:message.faceURL];
    return cellData;
}

+ (NSString *)getDisplayString:(V2TIMMessage *)message {
    NSDictionary *param = [NSJSONSerialization JSONObjectWithData:message.customElem.data options:NSJSONReadingAllowFragments error:nil];
    return param[@"text"];
}

- (CGSize)contentSize {
    CGSize size = CGSizeMake(240, 256);
    return size;
}

@end
