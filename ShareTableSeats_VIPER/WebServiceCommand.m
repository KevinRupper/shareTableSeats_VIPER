//
//  WebServiceCommand.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 2/5/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "WebServiceCommand.h"
#import "NSData+Base64.h"

@interface WebServiceCommand ()
{
    WebServiceComepltionBlock mCompletionBlock;
    NSMutableURLRequest *mRequest;
}

@end

@implementation WebServiceCommand

- (instancetype) initWithCommand:(NSString *)command
                   baseURLString:(NSString *)baseURLString
                          method:(NSString *)method
{
    self = [super init];
    
    if(self)
    {
        NSString *urlString = [NSString stringWithFormat:@"%@/%@", baseURLString, command];
        NSString *encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:encodedString];
        
        mRequest = [[NSMutableURLRequest alloc] initWithURL:url];
        mRequest.HTTPMethod = method;
    }
    
    return self;
}

#pragma mark - Methods

- (void)setCompletionBlock:(WebServiceComepltionBlock)completion
{
    mCompletionBlock = completion;
}

- (void)setCredentials:(NSDictionary *)credentials
{
    // Set encoded credentials
    NSString *cred = [NSString stringWithFormat:@"%@:%@", credentials[@"email"], credentials[@"password"]];
    NSString *credBase64 = [[cred dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString];
    NSString *authHeader = [NSString stringWithFormat:@"Basic %@", credBase64];
    
    [mRequest addValue:authHeader forHTTPHeaderField:@"Authorization"];
}

- (void)setBody:(NSDictionary *)body
{
    NSError *error;
    mRequest.HTTPBody = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:&error];
    [mRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    if(error)
        NSLog(@"#ERROR: %@", error.localizedDescription);
}

#pragma mark - Background 

- (void)start
{
    NSData *data;
    NSError *error;
    NSHTTPURLResponse *response;
    NSString *errorString;
    
    data = [NSURLConnection sendSynchronousRequest:mRequest returningResponse:&response error:&error];
    
    if(error)
        NSLog(@"#ERROR: %@", error.localizedDescription);
    
    errorString = [self responseStatusCode:response];
    
    id responseData = [self decodeData:data];
    
    dispatch_async(dispatch_get_main_queue(), ^{
       
        if([self.method isEqualToString:@"DELETE"])
            mCompletionBlock(YES, nil, errorString);
        else
            mCompletionBlock(responseData ? YES:NO, responseData, errorString);
    });
}

#pragma mark - Methods

- (id)decodeData:(NSData *)data
{
    if(data != nil)
        return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    return nil;
}

- (NSString *)responseStatusCode:(NSHTTPURLResponse *)response
{
    switch (response.statusCode) {
        case 200:
            NSLog(@"#INFO: resquest OK");
            return nil;
            break;
        case 400:
            NSLog(@"#ERROR: incorrect request 400");
            return @"Incorrect request / Status 400";
            break;
        case 401:
            NSLog(@"#ERROR: not authorized 401");
            return @"Not authorized / Status 401";
            break;
        case 500:
            NSLog(@"#ERROR: internal server error 500");
            return @"Internal server error / Status 500";
            break;
        default:
            return nil;
            break;
    }
}

@end
