//
// Copyright (c) 2018 Related Code - http://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

//-------------------------------------------------------------------------------------------------------------------------------------------------
extension FUser {

	// MARK: - Class methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	class func fullname() -> String		{ return FUser.currentUser().fullname()			}
	class func initials() -> String		{ return FUser.currentUser().initials()			}
	class func picture() -> String		{ return FUser.currentUser().picture()			}
	class func thumbnail() -> String	{ return FUser.currentUser().thumbnail()		}
	class func status() -> String		{ return FUser.currentUser().status()			}
	class func loginMethod() -> String	{ return FUser.currentUser().loginMethod()		}
	class func oneSignalId() -> String	{ return FUser.currentUser().oneSignalId()		}

	class func keepMedia() -> Int		{ return FUser.currentUser().keepMedia()		}
	class func networkImage() -> Int	{ return FUser.currentUser().networkImage()		}
	class func networkVideo() -> Int	{ return FUser.currentUser().networkVideo()		}
	class func networkAudio() -> Int	{ return FUser.currentUser().networkAudio()		}

	class func wallpaper() -> String	{ return FUser.currentUser().wallpaper() 		}
	class func isOnboardOk() -> Bool	{ return FUser.currentUser().isOnboardOk()		}
    
    class func maritalStatus() -> String { return FUser.currentUser().maritalStatus()   }
    class func gender() -> String       { return FUser.currentUser().gender()           }
    class func interestedIn() -> String { return FUser.currentUser().interestedIn()     }
    class func bio() -> String          { return FUser.currentUser().bio()              }
    class func profession() -> String   { return FUser.currentUser().profession()       }
    class func dob() -> String          { return FUser.currentUser().dob()              }
    class func imgUrl1() -> String      { return FUser.currentUser().imgUrl1()          }
    class func imgUrl2() -> String      { return FUser.currentUser().imgUrl2()          }
    class func imgUrl3() -> String      { return FUser.currentUser().imgUrl3()          }
    
    class func height() -> String       { return FUser.currentUser().height()           }
    class func qualification() -> String { return FUser.currentUser().qualification()   }
    class func jobTitle() -> String      { return FUser.currentUser().jobTitle()        }
    class func compnay() -> String       { return FUser.currentUser().compnay()         }
    class func sect() -> String          { return FUser.currentUser().sect()            }
    class func religious() -> String     { return FUser.currentUser().religious()       }
    class func prayer() -> String        { return FUser.currentUser().prayer()          }
    class func seekingMarriage() -> String         { return FUser.currentUser().seekingMarriage() }
    
    class func drinker() -> String          { return FUser.currentUser().drinker()      }
    class func halall() -> String           { return FUser.currentUser().halall()       }
    class func smoker() -> String           { return FUser.currentUser().smoker()       }
    class func language() -> String         { return FUser.currentUser().language()     }
    class func ethnicity() -> String        { return FUser.currentUser().ethnicity()    }
    class func origin() -> String           { return FUser.currentUser().origin()       }
    
    class func maxSeekingAge() -> Int       { return FUser.currentUser().maxSeekingAge()     }
    class func minSeekingAge() -> Int       { return FUser.currentUser().minSeekingAge()     }
    class func age() -> Int                 { return FUser.currentUser().age()               }
    class func maxSeekingDistance() -> Int  { return FUser.currentUser().maxSeekingDistance()}
    class func longitude() -> Double        { return FUser.currentUser().longitude()         }
    class func latitude() -> Double         { return FUser.currentUser().latitude()          }

	// MARK: - Instance methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func fullname() -> String			{ return (self[FUSER_FULLNAME] as? String)		?? ""						}
	func picture() -> String			{ return (self[FUSER_PICTURE] as? String)		?? ""						}
	func thumbnail() -> String			{ return (self[FUSER_THUMBNAIL] as? String)		?? ""						}
	func status() -> String				{ return (self[FUSER_STATUS] as? String)		?? ""						}
	func loginMethod() -> String		{ return (self[FUSER_LOGINMETHOD] as? String)	?? ""						}
	func oneSignalId() -> String		{ return (self[FUSER_ONESIGNALID] as? String)	?? ""						}

	func keepMedia() -> Int				{ return (self[FUSER_KEEPMEDIA] as? Int)		?? Int(KEEPMEDIA_FOREVER)	}
	func networkImage() -> Int			{ return (self[FUSER_NETWORKIMAGE] as? Int)		?? Int(NETWORK_ALL)			}
	func networkVideo() -> Int			{ return (self[FUSER_NETWORKVIDEO] as? Int)		?? Int(NETWORK_ALL)			}
	func networkAudio() -> Int			{ return (self[FUSER_NETWORKAUDIO] as? Int)		?? Int(NETWORK_ALL)			}

	func wallpaper() -> String			{ return (self[FUSER_WALLPAPER] as? String)		?? ""						}
	func isOnboardOk() -> Bool			{ return self[FUSER_FULLNAME] != nil										}
    
    func maritalStatus() -> String      { return (self[FUSER_MARITAL_STATUS] as? String) ?? ""                  }
    func gender() -> String             { return (self[FUSER_GENDER] as? String) ?? ""                          }
    func interestedIn() -> String       { return (self[FUSER_INTERESTEDIN] as? String) ?? ""                    }
    func bio() -> String                { return (self[FUSER_BIO] as? String) ?? ""                             }
    func profession() -> String         { return (self[FUSER_PROFESSION] as? String) ?? ""                      }
    func dob() -> String                { return (self[FUSER_DOB] as? String) ?? ""                             }
    func imgUrl1() -> String            { return (self[FUSER_IMGURL1] as? String) ?? ""                         }
    func imgUrl2() -> String            { return (self[FUSER_IMGURL2] as? String) ?? ""                         }
    func imgUrl3() -> String            { return (self[FUSER_IMGURL3] as? String) ?? ""                         }
    
    func height() -> String             { return (self[FUSER_HEIGHT] as? String) ?? ""                          }
    func qualification() -> String      { return (self[FUSER_QUALIFICATION] as? String) ?? ""                   }
    func jobTitle() -> String           { return (self[FUSER_JOB_TITLE] as? String) ?? ""                       }
    func compnay() -> String            { return (self[FUSER_COMPANY] as? String) ?? ""                         }
    func sect() -> String               { return (self[FUSER_SECT] as? String) ?? ""                            }
    func religious() -> String          { return (self[FUSER_RELIGIOUS] as? String) ?? ""                       }
    func prayer() -> String             { return (self[FUSER_PRAYER] as? String) ?? ""                          }
    func seekingMarriage() -> String    { return (self[FUSER_SEEKING_MARRIAGE] as? String) ?? ""                }
    
    func drinker() -> String            { return (self[FUSER_DRINKER] as? String) ?? ""                         }
    func halall() -> String             { return (self[FUSER_HALALL] as? String) ?? ""                          }
    func smoker() -> String             { return (self[FUSER_SMOKER] as? String) ?? ""                          }
    func language() -> String           { return (self[FUSER_LANGUAGE] as? String) ?? ""                        }
    func ethnicity() -> String          { return (self[FUSER_ETHNICITY] as? String) ?? ""                       }
    func origin() -> String             { return (self[FUSER_ORIGIN] as? String) ?? ""                          }
    
    func maxSeekingAge() -> Int         { return (self[FUSER_MAXSEEKINGAGE] as? Int)   ?? Int(MAXAGE)           }
    func minSeekingAge() -> Int         { return (self[FUSER_MINSEEKINGAGE] as? Int)   ?? Int(MINAGE)           }
    func age() -> Int                   { return (self[FUSER_AGE] as? Int)             ?? Int(AGE)              }
    func maxSeekingDistance() -> Int    { return (self[FUSER_MINSEEKINGAGE] as? Int)   ?? Int(MAXDISTANCE)      }
    
    func longitude() -> Double          { return (self[FUSER_LONGITUDE] as? Double) ?? 0                        }
    func latitude() -> Double           { return (self[FUSER_LATITUDE] as? Double)  ?? 0                        }
    
    

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func initials() -> String {

		if let firstname = self[FUSER_FIRSTNAME] as? String {
			if let lastname = self[FUSER_LASTNAME] as? String {
				let initial1 = (firstname.count != 0) ? firstname.prefix(1) : ""
				let initial2 = (lastname.count != 0) ? lastname.prefix(1) : ""
				return "\(initial1)\(initial2)"
			}
		}
		return ""
	}
}
