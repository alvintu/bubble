//
//  ViewController.swift
//  bubble
//
//  Created by Alvin Tu on 3/19/21.
//

import UIKit

struct VideoModel {
    let caption: String
    let username: String
    let audioTrackName: String
    let videoFileName: String
    let videoFileFormat: String
}

class ViewController: UIViewController {
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    private var data = [VideoModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        square.backgroundColor = UIColor.gray
//        view.addSubview(square)
        
        
        let bubble1 = BubbleView(frame: CGRect(x: 40, y: 600, width: 100, height: 100    ))
        view.addSubview(bubble1)
        
        let bubble2 = BubbleView(frame: CGRect(x: 140, y: 500, width: 100, height: 100    ))
        view.addSubview(bubble2)

        let bubble3 = BubbleView(frame: CGRect(x: 240, y: 600, width: 100, height: 100    ))
        view.addSubview(bubble3)
        
        let bubble4 = BubbleView(frame: CGRect(x: 200, y: 300, width: 100, height: 100    ))
        view.addSubview(bubble4)
        let bubble5 = BubbleView(frame: CGRect(x: 50, y: 300, width: 100, height: 100    ))
        view.addSubview(bubble5)
        let bubble6 = BubbleView(frame: CGRect(x: 600, y: 500, width: 100, height: 100    ))
        view.addSubview(bubble6)

        let videos = setupModel()
        data.append(contentsOf: videos)
        bubble1.configure(with:data[0] )
        bubble2.configure(with:data[1] )
        bubble3.configure(with:data[2] )
        bubble4.configure(with:data[3] )
        bubble5.configure(with:data[4] )
        bubble6.configure(with:data[5] )


        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [bubble1, bubble2, bubble3, bubble4, bubble5, bubble6])
        gravity.magnitude = 0.001
    
        gravity.gravityDirection =  CGVector(dx: 0, dy: -0.5)
        animator.addBehavior(gravity)
        


        collision = UICollisionBehavior(items: [bubble1, bubble2, bubble3, bubble4, bubble5, bubble6])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)


        // Do any additional setup after loading the view.
    }
    
    
        func setupModel() -> [VideoModel]{
           let model1 = VideoModel(caption: "hunter in bath", username: "@alvin", audioTrackName: "not sure", videoFileName: "1", videoFileFormat: "mp4")
           let model2 = VideoModel(caption: "hunter running in grass", username: "@alvin", audioTrackName: "not sure", videoFileName: "2", videoFileFormat: "mp4")
            let model3 = VideoModel(caption: "hunter on sofa", username: "@alvin", audioTrackName: "not sure", videoFileName: "3", videoFileFormat: "mp4")
            let model4 = VideoModel(caption: "hunter on sofa", username: "@alvin", audioTrackName: "not sure", videoFileName: "1", videoFileFormat: "mp4")
            let model5 = VideoModel(caption: "hunter on sofa", username: "@alvin", audioTrackName: "not sure", videoFileName: "1", videoFileFormat: "mp4")
            let model6 = VideoModel(caption: "hunter on sofa", username: "@alvin", audioTrackName: "not sure", videoFileName: "1", videoFileFormat: "mp4")
//            let array = [model1,model2,model3]
            let array = [model1,model2,model3, model4,model5,model6]
           print(array)
           return array
       }
    

}
