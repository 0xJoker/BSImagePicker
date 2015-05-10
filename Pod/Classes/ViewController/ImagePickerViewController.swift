import UIKit
import Photos

public class ImagePickerViewController : UINavigationController {
    internal var selectionClosure: ((asset: PHAsset) -> Void)? {
        set {
            photosViewController.selectionClosure = newValue
        }
        get {
            return photosViewController.selectionClosure
        }
    }
    internal var deselectionClosure: ((asset: PHAsset) -> Void)? {
        set {
            photosViewController.deselectionClosure = newValue
        }
        get {
            return photosViewController.deselectionClosure
        }
    }
    internal var cancelClosure: ((assets: [PHAsset]) -> Void)? {
        set {
            photosViewController.cancelClosure = newValue
        }
        get {
            return photosViewController.cancelClosure
        }
    }
    internal var finishClosure: ((assets: [PHAsset]) -> Void)? {
        set {
            photosViewController.finishClosure = newValue
        }
        get {
            return photosViewController.finishClosure
        }
    }
    
    internal var photosViewController: PhotosViewController = {
        // Get path for BSImagePicker bundle
        let bundlePath = NSBundle(forClass: PhotosViewController.self).pathForResource("BSImagePicker", ofType: "bundle")
        let bundle: NSBundle?
        
        // Load bundle
        if let bundlePath = bundlePath {
            bundle = NSBundle(path: bundlePath)
        } else {
            bundle = nil
        }
        
        let storyboard = UIStoryboard(name: "Photos", bundle: bundle)
        
        return storyboard.instantiateInitialViewController() as! PhotosViewController
    }()
    
    public init() {
        super.init(rootViewController: photosViewController)
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}
