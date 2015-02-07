//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by Dillon Welch on 1/30/15.
//  Copyright (c) 2015 Dillon Welch. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"
#import "DataLibrary.h"

@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;

@end

NSString * const kt = @"kToDoList";

@implementation ToDoListTableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    AddToDoItemViewController *source = [segue sourceViewController];
    ToDoItem *item = source.toDoItem;
    
    if (item != nil) {
        [self.toDoItems addObject:item];
        NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:self.toDoItems];
        [[NSUserDefaults standardUserDefaults] setObject:dataSave forKey:kt];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDoItems = loadToDoList();
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

# pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Deselect the item.
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    // Grab the tapped item.
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    // Toggle the selected status.
    tappedItem.completed = !tappedItem.completed;
    // Reload the row.
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}
@end
