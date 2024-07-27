//
//  TUICardCell.h
//  TUIChat
//
//  Created by zhangbeibei on 2024/7/27.
//

#import <TIMCommon/TUIBubbleMessageCell.h>
#import "TUICardCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface TUICardCell : TUIBubbleMessageCell

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UIImageView *contentImageView;
@property(nonatomic, strong) UIImageView *iconView;
@property(nonatomic, strong) UILabel *copyrightLabel;

@property(nonatomic, strong) TUICardCellData *customData;

- (void)fillWithData:(TUICardCellData *)data;

@end

NS_ASSUME_NONNULL_END
