//
//  UIButton+ActionExtend.m
//  InterceptionEvent
//
//  Created by qiangzhi on 2021/7/26.
//

#import "UIButton+ActionExtend.h"
#import <objc/runtime.h>

@implementation UIButton (ActionExtend)

+ (void)load {
    [super load];

    Method sendActionMethod = class_getInstanceMethod([UIButton class], @selector(sendAction:to:forEvent:));
    Method hooksendActionMethod = class_getInstanceMethod([UIButton class], @selector(wj_sendAction:to:forEvent:));
    method_exchangeImplementations(sendActionMethod, hooksendActionMethod);
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    [super sendAction:action to:target forEvent:event];
}

- (void)wj_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSLog(@"拦截方法 ： %s", __func__);
    [self wj_sendAction:action to:target forEvent:event];
}

@end
