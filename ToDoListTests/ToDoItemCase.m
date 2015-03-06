//
//  ToDoListItemTest.m
//  ToDoList
//
//  Created by Dillon Welch on 2/13/15.
//  Copyright (c) 2015 Dillon Welch. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ToDoItem.h"

@interface ToDoItemCase : XCTestCase

@end

@implementation ToDoItemCase

id nsCoderMock;

ToDoItem *item1;

- (void)setUp {
    [super setUp];
    nsCoderMock = OCMClassMock([NSCoder class]);
    item1 = [[ToDoItem alloc] init];
    item1.itemName = @"Pet the cat.";
    item1.completed = NO;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

@end
