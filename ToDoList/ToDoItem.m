//
//  ToDoItem.m
//  ToDoList
//
//  Created by Dillon Welch on 1/30/15.
//  Copyright (c) 2015 Dillon Welch. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

static NSString* const kNameKey = @"itemName";
static NSString* const kCompletedKey = @"completed";
static NSString* const kDateKey = @"date";

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.itemName forKey:kNameKey];
    [encoder encodeBool:self.completed forKey:kCompletedKey];
    [encoder encodeObject:self.creationDate forKey:kDateKey];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [self init];
    if (self) {
        _itemName = [decoder decodeObjectForKey: kNameKey];
        _completed = [decoder decodeBoolForKey:kCompletedKey];
        _creationDate = [decoder decodeObjectForKey:kDateKey];
    }
    return self;
}

+(NSString *)itemNameKey;{
    return kNameKey;
}
@end
