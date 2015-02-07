//
//  DataLibrary.m
//  ToDoList
//
//  Created by Dillon Welch on 2/6/15.
//  Copyright (c) 2015 Dillon Welch. All rights reserved.
//

#import "DataLibrary.h"

NSString * const kToDoList = @"kToDoList";

NSMutableArray *loadToDoList() {
    NSMutableArray *toDoItems;
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kToDoList]) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kToDoList];
        toDoItems = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    } else {
        toDoItems = [[NSMutableArray alloc] init];
    }
    return toDoItems;
}

void saveToDoList(NSMutableArray *toDoList) {
    NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:toDoList];
    [[NSUserDefaults standardUserDefaults] setObject:dataSave forKey:kToDoList];
    [[NSUserDefaults standardUserDefaults] synchronize];
}