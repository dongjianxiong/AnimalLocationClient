//
//  ALMapViewController.m
//  AnimalLocationClient
//
//  Created by umeng on 15-4-12.
//  Copyright (c) 2015年 umeng. All rights reserved.
//

#import "ALMapViewController.h"
#import <MapKit/MapKit.h>
#import "ALCustomAnnotationView.h"
#import "ALAnnotation.h"

@interface ALMapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation ALMapViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.distanceFilter = 50;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        [self.locationManager requestAlwaysAuthorization];
    }
    
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    [self addAnimationViews];

    
    [self.view addSubview:self.mapView];
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 39.213423;
    coordinate.longitude = 116.263546;
    self.mapView.centerCoordinate = coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 2000, 2000);
    [self.mapView setRegion:region animated:YES];


    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.locationManager.delegate = nil;
}


#pragma mark - MapViewDeleagte
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
//    CLLocationCoordinate2D loc = [userLocation coordinate];
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 2000, 2000);
//    [self.mapView setRegion:region animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *annotationId = @"annotationId";
    // view
    MKPinAnnotationView * view = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationId];
    if (view == nil) {
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationId];
    }
    // pin color
    [view setPinColor:MKPinAnnotationColorPurple];
    // enabled animated
    [view setEnabled: YES];
    [view setAnimatesDrop: YES];
//    [view setCanShowCallout: YES];
    // image button
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"customanno.png"]];
//    [view setLeftCalloutAccessoryView:imageView];
//    [view setRightCalloutAccessoryView: [UIButton buttonWithType: UIButtonTypeDetailDisclosure]];
    return view;
}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{

}



#pragma mark - LocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    self.currentLocation = location.coordinate;
    [self.mapView setCenterCoordinate:location.coordinate animated:YES];
}


- (void)addAnimationViews
{
    for (int index = 0; index < 20; index ++) {
        CLLocationCoordinate2D location;
        location.latitude = 39.8232143+(float)index*0.01;
        location.longitude = 116.37846-(float)index*0.01;
        ALAnnotation  *anno = [[ALAnnotation alloc] init];
        [anno setTitle: @"北京"];
        [anno setSubTitle: @"泰兴大厦"];
        anno.coordinate = location;
        [self.mapView addAnnotation:anno];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
