//
//  File.swift
//  Minicron
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import Foundation

struct TestConstants {
    
    static let configString = """
30 1 /bin/run_me_daily
45 * /bin/run_me_hourly
* * /bin/run_me_every_minute
* 19 /bin/run_me_sixty_times
"""
    
    static let configStringWithSpuriousSlashR = """
30 1 /bin/run_me_daily
45 * /bin/run_me_hourly\r
* * /bin/run_me_every_minute
* 19 /bin/run_me_sixty_times
"""

    static let correctLine = """
45 * /bin/run_me_hourly
"""
    
    static let incorrectLine = """
45 * /bin/run_me_hourly *
"""
    
    static let configArray = [
        "30 1 /bin/run_me_daily",
        "45 * /bin/run_me_hourly",
        "* * /bin/run_me_every_minute",
        "* 19 /bin/run_me_sixty_times"
    ]
    
    static let outputArray = [
        "1:30 tomorrow - /bin/run_me_daily",
        "16:45 today - /bin/run_me_hourly",
        "16:10 today - /bin/run_me_every_minute",
        "19:00 today - /bin/run_me_sixty_times"
    ]
    
}
