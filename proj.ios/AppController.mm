#import "AppController.h"
#import "EAGLView.h"
#import "cocos2d.h"
#import "AppDelegate.h"
#import "RootViewController.h"
#import "WeatherEffectsUtils.h"

@implementation AppController

#pragma mark -
#pragma mark Application lifecycle

// cocos2d application instance
static AppDelegate s_sharedApplication;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    
    // Init the EAGLView
    EAGLView *__glView = [EAGLView viewWithFrame: [window bounds]
                                     pixelFormat: kEAGLColorFormatRGB565
                                     depthFormat: GL_DEPTH24_STENCIL8_OES
                              preserveBackbuffer: NO
                                      sharegroup: nil
                                   multiSampling: NO
                                 numberOfSamples: 0];

    // Use RootViewController manage EAGLView 
    viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
    viewController.wantsFullScreenLayout = YES;
    viewController.view = __glView;

    // Set RootViewController to window
    if ( [[UIDevice currentDevice].systemVersion floatValue] < 6.0)
    {
        // warning: addSubView doesn't work on iOS6
        [window addSubview: viewController.view];
    }
    else
    {
        // use this method on ios6
        [window setRootViewController:viewController];
    }
    
    
    [self addTestButtons];
    
    
    [window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarHidden:true];
    
    cocos2d::CCApplication::sharedApplication()->run();

    return YES;
}

///////////////////////////////////////////

-(void) addTestButtons{

    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(0, 300, 80, 40);
    [btn1 setTitle:@"雷阵雨白天" forState:UIControlStateNormal];
    btn1.tag = 1;
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(80, 300, 80, 40);
    [btn2 setTitle:@"雷阵雨晚上" forState:UIControlStateNormal];
    btn2.tag = 2;
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame = CGRectMake(160, 300, 80, 40);
    [btn3 setTitle:@"大雨白天" forState:UIControlStateNormal];
    btn3.tag = 3;
    [btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn4.frame = CGRectMake(240, 300, 80, 40);
    [btn4 setTitle:@"大雨晚上" forState:UIControlStateNormal];
    btn4.tag = 4;
    [btn4 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn5.frame = CGRectMake(0, 360, 64, 40);
    [btn5 setTitle:@"晴天白天" forState:UIControlStateNormal];
    btn5.tag = 5;
    [btn5 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn5];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn6.frame = CGRectMake(64, 360, 64, 40);
    [btn6 setTitle:@"晴天晚上" forState:UIControlStateNormal];
    btn6.tag = 6;
    [btn6 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn6];
    
    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn7.frame = CGRectMake(128, 360, 64, 40);
    [btn7 setTitle:@"多云白天" forState:UIControlStateNormal];
    btn7.tag = 7;
    [btn7 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn7];
    
    UIButton *btn8 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn8.frame = CGRectMake(192, 360, 64, 40);
    [btn8 setTitle:@"多云晚上" forState:UIControlStateNormal];
    btn8.tag = 8;
    [btn8 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn8];
    
    UIButton *btn9 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn9.frame = CGRectMake(0, 410, 80, 40);
    [btn9 setTitle:@"小雨白天" forState:UIControlStateNormal];
    btn9.tag = 9;
    [btn9 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn9];
    
    UIButton *btn10 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn10.frame = CGRectMake(80, 410, 80, 40);
    [btn10 setTitle:@"小雨晚上" forState:UIControlStateNormal];
    btn10.tag = 10;
    [btn10 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn10];
    
    UIButton *btn11 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn11.frame = CGRectMake(0, 250, 80, 40);
    [btn11 setTitle:@"大雪白天" forState:UIControlStateNormal];
    btn11.tag = 11;
    [btn11 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn11];
    
    UIButton *btn12 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn12.frame = CGRectMake(80, 250, 80, 40);
    [btn12 setTitle:@"大雪晚上" forState:UIControlStateNormal];
    btn12.tag = 12;
    [btn12 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn12];
    
    UIButton *btn13 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn13.frame = CGRectMake(160, 250, 80, 40);
    [btn13 setTitle:@"小雪白天" forState:UIControlStateNormal];
    btn13.tag = 13;
    [btn13 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn13];
    
    UIButton *btn14 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn14.frame = CGRectMake(240, 250, 80, 40);
    [btn14 setTitle:@"小雪晚上" forState:UIControlStateNormal];
    btn14.tag = 14;
    [btn14 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn14];
    
    UIButton *btn15 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn15.frame = CGRectMake(160, 410, 80, 40);
    [btn15 setTitle:@"大风白天" forState:UIControlStateNormal];
    btn15.tag = 15;
    [btn15 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn15];

    UIButton *btn16 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn16.frame = CGRectMake(240, 410, 80, 40);
    [btn16 setTitle:@"大风晚上" forState:UIControlStateNormal];
    btn16.tag = 16;
    [btn16 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:btn16];

    
}

-(void) btnClick:(UIButton*)btn
{
    switch (btn.tag) {
        case 1://雷阵雨白天
            WeatherEffectsUtils::doThunderShowerDayTime(true);
            break;
        case 2://雷阵雨晚上
            WeatherEffectsUtils::doThunderShowerNight(true);
            break;
        case 3://大雨白天
            WeatherEffectsUtils::doHeavyRainDayTime(true);
            break;
        case 4://大雨晚上
            WeatherEffectsUtils::doHeavyRainNight(true);
            break;
        case 5://晴天白天
            WeatherEffectsUtils::doSunnyDayTime(true);
            break;
        case 6://晴天晚上
            WeatherEffectsUtils::doSunnyNight(true);
            break;
        case 7://多云白天
            WeatherEffectsUtils::doCloudyDayTime(true);
            break;
        case 8://多云晚上
            WeatherEffectsUtils::doCloudyNight(true);
            break;
        case 9://小雨白天
            WeatherEffectsUtils::doLightRainDayTime(true);
            break;
        case 10://小雨晚上
            WeatherEffectsUtils::doLightRainNight(true);
            break;
        case 11://大雪白天
            WeatherEffectsUtils::doHeavySnowDayTime(true);
            break;
        case 12://大雪晚上
            WeatherEffectsUtils::doHeavySnowNight(true);
            break;
        case 13://小雪白天
            WeatherEffectsUtils::doLightSnowDayTime(true);
            break;
        case 14://小雪晚上
            WeatherEffectsUtils::doLightSnowNight(true);
            break;
        case 15://大风白天
            WeatherEffectsUtils::doWindyDayTime(true);
            break;
        case 16://大风晚上
            WeatherEffectsUtils::doWindyNight(true);
            break;
        default:
            break;
    }
    
}


////////////////////////////////////////////


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    cocos2d::CCDirector::sharedDirector()->pause();
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    cocos2d::CCDirector::sharedDirector()->resume();
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
    cocos2d::CCApplication::sharedApplication()->applicationDidEnterBackground();
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
    cocos2d::CCApplication::sharedApplication()->applicationWillEnterForeground();
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
