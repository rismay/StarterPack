//
//  WSSettingsViewController.h
//  wrkstrm
//
//  Created by Cristian Monterroza on 1/29/12.
//  Copyright (c) 2012 Subprime Insight. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "WSLogoView.h"
#import "SPAppDelegate.h"

enum  {
  kWSSegmentSelection = 1,
  kWSCellType
};

// Prefs.h

@class WSRearViewController, WSUser, CouchServer;

@protocol WSSettingsDelegate <NSObject>
//- (void) settingsViewController: (ZUUIRearViewController *) sender mapTypeChange: (MKMapType) newMapType;
//- (void) settingsViewController: (ZUUIRearViewController *) sender distanceFilterChange: (int) newDistanceFilter;
- (int) optionSectionSize;
- (UITableViewCell *) settingsViewController: (WSRearViewController *) sender tableView: (UITableView *) tableView optionCellForRow: (NSIndexPath *) indexPath;
@end

@interface WSRearViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

//Most important part!
@property (nonatomic, weak) id <WSSettingsDelegate> delegate;

//NEW STUFFFFF 4/1/12
@property (nonatomic, strong) IBOutlet UITableView *settingsTableView;
@property (nonatomic, strong) NSMutableArray *optionsArray;
@property (nonatomic, strong) WSUser *currentUser;

@end