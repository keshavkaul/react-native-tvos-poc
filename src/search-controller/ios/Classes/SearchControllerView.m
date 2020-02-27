#import "SearchControllerView.h"
#import <React/UIView+React.h>

@implementation SearchControllerView
{
    UISearchController *uiSearchController;
    UISearchContainerViewController *uiSearchContainerController;
}

- (void)layoutSubviews
{
    if(uiSearchContainerController == nil) {
        [self embedSearchController];
    }
}

- (void)didMoveToSuperview
{
    if(self.superview == nil) {
        [self removeSearchController];
    }
}

- (void)embedSearchController
{
    UIViewController *parentVC = self.reactViewController;
    
    if(parentVC == nil) {
        return;
    }
    
    uiSearchController = [[UISearchController alloc] initWithSearchResultsController: nil];
    uiSearchContainerController = [[UISearchContainerViewController alloc] initWithSearchController:uiSearchController];
    
    [parentVC addChildViewController:uiSearchContainerController];
    [self addSubview:uiSearchContainerController.view];
    [uiSearchContainerController didMoveToParentViewController:parentVC];
}

-(void)removeSearchController
{
    if(uiSearchController == nil || uiSearchContainerController == nil) {
        return;
    }
    
    [uiSearchContainerController willMoveToParentViewController:nil];
    [uiSearchContainerController.view removeFromSuperview];
    [uiSearchContainerController removeFromParentViewController];
    uiSearchContainerController = nil;
    
    [uiSearchController willMoveToParentViewController:nil];
    [uiSearchController.view removeFromSuperview];
    [uiSearchController removeFromParentViewController];
    uiSearchController = nil;
}

@end
