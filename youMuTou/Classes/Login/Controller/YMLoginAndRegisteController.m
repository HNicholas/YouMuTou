//
//  YMLoginAndRegisteController.m
//  youMuTou
//
//  Created by Tao on 16/7/23.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "YMLoginAndRegisteController.h"
#import "YMNetWorkManager.h"
#import "HomeViewController.h"

@interface YMLoginAndRegisteController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation YMLoginAndRegisteController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)seeBtnClick:(id)sender {
    
    
}

- (IBAction)registerBtnClick:(id)sender {
    if (_userNameTextField.text.length != 0 && ![_userNameTextField.text isEqualToString:@""] && _passwordTextField.text.length != 0  &&![_passwordTextField.text isEqualToString:@""]) {
        //[self postRegistrtRequestWithUsername:_userNameTextField.text password:_passwordTextField.text];
    }
    
}

- (void)postRegistrtRequestWithUsername:(NSString *)username password:(NSString *)password
{
    NSString *url = @"http://127.0.0.1:5000/user_register";
    YMNetWorkManager *manager = [YMNetWorkManager sharedManager];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"username"] = username;
    dict[@"token"] = password;
    
    [manager postRequestWithParameter:dict url:url successBlock:^(id responseBody) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"message:@"注册成功" preferredStyle:  UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:true completion:nil];
        
    } failureBlock:^(NSString *error) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"message:@"该用户名已经注册" preferredStyle:  UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        
        //弹出提示框；
        [self presentViewController:alert animated:true completion:nil];
        
    }];

}

- (void)postLoginRequestWithUser:(NSString *)username password:(NSString *)password
{
    NSString *url =  @"http://127.0.0.1:5000/user_login";
    YMNetWorkManager *manager = [YMNetWorkManager sharedManager];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"username"] = username;
    dict[@"token"] = password;
    [manager postRequestWithParameter:dict url:url successBlock:^(id responseBody) {
        [UIApplication sharedApplication].keyWindow.rootViewController = [[HomeViewController alloc] init];
    } failureBlock:^(NSString *error) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"message:@"用户名或密码不正确" preferredStyle:  UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:true completion:nil];
    }];

}

- (IBAction)loginBtnClick:(id)sender {
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
