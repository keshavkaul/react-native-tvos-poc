
#import "RNSearchControllerViewManager.h"
#import "SearchControllerView.h"

@implementation RNSearchControllerViewManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    SearchControllerView *searchView = [[SearchControllerView alloc] init];
    return searchView;
}

@end

