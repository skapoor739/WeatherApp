//
//  Weather.swift
//  WeatherApp
//
//  Created by Shivam Kapur on 05/12/15.
//  Copyright © 2015 Shivam Kapur. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
        var name:String!
        private var _city:String!//
        private var _temperature:String!//
        private var _weatherDecription:String!//
        private var _countryCode:String!//
        private var _seaLevel:String!//
        private var _humidity:String!//
    private var _date:String!
    private var _time:String!
    private var _day:String!
    
    private var url:String!

    var day:String {
        return _day
    }
    
    var time:String {
        return _time
    }
    var date:String {
        return _date
    }
        var city:String {
        return _city
        }

        var temperature:String {
        return _temperature
        }

        var weatherDescription:String {
        return _weatherDecription
        }

        var countryCode:String {
        return _countryCode
        }

        var seaLevel:String {
        return _seaLevel
        }

        var humidity:String {
        return _humidity
        }
    init(name:String) {
            self.name = name
           
    }
    
        func downloadComplete(completed:downloadWeatherDetails) {
        let connect = NSURL(string: BASE_URL)!
        Alamofire.request(.GET, connect).responseJSON { (request: NSURLRequest?, response: NSHTTPURLResponse?, result: Result<AnyObject>) -> Void in
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let name = dict["name"] as? String {
                    self._city = name
                }
                if let dt = dict["dt"] as? Double {
                    let date = NSDate(timeIntervalSince1970: dt)
                    let dayFormatter = NSDateFormatter()
                    let dateFormatter = NSDateFormatter()
                    let timeFormatter = NSDateFormatter()
                    dayFormatter.dateFormat = "EEEE"
                    dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
                    timeFormatter.dateFormat = "h:mm a"
                    self._day = dayFormatter.stringFromDate(date)
                    self._date = dateFormatter.stringFromDate(date)
                    self._time = timeFormatter.stringFromDate(date)
                    
                }

                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    if let keyword = weather[0]["main"] as? String {
                        self._weatherDecription = keyword
                    }
                }
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    if let temp = main["temp"] as? Int {
                        self._temperature = "\(temp)"
                        print(self._temperature)
                    }
                    if let sealevel = main["sea_level"] as? Int {
                        self._seaLevel = "\(sealevel)"
                    }
                    if let humidity = main["humidity"] as? Int {
                        self._humidity = "\(humidity)"
                    }
                }
                if let countryCode = dict["sys"] as? Dictionary<String,AnyObject> {
                    if let code = countryCode["country"] as? String {
                        self._countryCode = code
                    }
                }
                
            }
            completed()
        }
    }
}


