//
//  HZY_UITool.m
//  火之夜
//
//  Created by linlin dang on 2019/5/11.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_UITool.h"

@interface HZY_UITool ()<UITextFieldDelegate>



@end

@implementation HZY_UITool

- (void)createleftStr:(NSString *)Str textfiledplacehold:(NSString *)placehold {
    UILabel *label = [TT_ControlTool FTT_ControlToolUILabelFrame:CGRectMake(0, 0, 50, self.bounds.size.height)
                                                        AndTitle:Str
                                                     AndFontSize:14
                                                   AndTitleColor:Col_333
                                                   Numberoflines:0
                                                   TextAlignment:NSTextAlignmentLeft
                                        adjustesFontSizesTowidth:NO
                                                   masksToBounds:NO
                                                   conrenrRadius:0
                                          userInteractionEnabled:NO
                                                      LabelBlock:nil
                                                      lineIsShow:NO
                                                       lineFrame:CGRectZero];
    
//    TT_CustonTF *Tf = [TT_ControlTool TT_ControlToolTextFieldFrame:CGRectMake(0, 0, self.bounds.size.width - 50, self.bounds.size.height)
//                                                       PlaceHolder:placehold
//                                                       andLifImage:label
//                                                     AndRightImage:nil
//                                                    LiftImageFrame:CGRectMake(0, 50, 50, self.bounds.size.height)
//                                                   RightImageFrame:CGRectZero
//                                                            AndTag:0
//                                                   AndKeyboardType:UIKeyboardTypeDefault
//                                                   clearButtonMode:UITextFieldViewModeAlways
//                                                  AndReturnKeyType:UIReturnKeyDone
//                                                        lineIsShow:NO
//                                                         lineFrame:CGRectZero];
    
    UITextField *tf    = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width - 50, self.bounds.size.height)];
    tf.placeholder     = placehold;
    tf.delegate        = self;
    tf.returnKeyType   = UIReturnKeyDone;
    tf.leftView       = label;
    tf.leftViewMode   = UITextFieldViewModeAlways;
    tf.textColor = Col_333;
    self.tf = tf;
    [self addSubview:tf];
    self.title_str = tf.text;
 
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
    
}


- (NSString *)title_str {
    return self.tf.text;
}
@end
