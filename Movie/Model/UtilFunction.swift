//
//  UtilFunction.swift
//  Movie
//
//  Created by Kira on 15/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class AlertAction {
  func alert(vc: UIViewController) {
    let alertController = UIAlertController(title: "정렬방식 선택", message: "영화를 어떤 순서로 정렬할까요?", preferredStyle: .actionSheet)
    
    let gradeAlert = UIAlertAction(title: "예매율순", style: .default) { (action: UIAlertAction) in
      MovieService().fetchMovies(type: URLType.grade)
    }
    let rateAlert = UIAlertAction(title: "큐레이션", style: .default) { (action: UIAlertAction) in
      MovieService().fetchMovies(type: URLType.rate)
    }
    let dateAlert = UIAlertAction(title: "개봉일순", style: .default) { (action: UIAlertAction) in
      MovieService().fetchMovies(type: URLType.date)
    }
    let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
    alertController.addAction(gradeAlert)
    alertController.addAction(rateAlert)
    alertController.addAction(dateAlert)
    alertController.addAction(cancelAlert)
    vc.present(alertController, animated: true)
  }
}
