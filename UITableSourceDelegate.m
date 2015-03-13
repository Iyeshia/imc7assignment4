#import "UITableSourceDelegate.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tView;
@synthesize siteUrl;


- (void)viewDidLoad
{
    [super viewDidLoad];//load from nib

    //Create an array to hold all urls
    webSitesURLs=[[NSArray alloc]initWithObjects:@"http://www.maccosmetics.com",@"http://www.smashbox.com",@"http://www.ulta.com",@"http://www.hotmiamistyles.com",@"http://www.katespade.com",@"http://www.nordstrom.com",@"http://www.macys.com",@"http://www.garnierusa.com",@"http://yukipilar.com",@"http://www.olay.com", nil];
    //Fill urls
    webSitesNames=[[NSArray alloc]initWithObjects:@"Mac",@"Smashbox",@"Ulta",@"Hot Miami Styles",@"Kate Spade",@"Nordstrom",@"Macy's",@"Garnier Fructise",@"Yuki Pilar",@"Olay", nil];
    //Configuring the TableView
    tView=[[UITableView alloc]initWithFrame:CGRectMake(10,0,300,self.view.frame.size.height) style:UITableViewStyleGrouped];
    tView.backgroundColor=[UIColor clearColor];
    //Set the delegates
    tView.dataSource=self;
    tView.delegate=self;
    //Add the content too the main view
    [self.view addSubview:tView];
}

#pragma mark -

#pragma mark UITableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *ident=@"Cell";
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    
    cell.textLabel.text=[webSitesNames objectAtIndex:indexPath.row];//give the cell a value
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [webSitesURLs count];
    
    
}

#pragma mark UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    siteUrl=[webSitesURLs objectAtIndex:indexPath.row];
    [self alert:[webSitesNames objectAtIndex:indexPath.row]];
    
}

#pragma mark UIAlertView

-(void)alert:(NSString *)webSite{
    
    UIAlertView *aView=[[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"Do you wish to continue to : %@",webSite] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"All right!", nil];
    
    [aView show];
    [aView release];
    
}

//Create an alert that asks the user to confirm by clicking ok
#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==1) {

        
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:siteUrl]];//user clicks ok and proceed
        
        
        }
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
