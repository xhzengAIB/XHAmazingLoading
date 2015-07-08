![image](https://github.com/xhzengAIB/LearnEnglish/raw/master/Screenshots/XHAmazingLoading.gif)

## XHAmazingLoading
XHAmazingLoading indicators or load view based on CAReplicatorLayer class and CoreAnimation

## Podfile

[CocosPods](http://cocosPods.org) is the recommended method to install XHAmazingLoading, just add the following line to `Podfile`

```
pod 'XHAmazingLoading'
```

and run `pod install`, then you're all done!

## Requirements

* Xcode6 or later
* iOS 6.0+ 
* ARC

## How to use
```objc
#import "XHAmazingLoadingView.h"
    
XHAmazingLoadingView *amazingLoadingView = [[XHAmazingLoadingView alloc] initWithType:XHAmazingLoadingAnimationTypeMusic];
amazingLoadingView.loadingTintColor = [UIColor redColor];
amazingLoadingView.backgroundTintColor = [UIColor whiteColor];
amazingLoadingView.frame = self.view.bounds;
[self.view addSubview:amazingLoadingView];
    
[amazingLoadingView startAnimating];

loading data after that call stopAnimating method.

```

## License

XHAmazingLoading is available under the MIT license, see the LICENSE file for more information.     
