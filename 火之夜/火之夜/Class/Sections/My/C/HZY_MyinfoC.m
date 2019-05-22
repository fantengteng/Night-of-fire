//
//  HZY_MyinfoC.m
//  火之夜
//
//  Created by linlin dang on 2019/5/13.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_MyinfoC.h"
#import "HZY_ChangeNickC.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <Photos/Photos.h>
#import "TZImagePickerController/TZImagePickerController.h"
@interface HZY_MyinfoC ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,TZImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *nickname;
@property (weak, nonatomic) IBOutlet UIImageView *header_IMG;
@property (strong, nonatomic) CLLocation *location;
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic , strong) NSString *Img_URL;
@end

@implementation HZY_MyinfoC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    self.NC.text = LOCALIZATION(@"昵称");
    self.TX.text = LOCALIZATION(@"头像");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self tt_configinfo];
}
#pragma mark 回调协议

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [[TZImageManager manager] savePhotoWithImage:image location:self.location completion:^(PHAsset *asset, NSError *error){
            [tzImagePickerVc hideProgressHUD];
            if (error) {
                //                NSLog(@"图片保存失败 %@",error);
            } else {
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
            }
        }];
    } else if ([type isEqualToString:@"public.movie"]) {
        NSURL *videoUrl = [info objectForKey:UIImagePickerControllerMediaURL];
        if (videoUrl) {
            [[TZImageManager manager] saveVideoWithUrl:videoUrl location:self.location completion:^(PHAsset *asset, NSError *error) {
                [tzImagePickerVc hideProgressHUD];
                if (!error) {
                    TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                    [[TZImageManager manager] getPhotoWithAsset:assetModel.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
                        if (!isDegraded && photo) {
                            [self refreshCollectionViewWithAddedAsset:assetModel.asset image:photo];
                        }
                    }];
                }
            }];
        }
    }
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    [self configChangeIMG:photos[0]];
    self.operationQueue = [[NSOperationQueue alloc] init];
    self.operationQueue.maxConcurrentOperationCount = 1;
}


- (void)refreshCollectionViewWithAddedAsset:(PHAsset *)asset image:(UIImage *)image {
    [self configChangeIMG:image];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark 界面跳转

- (void)jumpchangeNickC {
    HZY_ChangeNickC *infoC = [[HZY_ChangeNickC alloc] initWithNibName:@"HZY_ChangeNickC" bundle:nil];
    infoC.nickName = self.nickname.titleLabel.text;
    [self JumpController:infoC];
}

#pragma mark 触发方法

- (void)pushTZImagePickerController {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    imagePickerVc.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
    imagePickerVc.showSelectedIndex = YES;
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    imagePickerVc.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    [imagePickerVc setPhotoPickerPageUIConfigBlock:^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
        [doneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

- (void)configChangeIMG:(UIImage *)IMG {
    self.header_IMG.image = IMG;
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"正在提交，请稍后" AndView:self.view AndMode:MBProgressHUDModeIndeterminate AndImage:@"NONONO" AndBack:nil];
    NSString *token = TakeOut(@"IMG_T");
    QNConfiguration *config = [QNConfiguration build:^(QNConfigurationBuilder *builder) {
        builder.zone = [QNFixedZone zone1];
    }];
    QNUploadManager *upManager = [[QNUploadManager alloc] initWithConfiguration:config];
    [self uploadImages:@[IMG] atIndex:0 token:token uploadManager:upManager keys:[NSMutableArray new]];
}

-(void)uploadImages:(NSArray *)images atIndex:(NSInteger)index token:(NSString *)token uploadManager:(QNUploadManager *)uploadManager keys:(NSMutableArray *)keys{
    UIImage *image = images[index];
    __block NSInteger imageIndex = index;
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    NSTimeInterval time= [[NSDate new] timeIntervalSince1970];
    NSString *filename = [NSString stringWithFormat:@"%@_%ld_%.f.%@",@"status",686734963504054272,time,@"jpg"];
    [uploadManager  putData:data key:filename token:token
                   complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                       if (info.isOK) {
                           [keys addObject:[NSString stringWithFormat:@"http://tt.midichan.com/%@",key]];
                           imageIndex++;
                           if (imageIndex >= images.count) {
                               TT_Log(@"上传完成");
                               NSString *imageURL;
                               for (int i = 0 ; i < images.count ; i++) {
                                   
                                   if (i != 0) {
                                       imageURL = [NSString stringWithFormat:@"------%@",keys[i]];
                                   }else {
                                       imageURL = keys[i];
                                   }
                                   
                               }
                               if (keys.count == images.count) {
                                   USER_ID
                                   NSDictionary *dict = TakeOut(@"user");
                                   self.Img_URL = keys[0];
                                   NSMutableDictionary *dic = [NSMutableDictionary new];
                                   [dic setValue:usee_id forKey:@"memberId"];
                                   [dic setValue:keys[0] forKey:@"headimg"];
                                   [dic setValue:dict[@"nickname"] forKey:@"nickName"];
                                   [self configDataforNewnetWorkname:updateNickNameMARK params:dic networkClass:[HomeAPI class]];
                                
                               }
                               return ;
                           }
                           [self uploadImages:images atIndex:imageIndex token:token uploadManager:uploadManager keys:keys];
                       }else {
                         
                       }
                       
                   } option:nil];
    
}
#pragma mark 公开方法

- (void)configData {
    [self configDataforNewnetWorkname:uploadTokenMarK params:[NSMutableDictionary new] networkClass:[HomeAPI class]];
}

- (void)chageIMG {
    [self pushTZImagePickerController];
}

- (void)configSuccessTankuang:(NSString *)mark {
    if ([mark isEqualToString:updateNickNameMARK]) {
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"修改成功" AndView:self.view AndMode:MBProgressHUDModeText AndImage:@"NONONO" AndAfterDelay:1 AndBack:^{
            
        }];
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:TakeOut(@"user")];
        dict[@"headimg"] = self.Img_URL;
        SaveObject(dict, @"user");
        [self tt_configinfo];
    }
}
#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.view.backgroundColor = Col_FFF;
    self.header_IMG.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chageIMG)];
    [self.header_IMG addGestureRecognizer:tap];
}

- (void)tt_configinfo {
    NSDictionary *dic = TakeOut(@"user");
    [self.nickname  setTitle:dic[@"nickname"] forState:UIControlStateNormal];
    [self.header_IMG setImageWithURL:[NSURL URLWithString:dic[@"headimg"]]
                     placeholder:nil
                         options:YYWebImageOptionProgressive
                         manager:[Create_Tool ImageManager]
                        progress:nil
                       transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
                           return [image imageWithRadius:4 rectSize:CGSizeMake(30, 30)];
                       } completion:nil];
}


#pragma mark 存取方法

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (@available(iOS 9, *)) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
        
    }
    return _imagePickerVc;
}

- (IBAction)change_name:(id)sender {
    [self jumpchangeNickC];
}



@end
