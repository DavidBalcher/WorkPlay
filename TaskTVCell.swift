//
//  TaskTVCell.swift
//  WorkPlay
//
//  Created by David Balcher on 2/9/16.
//  Copyright © 2016 DavidBalcher. All rights reserved.
//

import UIKit

class TaskTVCell: UITableViewCell {
    
    var task: Task? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var taskClock: UIButton!
    
    
    func updateUI() {
        taskClock.setAttributedTitle(nil, forState: .Normal)
        
        // Load information about task
        if let task = self.task {
        switch task.taskMode {
            case .work:
                taskClock.setTitle(task.records.currentWork.toTimeString(), forState: .Normal)
            case .play:
                taskClock.setTitle(task.records.currentPlay.toTimeString(), forState: .Normal)
            case .standby, .feedback:
                break
            }
        }
    }
}

class TaskButton: UIButton {
    var taskMode = TaskMode.standby
    
    func toggleMode() -> TaskMode {
        switch self.taskMode {
        case .work:
            self.setTitle("WORK", forState: UIControlState.Normal)
            self.taskMode = .feedback
        case .standby,
             .play:
            self.setTitle("PLAY", forState: UIControlState.Normal)
            self.taskMode = .work
        case .feedback:
            self.taskMode = .play
        }
        return self.taskMode
    }
}