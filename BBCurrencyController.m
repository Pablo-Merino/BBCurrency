#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BBWeeAppController-Protocol.h"

float VIEW_HEIGHT = 90.0f;

@interface BBCurrencyController : NSObject <BBWeeAppController>
{
	UIView *_view;
}
- (IBAction)convert:(id)sender;
- (NSString *)convertFrom:(NSString*)curr1 to:(NSString*)curr2 cuantity:(NSString*)amount;
@end

@implementation BBCurrencyController

- (id)init
{
	if ((self = [super init]))
	{
		
	}
	return self;
}

- (UIView *)view
{
	if (!_view)
	{
		_view = [[UIView alloc] initWithFrame:CGRectMake(2.0f, 0.0f, 316.0f, VIEW_HEIGHT)];

		UIImage *bgImg = [[UIImage imageWithContentsOfFile:@"/System/Library/WeeAppPlugins/StocksWeeApp.bundle/WeeAppBackground.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(35.0f, 4.0f, 35.0f, 4.0f)];
        UIImageView *bg = [[UIImageView alloc] initWithImage:bgImg];
        bg.frame = CGRectMake(0.0f, 0.0f, 316.0f, VIEW_HEIGHT);
        [_view addSubview:bg];
        /*//CURRENCY #1
        UITextField *currency1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
        currency1.placeholder = @"Currency #1";
        [currency1 setKeyboardType:UIKeyboardTypeNumberPad];
        currency1.backgroundColor = [UIColor whiteColor];
        [_view addSubview:currency1];
        //CURRENCY #2
        UITextField *currency2 = [[UITextField alloc] initWithFrame:CGRectMake(200, 10, 100, 20)];
        currency2.placeholder = @"Currency #2";
        [currency2 setKeyboardType:UIKeyboardTypeNumberPad];
        currency2.backgroundColor = [UIColor whiteColor];

        [_view addSubview:currency2];

        //BUTTON
        UIButton *convert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [convert addTarget:self action:@selector(convert:) forControlEvents:UIControlEventTouchDown];
        [convert setTitle:@"Convert" forState:UIControlStateNormal];
        convert.frame = CGRectMake(10, 50, 100, 30);
        
        [_view addSubview:convert];*/
        //DOLLAR
        UILabel *dollarCurrency = [[UILabel alloc] initWithFrame:CGRectMake(5, 17, 200, 50)];
        dollarCurrency.text = @"A dollar is...";
        dollarCurrency.backgroundColor = [UIColor clearColor];
        dollarCurrency.textColor = [UIColor whiteColor];
        dollarCurrency.shadowColor = [UIColor blackColor];
        dollarCurrency.shadowOffset = CGSizeMake(1, 1);
        [_view addSubview:dollarCurrency];
        //EURO
        UILabel *euroCurrency= [[UILabel alloc] initWithFrame:CGRectMake(100, -10, 250, 50)];
        euroCurrency.text = [NSString stringWithFormat:@"%@ Euros", [self convertFrom:@"usd" to:@"eur" cuantity:@"1"]];
        euroCurrency.backgroundColor = [UIColor clearColor];
        euroCurrency.textColor = [UIColor whiteColor];
        euroCurrency.shadowColor = [UIColor blackColor];
        euroCurrency.shadowOffset = CGSizeMake(1, 1);
        [_view addSubview:euroCurrency];

        //POUNDS
        UILabel *poundsCurrency= [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 250, 50)];
        poundsCurrency.text = [NSString stringWithFormat:@"%@ UK Pounds", [self convertFrom:@"usd" to:@"gbp" cuantity:@"1"]];
        poundsCurrency.backgroundColor = [UIColor clearColor];
        poundsCurrency.textColor = [UIColor whiteColor];
        poundsCurrency.shadowColor = [UIColor blackColor];
        poundsCurrency.shadowOffset = CGSizeMake(1, 1);
        [_view addSubview:poundsCurrency];
        //ROUBLE
        UILabel *roubleCurrency= [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 250, 50)];
        roubleCurrency.text = [NSString stringWithFormat:@"%@ Russian roubles", [self convertFrom:@"usd" to:@"rub" cuantity:@"1"]];
        roubleCurrency.backgroundColor = [UIColor clearColor];
        roubleCurrency.textColor = [UIColor whiteColor];
        roubleCurrency.shadowColor = [UIColor blackColor];
        roubleCurrency.shadowOffset = CGSizeMake(1, 1);
        [_view addSubview:roubleCurrency];

        //CANADIAN DOLLAR
        UILabel *cndCurrency= [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 250, 50)];
        cndCurrency.text = [NSString stringWithFormat:@"%@ Canadian dollars", [self convertFrom:@"usd" to:@"cad" cuantity:@"1"]];
        cndCurrency.backgroundColor = [UIColor clearColor];
        cndCurrency.textColor = [UIColor whiteColor];
        cndCurrency.shadowColor = [UIColor blackColor];
        cndCurrency.shadowOffset = CGSizeMake(1, 1);
        [_view addSubview:cndCurrency];


        [bg release];
	}

	return _view;
}
- (IBAction)convert:(id)sender {
    
}
- (NSString *)convertFrom:(NSString*)curr1 to:(NSString*)curr2 cuantity:(NSString*)amount {
	NSString *mrAPI = [NSString stringWithFormat:@"http://www.exchangerate-api.com/%@/%@/%@?k=4QKTr-xhR4i-FOVqb", curr1, curr2, amount];
	NSString *trimURL = [NSString stringWithContentsOfURL:[NSURL URLWithString:mrAPI]
												 encoding:NSASCIIStringEncoding
													error:nil];
	if (!trimURL) {
		return @"Error getting external IP";
	} else {
		return trimURL;
	}
    
	return nil;
}
- (float)viewHeight
{
	return VIEW_HEIGHT;
}

@end
