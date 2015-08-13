//
//  ViewController.m
//  KVODES
//
//  Created by 叶永长 on 8/13/15.
//  Copyright (c) 2015 YYC. All rights reserved.
//

#import "ViewController.h"
#import "StockData.h"
@interface ViewController ()
{
    StockData *stockKVO;
    UILabel *label;
    int a;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    a= 10;
    self.view.backgroundColor = [UIColor whiteColor];
    
    stockKVO = [[StockData alloc]init];
    [stockKVO setValue:@"YE" forKey:@"name"];
    [stockKVO setValue:@"10" forKey:@"price"];
    [stockKVO addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    label.text = [stockKVO valueForKey:@"price"];
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    b.frame = CGRectMake(100, 150, 100, 30);
    b.backgroundColor = [UIColor blackColor];
    [b addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
}
-(void)buttonAction:(UIButton *)sender{
    
    a=a+10;
     [stockKVO setValue:[NSString stringWithFormat:@"%d",a] forKey:@"price"];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"price"]) {
        label.text = [stockKVO valueForKey:@"price"];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
