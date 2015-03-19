//
//  ATERCContainerView.m
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCContainerView.h"
#import "ATERCManager.h"
#import "ATERCHelper.h"
#import "ATERCComponent.h"
#import "ATERC.h"
#import "ATERCView.h"

@interface ATERCContainerView () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

/// Outlets
@property (nonatomic, weak) UICollectionView *mCollectionView;

/// Datas
@property (nonatomic, strong) NSMutableArray *mItems;
@property (nonatomic, weak) id<NSObject> mCompontentObserver;

@end

@implementation ATERCContainerView

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Internal
- (void) mountViews {
    self.mItems = [NSMutableArray array];
    
    /// Cooking collection view
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    UICollectionView *cv = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:flowLayout];
    cv.backgroundColor = [UIColor clearColor];
    cv.delegate = self;
    cv.dataSource = self;
    cv.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:cv];
    self.mCollectionView = cv;
    
    NSDictionary *bindings = NSDictionaryOfVariableBindings(cv);
    NSArray *constraints = nil;
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[cv]-(0)-|"
                                                          options:0
                                                          metrics:nil
                                                            views:bindings];
    [self addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[cv]-(0)-|"
                                                          options:0
                                                          metrics:nil
                                                            views:bindings];
    [self addConstraints:constraints];
    [self layoutIfNeeded];
}

- (void) registerComponents {
    /// Cooking collection view available items
    NSDictionary *aliases = [[ATERCManager getInstance] getAvailableCompontents];
    for (ATERCComponent *c in aliases.allValues) {
        if (c.mType == ATERCComponentTypeClass) {
            [self.mCollectionView registerClass:NSClassFromString(c.mName) forCellWithReuseIdentifier:c.mReuseId];
        } else if (c.mType == ATERCComponentTypeNib) {
            UINib *nib = [UINib nibWithNibName:c.mName bundle:c.mBundle];
            [self.mCollectionView registerNib:nib forCellWithReuseIdentifier:c.mReuseId];
        }
    }
    
    /// Register for new components notification
    __block __weak typeof(self) weakSelf = self;
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self.mCompontentObserver
                      name:kATERCNewAliasIncludedNotificationKey
                    object:nil];
    self.mCompontentObserver = [center addObserverForName:kATERCNewAliasIncludedNotificationKey
                                                   object:nil
                                                    queue:nil
                                               usingBlock:^(NSNotification *note) {
                                                   ATERCComponent *c = note.userInfo[kATERCNewAliasIncludedNotificationKey];
                                                   if (c.mType == ATERCComponentTypeClass) {
                                                       [weakSelf.mCollectionView registerClass:NSClassFromString(c.mName)
                                                                    forCellWithReuseIdentifier:c.mReuseId];
                                                   } else if (c.mType == ATERCComponentTypeNib) {
                                                       UINib *nib = [UINib nibWithNibName:c.mName
                                                                                   bundle:c.mBundle];
                                                       [weakSelf.mCollectionView registerNib:nib
                                                                  forCellWithReuseIdentifier:c.mReuseId];
                                                   }
                                               }
     ];
}

#pragma mark - ---- Services
- (void) appendItem:(ATERC *) content {
    [self appendItem:content atIndex:self.mItems.count];
}

- (void) appendItem:(ATERC *)content atIndex:(NSUInteger) index {
    if (content == nil) {
        return;
    }
    
    if (content.mRichContentWidth <= 0) {
        content.mRichContentWidth = self.frame.size.width;
    }
    
    [self.mCollectionView performBatchUpdates:^{
        // Alter data array
        [self.mItems insertObject:content atIndex:index];
        
        // Alter collection view
        NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
        [self.mCollectionView insertItemsAtIndexPaths:@[path]];
    } completion:nil];
}

- (void) clean {
    [self.mItems removeAllObjects];
    [self.mCollectionView reloadData];
}

- (void) showContent:(NSArray *) contents {
    self.mItems = [NSMutableArray arrayWithArray:contents];
    
    for (ATERC *item in self.mItems) {
        if (item.mRichContentWidth <= 0) {
            item.mRichContentWidth = self.frame.size.width;
        }
    }
    
    [self.mCollectionView reloadData];
}

#pragma mark - -------------------- DELEGATES ---------------------
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.mItems.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ATERC *item = self.mItems[indexPath.row];
    ATERCView *cell = (ATERCView *) [collectionView dequeueReusableCellWithReuseIdentifier:item.mRichContentType
                                                                              forIndexPath:indexPath];
    [cell showContent:item];
    return cell;
}

- (CGSize) collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
   sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    ATERC *item = self.mItems[indexPath.row];
    NSDictionary *components = [[ATERCManager getInstance] getAvailableCompontents];
    NSArray *componentsList = components.allValues;
    ATERCComponent *c = [ATERCHelper getComponentForAlias:item.mRichContentType intoList:componentsList];
    CGFloat height = [[ATERCHelper getHeightForContent:item andComponent:c] doubleValue];
    return CGSizeMake(collectionView.frame.size.width, height);
}

- (void) collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    /// TODO: Notify end display cell
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    /// TODO: Notify didSelectlItemAtIndexPath
}

#pragma mark - -------------------- LIFECICLE ---------------------
- (id) init {
    self = [super init];
    if (self) {
        [self mountViews];
        [self registerComponents];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self mountViews];
        [self registerComponents];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self mountViews];
        [self registerComponents];
    }
    return self;
}

- (void) awakeFromNib {
    [super awakeFromNib];
    [self mountViews];
    [self registerComponents];
}

- (void) dealloc {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self.mCompontentObserver
                      name:kATERCNewAliasIncludedNotificationKey
                    object:nil];
}

@end
