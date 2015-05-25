//
//  directoryTableViewController.m
//  Solar term
//
//  Created by Yongjia Liu on 14-3-30.
//  Copyright (c) 2014年 Yongjia Liu. All rights reserved.
//

#import "directoryTableViewController.h"

@interface directoryTableViewController ()
{
    NSMutableArray *objects;
}
@end

@implementation directoryTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    objects=[[NSMutableArray alloc]init];
    
        for (int i=1; i<25; i++) {
            NSString *str=[NSString stringWithFormat:@"This is fabulous Row %d",i];
            [objects addObject:str];
        }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [objects count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        //2. Apply some text styles
       
        cell.textLabel.textColor = [self colorFromIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
        cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:8];
        cell.backgroundColor=[UIColor whiteColor];
    }
    //3. Setup the cell
     //cell.textLabel.text = [objects objectAtIndex:indexPath.row];
    if (indexPath.row==0) {
        cell.textLabel.text=@"立春";
}
    if (indexPath.row==1) {
        cell.textLabel.text=@"雨水";
    }
    if (indexPath.row==2) {
        cell.textLabel.text=@"惊蛰";
    }
    if (indexPath.row==3) {
        cell.textLabel.text=@"春分";
    }
    if (indexPath.row==4) {
        cell.textLabel.text=@"清明";
    }
    if (indexPath.row==5) {
        cell.textLabel.text=@"谷雨";
    }
    if (indexPath.row==6) {
        cell.textLabel.text=@"立夏";
    }
    if (indexPath.row==7) {
        cell.textLabel.text=@"小满";
    }
    if (indexPath.row==8) {
        cell.textLabel.text=@"芒种";
    }
    if (indexPath.row==9) {
        cell.textLabel.text=@"夏至";
    }
    if (indexPath.row==10) {
        cell.textLabel.text=@"小暑";
    }
    if (indexPath.row==11) {
        cell.textLabel.text=@"大暑";
    }
    if (indexPath.row==12) {
        cell.textLabel.text=@"立秋";
    }
    if (indexPath.row==13) {
        cell.textLabel.text=@"处暑";
    }
    if (indexPath.row==14) {
        cell.textLabel.text=@"白露";
    }
    if (indexPath.row==15) {
        cell.textLabel.text=@"秋分";
    }
    if (indexPath.row==16) {
        cell.textLabel.text=@"寒露";
    }
    if (indexPath.row==17) {
        cell.textLabel.text=@"霜降";
    }
    if (indexPath.row==18) {
        cell.textLabel.text=@"立冬";
    }
    if (indexPath.row==19) {
        cell.textLabel.text=@"小雪";
    }
    if (indexPath.row==20) {
        cell.textLabel.text=@"大雪";
    }
    if (indexPath.row==21) {
        cell.textLabel.text=@"冬至";
    }
    if (indexPath.row==22) {
        cell.textLabel.text=@"小寒";
    }
    if (indexPath.row==23) {
        cell.textLabel.text=@"大寒";
    }
    
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"details for row number %d",indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CATransform3D rotation;
    rotation=CATransform3DMakeRotation((90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34=1.0/-600;
    
    cell.layer.shadowColor=[[UIColor blackColor] CGColor];
    cell.layer.shadowOffset=CGSizeMake(10, 10);
    cell.alpha=0;
    
    cell.layer.transform=rotation;
    cell.layer.anchorPoint=CGPointMake(0, 0.5);
    
    if(cell.layer.position.x != 0){
        cell.layer.position = CGPointMake(0, cell.layer.position.y);
    }
    
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.7];
    cell.layer.transform=CATransform3DIdentity;
    cell.alpha=1;
    cell.layer.shadowOffset=CGSizeMake(0, 0);
    [UIView commitAnimations];
}
-(UIColor *)colorFromIndex:(int)index
{
    UIColor *color;
    if (index%3==0) {
        color=[UIColor colorWithRed:0.93 green:0.01 blue:0.55 alpha:1.0];
    }else if(index%3==1){
        color=[UIColor colorWithRed:0.0 green:0.68 blue:0.4 alpha:1.0];
    }else if(index%3==2){
        color=[UIColor blackColor];
    }else if(index%3==3){
        color=[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
    }
    return color;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
