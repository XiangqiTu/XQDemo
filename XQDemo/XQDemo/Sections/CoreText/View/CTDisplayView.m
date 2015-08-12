//
//  CTDisplayView.m
//  XQDemo
//
//  Created by XiangqiTu on 15-7-7.
//
//

#import "CTDisplayView.h"
#import <CoreText/CoreText.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MPMoviePlayerController.h>

@implementation CTDisplayView

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self drawParagraphStyle];
}

- (void)drawNormalText
{
    // 步骤 1
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 步骤 2
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // 步骤 3
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    // 步骤 4
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello\n\n\n\n\n World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!\n\n\nHello World!Hello World!Hello World!\n\n\n\nHello World!Hello World!Hello World!"];
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame =
    CTFramesetterCreateFrame(framesetter,
                             CFRangeMake(0, [attString length]), path, NULL);
    
    // 步骤 5
    [[UIColor colorWithRed:1.000 green:0.588 blue:0.631 alpha:1.000] setFill];
    UIBezierPath *bPath = [UIBezierPath bezierPathWithCGPath:path];
    [bPath fill];
    
    CTFrameDraw(frame, context);
    
    // 步骤 6
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
}

-(void)drawParagraphStyle
{
    NSMutableAttributedString *mabstring = [self getMutableAttributedString];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 步骤 2
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // 步骤 3
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)mabstring);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [mabstring length]), path, NULL);
    
    CTFrameDraw(frame,context);
    
    CGPathRelease(path);
    CFRelease(framesetter);
}

- (NSMutableAttributedString *)getMutableAttributedString
{
    NSString *src = @"其实流程是这样的： 1、生成要绘制的NSAttributedString对象2  12312312312312312   sddasdasdasdasdasdasd    asd asdasd a sdas das das dasd as asd asd asd as dasd asd asd asd as dhasd kahsdkh akjshdkj sahasdhashdkah dkhasdkh akhdk adha shd akhsd其实流程是这样的： 1、生成要绘制的NSAttributedString对象2  12312312312312312   sddasdasdasdasdasdasd    asd asdasd a sdas das das dasd as asd asd asd as dasd asd asd asd as dhasd kahsdkh akjshdkj sahasdhashdkah dkhasdkh akhdk adha shd akhsd其实流程是这样的： 1、生成要绘制的NSAttributedString对象2  12312312312312312   sddasdasdasdasdasdasd    asd asdasd a sdas das das dasd as asd asd asd as dasd asd asd asd as dhasd kahsdkh akjshdkj sahasdhashdkah dkhasdkh akhdk adha shd akhsd其实流程是这样的： 1、生成要绘制的NSAttributedString对象2  12312312312312312   sddasdasdasdasdasdasd    asd asdasd a sdas das das dasd as asd asd asd as dasd asd asd asd as dhasd kahsdkh akjshdkj sahasdhashdkah dkhasdkh akhdk adha shd akhsd其实流程是这样的： NSMutableAttributedStringNSMutableAttributedStringNSMutableAttributedString";
    
    //[NSString stringWithFormat:@"其实流程是这样的： 1、生成要绘制的NSAttributedString对象。 2、生成一个CTFramesetterRef对象，然后创建一个CGPath对象，这个Path对象用于表示可绘制区域坐标值、长宽。 3、使用上面生成的setter和path生成一个CTFrameRef对象，这个对象包含了这两个对象的信息（字体信息、坐标信息），它就可以使用CTFrameDraw方法绘制了。"];
    
    NSMutableAttributedString * mabstring = [[NSMutableAttributedString alloc] initWithString:src];
    
    NSUInteger slen = [mabstring length];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentLeft];
    
    //首行缩进
    [paragraphStyle setFirstLineHeadIndent:24.0f];
    
    //段缩进
    [paragraphStyle setHeadIndent:10];
    
    //段尾缩进
    [paragraphStyle setTailIndent:-10];
    
    //换行模式
//    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    
    //多行高
    [paragraphStyle setLineHeightMultiple:1];
    
    //最大行高
    [paragraphStyle setMaximumLineHeight:10];
    
    //行距
    [paragraphStyle setLineSpacing:5];
    
    //段前间隔
    [paragraphStyle setParagraphSpacing:5];
    
    //书写方向
    [paragraphStyle setBaseWritingDirection:NSWritingDirectionLeftToRight];
    
    [mabstring addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, slen)];
    
    NSLog(@"mabstring: %@",mabstring);
    
    return mabstring;
}

- (void)test
{
    
}
@end
