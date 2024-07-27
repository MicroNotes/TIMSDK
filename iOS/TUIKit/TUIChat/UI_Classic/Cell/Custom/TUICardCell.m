//
//  TUICardCell.m
//  TUIChat
//
//  Created by zhangbeibei on 2024/7/27.
//

#import "TUICardCell.h"
#import <TUICore/TUIGlobalization.h>
#import <TUICore/TUIThemeManager.h>

@interface TUICardCell ()

//
@property (nonatomic,strong) UIView *lineView;

@end

@implementation TUICardCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.container.backgroundColor = [UIColor whiteColor];
        self.container.layer.cornerRadius = 6;
        self.container.layer.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.1].CGColor;
        self.container.layer.shadowOffset = CGSizeMake(0,0);
        self.container.layer.shadowOpacity = 1;
        self.container.layer.shadowRadius = 6;
    
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = TUIChatDynamicColor(@"chat_text_message_receive_text_color", @"#000000");
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.container addSubview:_titleLabel];

        _contentImageView = [[UIImageView alloc] init];
        _contentImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.container addSubview:_contentImageView];
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = TUIChatDynamicColor(@"chat_text_message_receive_text_color", @"#dbdbdb");
        [self.container addSubview:_lineView];

        _iconView = [[UIImageView alloc] init];
        _iconView.image = [[TUIImageCache sharedInstance] getResourceFromCache:TUIChatImagePath(@"chat_card_miniicon")];
        [self.container addSubview:_iconView];
        
        _copyrightLabel = [[UILabel alloc] init];
        _copyrightLabel.font = [UIFont systemFontOfSize:12];
        _copyrightLabel.textColor = TUIChatDynamicColor(@"chat_custom_order_message_price_color", @"#666666");
        [self.container addSubview:_copyrightLabel];


    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(15, 15, self.container.bounds.size.width - 30, 44);
    self.contentImageView.frame = CGRectMake(15, CGRectGetMaxY(self.titleLabel.frame)+5, self.titleLabel.frame.size.width, 160);
    self.lineView.frame = CGRectMake(15, CGRectGetMaxY(self.contentImageView.frame)+5, self.container.bounds.size.width - 30, 0.5);
    self.iconView.frame = CGRectMake(15, CGRectGetMaxY(self.contentImageView.frame) + 10, 16, 16);
    self.copyrightLabel.frame = CGRectMake(CGRectGetMaxX(self.iconView.frame)+5, CGRectGetMaxY(self.contentImageView.frame)+5, self.container.frame.size.width - 15 - CGRectGetMaxX(self.iconView.frame) - 5, 26);
}

- (void)fillWithData:(TUICardCellData *)data {
    [super fillWithData:data];

    self.customData = data;
    self.titleLabel.text = data.title;
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:data.imgUrl]];
    if ([data.imgUrl isEqualToString:@"1"] ||
        [data.imgUrl isEqualToString:@"2"] ||
        [data.imgUrl isEqualToString:@"3"]) {
        NSString *imgName = [NSString stringWithFormat:@"chat_card_pic%@",data.imgUrl];
        self.contentImageView.image = [[TUIImageCache sharedInstance] getResourceFromCache:TUIChatImagePath(imgName)];
    } else {
        [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:data.imgUrl]];
    }
    self.copyrightLabel.text = data.copyright;
}

#pragma mark - TUIMessageCellProtocol
+ (CGSize)getContentSize:(TUIMessageCellData *)data {
    CGSize size = CGSizeMake(240, 256);
    return size;
}



@end
