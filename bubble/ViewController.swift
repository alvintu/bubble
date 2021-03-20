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
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [])
        gravity.magnitude = 0.001
        gravity.gravityDirection =  CGVector(dx: 0, dy: -0.5)
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items:[])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        let models = setupModel()
        data.append(contentsOf: models)
        
        for model in data {
            configureBubble(for: 80, and: model)
        }


        // Do any additional setup after loading the view.
    }
    
    func configureBubble(for size: CGFloat){
        let randomX = CGFloat.random(in: self.view.bounds.minX ..< self.view.bounds.maxX)
        let bubble = BubbleView(frame: CGRect(x: randomX, y: 500, width: size, height: size))
        let video  = VideoModel(caption: "hunter in bath", username: "@alvin", audioTrackName: "not sure", videoFileName: "1", videoFileFormat: "mp4")
        bubble.configure(with:video )
        view.addSubview(bubble)

        gravity.addItem(bubble)
        collision.addItem(bubble)
        

    }
    
    func configureBubble(for size: CGFloat, and viewModel: VideoModel){
        let randomX = CGFloat.random(in: self.view.bounds.minX ..< self.view.bounds.maxX)
        let bubble = BubbleView(frame: CGRect(x: randomX, y: 500, width: size, height: size))
        bubble.configure(with:viewModel )
        view.addSubview(bubble)

        gravity.addItem(bubble)
        collision.addItem(bubble)
        

    }
    
    
        func setupModel() -> [VideoModel]{
           let model1 = VideoModel(caption: "hunter in bath", username: "@alvin", audioTrackName: "not sure", videoFileName: "1", videoFileFormat: "mp4")
           let model2 = VideoModel(caption: "hunter running in grass", username: "@alvin", audioTrackName: "not sure", videoFileName: "2", videoFileFormat: "mp4")
            let model3 = VideoModel(caption: "hunter on sofa", username: "@alvin", audioTrackName: "not sure", videoFileName: "3", videoFileFormat: "mp4")
            let model4 = VideoModel(caption: "hunter on sofa", username: "@alvin", audioTrackName: "not sure", videoFileName: "1", videoFileFormat: "mp4")
            let model5 = VideoModel(caption: "hunter on sofa", username: "@alvin", audioTrackName: "not sure", videoFileName: "2", videoFileFormat: "mp4")
            let model6 = VideoModel(caption: "hunter on sofa", username: "@alvin", audioTrackName: "not sure", videoFileName: "3", videoFileFormat: "mp4")
            let model7 = VideoModel(caption: "hunter on sofa", username: "@alvin", audioTrackName: "not sure", videoFileName: "1", videoFileFormat: "mp4")
            let model8 = VideoModel(caption: "hunter on sofa", username: "@alvin", audioTrackName: "not sure", videoFileName: "2", videoFileFormat: "mp4")
            let model9 = VideoModel(caption: "hunter on sofa", username: "@alvin", audioTrackName: "not sure", videoFileName: "3", videoFileFormat: "mp4")

//            let array = [model1,model2,model3]
            let array = [model1,model2,model3, model4,model5,model6, model7, model8, model9]
           print(array)
           return array
       }
    

}
