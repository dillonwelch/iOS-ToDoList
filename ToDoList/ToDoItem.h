//
//  ToDoItem.h
//  ToDoList
//
//  Created by Dillon Welch on 1/30/15.
//  Copyright (c) 2015 Dillon Welch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
