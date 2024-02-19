// /*
//  * Copyright (c) 2019, Google LLC
//  * All rights reserved.
//  *
//  * Redistribution and use in source and binary forms, with or without
//  * modification, are permitted provided that the following conditions are met:
//  *
//  * * Redistributions of source code must retain the above copyright notice, this
//  *   list of conditions and the following disclaimer.
//  * * Redistributions in binary form must reproduce the above copyright notice,
//  *   this list of conditions and the following disclaimer in the documentation
//  *   and/or other materials provided with the distribution.
//  * * Neither the name of Google LLC nor the names of its contributors may be
//  *   used to endorse or promote products derived from this software without
//  *   specific prior written permission.
//  *
//  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//  */
// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "messages.g.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@implementation PGNCodeBox
- (instancetype)initWithValue:(PGNCode)value {
  self = [super init];
  if (self) {
    _value = value;
  }
  return self;
}
@end

@interface PGNMessageData ()
+ (PGNMessageData *)fromList:(NSArray *)list;
+ (nullable PGNMessageData *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation PGNMessageData
+ (instancetype)makeWithName:(nullable NSString *)name
    description:(nullable NSString *)description
    code:(PGNCode)code
    data:(NSDictionary<NSString *, NSString *> *)data {
  PGNMessageData* pigeonResult = [[PGNMessageData alloc] init];
  pigeonResult.name = name;
  pigeonResult.description = description;
  pigeonResult.code = code;
  pigeonResult.data = data;
  return pigeonResult;
}
+ (PGNMessageData *)fromList:(NSArray *)list {
  PGNMessageData *pigeonResult = [[PGNMessageData alloc] init];
  pigeonResult.name = GetNullableObjectAtIndex(list, 0);
  pigeonResult.description = GetNullableObjectAtIndex(list, 1);
  pigeonResult.code = [GetNullableObjectAtIndex(list, 2) integerValue];
  pigeonResult.data = GetNullableObjectAtIndex(list, 3);
  return pigeonResult;
}
+ (nullable PGNMessageData *)nullableFromList:(NSArray *)list {
  return (list) ? [PGNMessageData fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    self.name ?: [NSNull null],
    self.description ?: [NSNull null],
    @(self.code),
    self.data ?: [NSNull null],
  ];
}
@end

@interface PGNExampleHostApiCodecReader : FlutterStandardReader
@end
@implementation PGNExampleHostApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [PGNMessageData fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface PGNExampleHostApiCodecWriter : FlutterStandardWriter
@end
@implementation PGNExampleHostApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[PGNMessageData class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface PGNExampleHostApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation PGNExampleHostApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[PGNExampleHostApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[PGNExampleHostApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *PGNExampleHostApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    PGNExampleHostApiCodecReaderWriter *readerWriter = [[PGNExampleHostApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void SetUpPGNExampleHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PGNExampleHostApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.pigeon_example_package.ExampleHostApi.getHostLanguage"
        binaryMessenger:binaryMessenger
        codec:PGNExampleHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getHostLanguageWithError:)], @"PGNExampleHostApi api (%@) doesn't respond to @selector(getHostLanguageWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSString *output = [api getHostLanguageWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.pigeon_example_package.ExampleHostApi.add"
        binaryMessenger:binaryMessenger
        codec:PGNExampleHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(addNumber:toNumber:error:)], @"PGNExampleHostApi api (%@) doesn't respond to @selector(addNumber:toNumber:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSInteger arg_a = [GetNullableObjectAtIndex(args, 0) integerValue];
        NSInteger arg_b = [GetNullableObjectAtIndex(args, 1) integerValue];
        FlutterError *error;
        NSNumber *output = [api addNumber:arg_a toNumber:arg_b error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.pigeon_example_package.ExampleHostApi.sendMessage"
        binaryMessenger:binaryMessenger
        codec:PGNExampleHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(sendMessageMessage:completion:)], @"PGNExampleHostApi api (%@) doesn't respond to @selector(sendMessageMessage:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        PGNMessageData *arg_message = GetNullableObjectAtIndex(args, 0);
        [api sendMessageMessage:arg_message completion:^(NSNumber *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
