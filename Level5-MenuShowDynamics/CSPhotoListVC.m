#import "CSPhotoListVC.h"
#import "CSPhotoDetailVC.h"

#import "CSPhotoCell.h"

#import "Photo.h"
#import "Photos.h"

@implementation CSPhotoListVC

- (id)init
{
    self = [super init];
    if(self) {
        self.title = @"Events";
        self.tabBarItem.image = [UIImage imageNamed:@"879-mountains"];
    }
    return self;
}

- (void)loadView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
//    self.tableView.backgroundColor = [UIColor colorWithRed:1 green:0.22 blue:0.24 alpha:1.0];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.1 green:0.22 blue:0.22 alpha:1.0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.view = self.tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = [[Photos getPhotosFromArchive] allPhotos];
    [self.tableView reloadData];
}

/* ******************************* UITableViewDataSource methods ******************************* */

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        cell = [[CSPhotoCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    }
    
    Photo *photo = self.dataSource[indexPath.row];
    
    cell.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    cell.cellName.text = photo.name;
    cell.cellImage.image = [photo loadImage:photo.filename];
    
    if(indexPath.row == 0) {
        cell.accessibilityLabel = @"cell";
    }

    return cell;
}

/* ******************************* UITableViewDelegate methods ******************************* */

-       (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CSPhotoDetailVC *photoDetailVC = [[CSPhotoDetailVC alloc] init];
    photoDetailVC.photo = self.dataSource[indexPath.row];
    [self.navigationController pushViewController:photoDetailVC animated:YES];
}

@end
