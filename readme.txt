Integration steps:
1) Create a new class that inherits from ATERCView (Ex: "MyClassCell")


1-2) Create a new bean "MyClassBean" that inherits from ATERC class if needed for manage data for your own class


2) Create a xib with a UICollectionViewCell at first level. This view must conform "MyClassCll" create at step (1)


3) Give it a reuseId to the UICollectionViewCell. Note: Keep in mid that if you want to override the default behaviour of an existing component in ATERC system you must use the current reuse identifiers assign to them (Ex: "TXT", for default label)


4) Override this methods:
/**
 * @function getHeightForContent:andComponent:
 * @brief <p>Returnt the contents height 
 * for the content given</p>
 * @note <p>If something goes wrong, return 0</p>
 * @note <p>Must be override by subclasses to define the
 * the height for the content</p>
 * @param content, not null
 */
+ (NSNumber *) getHeightForContent:(ATERC *) content;

/**
 * @function validateContent:
 * @brief
 * <p>Define if 'content' is a valid instance for
 * this ATERCView instance</p>
 */
- (BOOL) validateContent:(ATERC *) content;

/**
 * @function showContent:
 * @brief
 * <p>Display the content given</p>
 */
- (void) showContent:(ATERC *) content;

5) Add you own cell to ATERC system using the method:
   ATERCManager *manager = [ATERCManager getInstance];
   [manager addRichViewNibName:@"MyClassCell" 
                      atBundle:nil 
                      forAlias:@"CUSTOM" 
                       reuseId:@"CUSTOM"];

6) Now you could add items at your ATERContainerView. This view receive the list of ATERC datas to be displayed into the collection view. Ex:
   MyClassBean *bean = [[MyClassBean alloc] init];
   bean.mRichContentType = @"CUSTOM" /* == TXT */;
   bean.mRichContentHeight = 150; /* size in pixels */
   bean.mCustomProperty1 = 37;
   bean.mCustomProperty2 = "This is a custom property!";

   [self.mATERCContainerView appendItem:bean];