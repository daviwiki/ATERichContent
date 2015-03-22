//
//  ATERCWebView.m
//  ATERichContent
//
//  Created by David Martinez on 21/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCWebView.h"
#import "ATERCHeaders.h"

@interface ATERCWebView ()

/// Datas
@property (nonatomic, strong) ATERCWeb *mContent;

@end

@implementation ATERCWebView


#pragma mark - ---- Internal
- (void) drawContent:(ATERCWeb *)content {
    if (content.mWebUrl) {
        NSURL *url = [NSURL URLWithString:content.mWebUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.mWebView loadRequest:request];
    } else {
        NSURL *url = [NSURL URLWithString:content.mWebHtmlContentBaseUrl];
        [self.mWebView loadHTMLString:content.mWebHtmlContent
                              baseURL:url];
    }
}

#pragma mark - ---- Services
#pragma mark - ---- Overrides
+ (NSNumber *) getHeightForContent:(ATERC *)content {
    return @(ABS(content.mRichContentHeight));
}

- (BOOL) validateContent:(ATERC *)content {
    return [[content class] isSubclassOfClass:[ATERCWeb class]];
}

- (void) showContent:(ATERCWeb *)content {
    if (![self validateContent:content]) {
        [ATERCLog log:@"Invalid class type excepected for content into ATERCWebView class"];
        return;
    }
    
    self.mContent = content;
    [self drawContent:self.mContent];
}


@end
