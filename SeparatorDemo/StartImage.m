//
//  StartImage.m
//  SeparatorDemo
//
//  Created by langyue on 16/3/28.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "StartImage.h"
#import "AFNetworking.h"





@interface StartImagesManager ()





@end



@implementation StartImagesManager






@end



@implementation StartImage



-(NSString*)fileName{
    if (_fileName && _url.length >0) {
        _fileName = [[_url componentsSeparatedByString:@"/"] lastObject];
    }
    return _fileName;
}



-(NSString*)descriptionStr{
    if (_descriptionStr && _group) {
        _descriptionStr = [NSString stringWithFormat:@"\"%@\" © %@",_group.name.length > 0 ? _group.name : @"今天天气不错",_group.author.length > 0? _group.author:@"作者"];
    }
    return _descriptionStr;
}


-(NSString*)pathDisk{
    
    if (_pathDisk && _url) {
        NSString * documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) firstObject];
        _pathDisk = [[documentPath stringByAppendingPathComponent:@"Coding_StartImages"] stringByAppendingPathComponent:[[_url componentsSeparatedByString:@"/"] lastObject]];
    }
    return _pathDisk;
}


+(StartImage*)defaultImage{
    StartImage * st = [[StartImage alloc] init];
    st.descriptionStr = @"\"中秋快乐\" © Mango";
    st.fileName = @"MIDAUTUMNIMAGE.jpg";
    st.pathDisk = [[NSBundle mainBundle] pathForResource:@"MIDAUTUMNIMAGE" ofType:@"jpg"];
    return st;
}

-(UIImage*)image{
    return [UIImage imageNamed:self.pathDisk];
}


-(void)startDownloadImage{
    
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager * manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL * URL = [NSURL URLWithString:self.url];
    NSURLRequest * request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDownloadTask * downloadTast = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSString * documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString * pathDisk = [[documentPath stringByAppendingPathComponent:@"Coding_StartImages"] stringByAppendingPathComponent:[response suggestedFilename]];
        return [NSURL fileURLWithPath:pathDisk];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"downloaded file_path is to: %@",filePath);
    }];
    [downloadTast resume];
}








@end









@implementation Group




@end











