//
//  DataLibrary.h
//  ToDoList
//
//  Created by Dillon Welch on 2/6/15.
//  Copyright (c) 2015 Dillon Welch. All rights reserved.
//

#ifndef ToDoList_DataLibrary_h
#define ToDoList_DataLibrary_h
#import <Foundation/Foundation.h>

NSMutableArray *loadToDoList();
void saveToDoList(NSMutableArray *toDoList);
#endif
