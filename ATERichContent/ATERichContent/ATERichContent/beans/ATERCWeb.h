//
//  ATERCWeb.h
//  ATERichContent
//
//  Created by David Martinez on 21/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERC.h"

@interface ATERCWeb : ATERC

@property (nonatomic, strong) NSString *mWebUrl;

@property (nonatomic, strong) NSString *mWebHtmlContent;
@property (nonatomic, strong) NSString *mWebHtmlContentBaseUrl;

@end
