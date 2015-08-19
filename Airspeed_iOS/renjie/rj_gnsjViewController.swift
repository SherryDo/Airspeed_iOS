//
//  rj_gnsjViewController.swift
//  Airspeed_iOS
//
//  Created by 仇寻 on 15/8/7.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class rj_gnsjViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoChoise.userInteractionEnabled = true
        let userIconActionGR = UITapGestureRecognizer()
        userIconActionGR.addTarget(self, action: Selector("photoChoiseAction"))
        photoChoise.addGestureRecognizer(userIconActionGR)
        
        let fullPath = ((NSHomeDirectory() as NSString).stringByAppendingPathComponent("Documents") as NSString).stringByAppendingPathComponent("currentImage.png")
        if let savedImage = UIImage(contentsOfFile: fullPath){
            self.photoChoise.image = savedImage
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
        
    @IBOutlet weak var photoChoise: UIImageView!


    func photoChoiseAction(){
        let userIconAlert = UIAlertController(title: "请选择操作", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let chooseFromPhotoAlbum = UIAlertAction(title: "从相册选择", style: UIAlertActionStyle.Default, handler: funcChooseFromPhotoAlbum)
        userIconAlert.addAction(chooseFromPhotoAlbum)
        
        let chooseFromCamera = UIAlertAction(title: "拍摄照片", style: UIAlertActionStyle.Default,handler:funcChooseFromCamera)
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
        let fullPath = ((NSHomeDirectory() as NSString).stringByAppendingPathComponent("Documents") as NSString).stringByAppendingPathComponent("currentImage.png")
        let savedImage = UIImage(contentsOfFile: fullPath)
        self.photoChoise.image=savedImage
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
        let fullPath = ((NSHomeDirectory() as NSString).stringByAppendingPathComponent("Documents") as NSString).stringByAppendingPathComponent(imageName)
        // 将图片写入文件
        imageData.writeToFile(fullPath, atomically: false)
    }
    
    //    // 改变图像的尺寸，方便上传服务器
    //    func scaleFromImage(image:UIImage,size:CGSize)->UIImage{
    //        UIGraphicsBeginImageContext(size)
    //        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
    //        let newImage = UIGraphicsGetImageFromCurrentImageContext()
    //        UIGraphicsEndImageContext()
    //        return newImage;
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
