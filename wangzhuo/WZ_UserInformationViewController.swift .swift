//
//  WZ_UserInformationViewController.swift
//  Airspeed_iOS
//
//  Created by 王卓 on 15/8/3.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class WZ_UserInformationViewController:UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var Navi: UINavigationItem!
    //用户头像
    @IBOutlet weak var userIcon: UIImageView!
    //背景
    @IBOutlet weak var userBackground: UIImageView!
    //用户名
    @IBOutlet weak var userNameLabel: UILabel!
    //用户地理位置
    @IBOutlet weak var locationLabel: UILabel!
    //用户交易次数
    @IBOutlet weak var countLabel: UILabel!
    //用户诚信度
    @IBOutlet weak var honestLevelLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置头像形状，去边框
        userIcon.layer.cornerRadius=50
        userIcon.clipsToBounds=true
        //实例化模糊效果类，参数为风格
        let blurEffert=UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        //实例化一个View
        let EffertView=UIVisualEffectView(effect: blurEffert)
        EffertView.alpha=0.65
        //设置view的大小
        EffertView.frame.size=CGSize(width: view.frame.width, height: view.frame.height)
        //加入视图
        userBackground.addSubview(EffertView)
        Navi.title="用户"
        
        //为头像添加点击事件
        userIcon.userInteractionEnabled=true
        let userIconActionGR = UITapGestureRecognizer()
        userIconActionGR.addTarget(self, action: Selector("userIconAction"))
        userIcon.addGestureRecognizer(userIconActionGR)
        
        //读取用户头像
        let fullPath = NSHomeDirectory().stringByAppendingPathComponent("Documents").stringByAppendingPathComponent("currentImage.png")
        if let savedImage = UIImage(contentsOfFile: fullPath){
        self.userIcon.image = savedImage
        }
        
        let userdata = NSUserDefaults()
        
    }
    
    
    //返回按钮响应方法
    @IBAction func backButtonClicked(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    //编辑按钮响应方法
    @IBAction func editButtonClicked(sender: UIBarButtonItem) {
        print("editButtonClicked has been called")
    }
    
    
    
// Mark: -头像点击事件
    func userIconAction(){
        let userIconAlert = UIAlertController(title: "请选择操作", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)

        let chooseFromPhotoAlbum = UIAlertAction(title: "从相册选择", style: UIAlertActionStyle.Default, handler: funcChooseFromPhotoAlbum)
        userIconAlert.addAction(chooseFromPhotoAlbum)
            
        let chooseFromCamera = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default,handler:funcChooseFromCamera)
        userIconAlert.addAction(chooseFromCamera)

        let canelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel,handler: nil)
        userIconAlert.addAction(canelAction)
        
        self.presentViewController(userIconAlert, animated: true, completion: nil)
    }
    //从相册选择照片
    func funcChooseFromPhotoAlbum(avc:UIAlertAction) -> Void{
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self;
        imagePicker.allowsEditing = true;
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    //拍摄照片
    func funcChooseFromCamera(avc:UIAlertAction) -> Void{
        let imagePicker = UIImagePickerController()
        imagePicker.delegate=self
        imagePicker.allowsEditing=true
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
//MARK:-UIImagePickerController Delegate
    
//     此处info 有六个值
//     UIImagePickerControllerMediaType; // an NSString UTTypeImage)
//     UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
//     UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
//     UIImagePickerControllerCropRect;       // an NSValue (CGRect)
//     UIImagePickerControllerMediaURL;       // an NSURL
//     UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
//     UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = (info as NSDictionary).objectForKey(UIImagePickerControllerOriginalImage)
        self.saveImage(image as! UIImage, imageName: "currentImage.png")
        let fullPath = NSHomeDirectory().stringByAppendingPathComponent("Documents").stringByAppendingPathComponent("currentImage.png")
        let savedImage = UIImage(contentsOfFile: fullPath)
        self.userIcon.image=savedImage
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
//MARK: - 保存图片至沙盒
    func saveImage(currentImage:UIImage,imageName:String){
        var imageData = NSData()
        imageData = UIImageJPEGRepresentation(currentImage, 0.5)!
        // 获取沙盒目录
    let fullPath = NSHomeDirectory().stringByAppendingPathComponent("Documents").stringByAppendingPathComponent(imageName)
        // 将图片写入文件
        imageData.writeToFile(fullPath, atomically: false)
    }
    
    // 改变图像的尺寸，方便上传服务器
    func scaleFromImage(image:UIImage,size:CGSize)->UIImage{
        UIGraphicsBeginImageContext(size)
        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage;
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let isFullScreen = true;
//        let touch = UITouch()
//        let touchPoint = touch.locationInView(self.view)
//        let imagePoint = self.userIcon.frame.origin
//        if (imagePoint.x <= touchPoint.x && imagePoint.x+self.userIcon.frame.size.width>=touchPoint.x && imagePoint.y <= touchPoint.y && imagePoint.y+self.userIcon.frame.size.height >= touchPoint.y){
//            UIView.beginAnimations(nil, context: nil)
//            UIView.setAnimationDuration(1)
//            if isFullScreen {
//                self.userIcon.frame = CGRectMake(0, 0, 320, 480)
//            }else{
//                self.userIcon.frame = CGRectMake(50, 65, 90, 115)
//            }
//            UIView.commitAnimations()
//        }
//    }

    
    
    
    

    //保存数据到NSUserDefaults
    func saveNSUserDefaults(){
//        var userName:String = "TestName"
//        var count:Int = 100
//        var location:String="银河系 太阳系 地球 亚洲"
//    NSDictionary *myDictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"enuo", @"20", nil] forKeys:[NSArray arrayWithObjects:@"name", @"age", nil]];
//    
//    //将上述数据全部存储到NSUserDefaults中
//        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//    //存储时，除NSNumber类型使用对应的类型意外，其他的都是使用setObject:forKey:
//    [userDefaults setInteger:myInteger forKey:@"myInteger"];
//    [userDefaults setFloat:myFloat forKey:@"myFloat"];
//    [userDefaults setDouble:myDouble forKey:@"myDouble"];
//    
//    [userDefaults setObject:myString forKey:@"myString"];
//    [userDefaults setObject:myDate forKey:@"myDate"];
//    [userDefaults setObject:myArray forKey:@"myArray"];
//    [userDefaults setObject:myDictionary forKey:@"myDictionary"];
//    
//    //这里建议同步存储到磁盘中，但是不是必须的
//    [userDefaults synchronize];
//    
      }
//    
//    //从NSUserDefaults中读取数据
//    -(void)readNSUserDefaults
//    {
//    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
//    
//    //读取数据到各个label中
//    //读取整型int类型的数据
//    NSInteger myInteger = [userDefaultes integerForKey:@"myInteger"];
//    txtInteger.text = [NSString stringWithFormat:@"%d",myInteger];
//    
//    //读取浮点型float类型的数据
//    float myFloat = [userDefaultes floatForKey:@"myFloat"];
//    txtFloat.text = [NSString stringWithFormat:@"%f",myFloat];
//    
//    //读取double类型的数据
//    double myDouble = [userDefaultes doubleForKey:@"myDouble"];
//    txtDouble.text = [NSString stringWithFormat:@"%f",myDouble];
//    
//    //读取NSString类型的数据
//    NSString *myString = [userDefaultes stringForKey:@"myString"];
//    txtNSString.text = myString;
//    
//    //读取NSDate日期类型的数据
//    NSDate *myDate = [userDefaultes valueForKey:@"myDate"];
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    txtNSDate.text = [NSString stringWithFormat:@"%@",[df stringFromDate:myDate]];
//    
//    //读取数组NSArray类型的数据
//    NSArray *myArray = [userDefaultes arrayForKey:@"myArray"];
//    NSString *myArrayString = [[NSString alloc] init];
//    for(NSString *str in myArray)
//    {
//    NSLog(@"str= %@",str);
//    myArrayString = [NSString stringWithFormat:@"%@  %@", myArrayString, str];
//    [myArrayString stringByAppendingString:str];
//    //        [myArrayString stringByAppendingFormat:@"%@",str];
//    NSLog(@"myArrayString=%@",myArrayString);
//    }
//    txtNSArray.text = myArrayString;
//    
//    //读取字典类型NSDictionary类型的数据
//    NSDictionary *myDictionary = [userDefaultes dictionaryForKey:@"myDictionary"];
//    NSString *myDicString = [NSString stringWithFormat:@"name:%@, age:%d",[myDictionary valueForKey:@"name"], [[myDictionary valueForKey:@"age"] integerValue]];
//    txtNSDictionary.text = myDicString;
//    }
    
    
}
