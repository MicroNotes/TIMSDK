//
//  TUICardCellData.h
//  TUIChat
//
//  Created by zhangbeibei on 2024/7/27.
//

#import <TIMCommon/TUIBubbleMessageCellData.h>

NS_ASSUME_NONNULL_BEGIN

@interface TUICardCellData : TUIBubbleMessageCellData

//
@property (nonatomic,copy) NSString * title;
//
@property (nonatomic,copy) NSString * imgUrl;
//
@property (nonatomic,copy) NSString * copyright;
//
@property (nonatomic,strong) NSDictionary *actionDic;


@end

NS_ASSUME_NONNULL_END
