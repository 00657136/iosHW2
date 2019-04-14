//
//  ViewController.swift
//  tia
//
//  Created by User08 on 2019/4/12.
//  Copyright © 2019 JRU. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController:  UIViewController,UITextFieldDelegate {
    @IBOutlet weak var characterSeg: UISegmentedControl!
    @IBOutlet weak var clothesstyleTextField: UITextField!
    
    @IBOutlet weak var selfieSwitch: UISwitch!
    @IBOutlet weak var relationshipLabel: UILabel!
    @IBOutlet weak var girlImage: UIImageView!
    
    @IBOutlet weak var songImage: SharpImageView!
    
    @IBOutlet weak var yearsOldLabel: UILabel!
    
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var yearsOldDate: UIDatePicker!
    
    var RandomNum = Int.random(in: 1...5
    )

    @IBAction func RandomButtom(_ sender: UIButton) {
        RandomNum = Int.random(in: 1...5
        )
        if characterSeg.selectedSegmentIndex == 0{
            if  RandomNum == 1 && selfieSwitch.isOn == true{
                girlImage.image = #imageLiteral(resourceName: "tianormal1")}
            if RandomNum == 1 && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "tianormal2")}
            if RandomNum == 2 && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "tiaol1")}
            if RandomNum == 2 && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "tiaol2")}
            if RandomNum == 3 && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "tiasport1")}
            if RandomNum == 3 && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "tiasport2")}
            if RandomNum == 4 && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "tiasleep1")}
            if RandomNum == 4 && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "tiasleep2")}
            if RandomNum == 5 && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "tiaswim1")}
            if RandomNum == 5 && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "tiaswim2")}
            
        }
        else{
            if RandomNum == 1 && selfieSwitch.isOn == true{
                girlImage.image = #imageLiteral(resourceName: "zoenormal1")}
            if RandomNum == 1 && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "zoenormal2")}
            if RandomNum == 2 && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "zoeol1")}
            if RandomNum == 2 && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "zoeol2")}
            if RandomNum == 3 && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "zoesport1")}
            if RandomNum == 3 && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "zoesport2")}
            if RandomNum == 4 && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "zoesleep1")}
            if RandomNum == 4 && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "zoesleep2")}
            if RandomNum == 5 && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "zoeswim1")}
            if RandomNum == 5 && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "zoeswim2")}
        }
        
    }
    @IBAction func yearsOldDatePicker(_ sender: UIDatePicker) {
        let dateValue = DateFormatter()
        dateValue.dateFormat = "YYYY年MM月dd日"
        yearsOldLabel.text = "我的生日是："+dateValue.string(from: yearsOldDate.date)
    }
    
    
    
    
    
    
    
    var relationshipValue:Int = 1
    var looper: AVPlayerLooper?
    @IBAction func relationshipSlider(_ sender: UISlider) {
        relationshipLabel.isHidden = false
        relationshipValue = Int(sender.value)
        relationshipLabel.text = "\(relationshipValue)"
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        clothesstyleTextField.delegate = self
        if let url = URL(string: "https://r3---sn-un57en7e.googlevideo.com/videoplayback?fvip=3&mime=video%2Fmp4&key=cms1&expire=1555260064&lmt=1470218959836571&ipbits=0&itag=18&pl=16&dur=658.564&ratebypass=yes&source=youtube&requiressl=yes&gir=yes&id=o-ABBgmqTKWA2qKsXftNm-bU373GYFflSWacctdiOW43PB&clen=42745431&ip=2a01%3A4f8%3A191%3A1ac%3A%3A2&ei=QA6zXKu1G83w1gLftpmQCw&sparams=clen,dur,ei,expire,gir,id,ip,ipbits,itag,lmt,mime,mip,mm,mn,ms,mv,pl,ratebypass,requiressl,source&signature=0AFB2AAFE1BA7E32F03225A8A91B6DBD0B72B169.36C8BE4226E55F3F75B2475FAA2920CE8F410151&c=WEB&title=Hearthstone:%20One%20Night%20in%20Karazhan%20Theme%20Song%20-ONiK&mip=140.121.196.88&cm2rm=sn-5njj-u2xl7e,sn-un567s&req_id=b7dfe3b29691a3ee&redirect_counter=2&cms_redirect=yes&mm=34&mn=sn-un57en7e&ms=ltu&mt=1555238377&mv=m"){
            songName.text = "現正播放歌曲：夜夜卡拉贊"
            let player = AVQueuePlayer()
            let item = AVPlayerItem(url: url)
            looper = AVPlayerLooper(player: player, templateItem: item)
            player.play()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 當按下右下角的return鍵時觸發
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // 關閉鍵盤
        return true
    }

    @IBAction func sendButton(_ sender: AnyObject) {
        let clothesstyle:String = clothesstyleTextField.text!
        if characterSeg.selectedSegmentIndex == 0{
            if (clothesstyle == "日常") && selfieSwitch.isOn == true{
                girlImage.image = #imageLiteral(resourceName: "tianormal1")}
            if (clothesstyle == "日常") && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "tianormal2")}
            if (clothesstyle == "OL") && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "tiaol1")}
            if (clothesstyle == "OL") && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "tiaol2")}
            if (clothesstyle == "運動") && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "tiasport1")}
            if (clothesstyle == "運動") && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "tiasport2")}
            if (clothesstyle == "睡衣") && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "tiasleep1")}
            if (clothesstyle == "睡衣") && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "tiasleep2")}
            if (clothesstyle == "泳衣") && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "tiaswim1")}
            if (clothesstyle == "泳衣") && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "tiaswim2")}
            if(clothesstyle != "泳衣")&&(clothesstyle != "睡衣")&&(clothesstyle != "運動")&&(clothesstyle != "日常")&&(clothesstyle != "OL") && selfieSwitch.isOn == false{
                girlImage.image = #imageLiteral(resourceName: "browser")}
            if(clothesstyle != "泳衣")&&(clothesstyle != "睡衣")&&(clothesstyle != "運動")&&(clothesstyle != "日常")&&(clothesstyle != "OL") && selfieSwitch.isOn == true{
                girlImage.image = #imageLiteral(resourceName: "browser")}
        }
        else{
            if (clothesstyle == "日常") && selfieSwitch.isOn == true{
            girlImage.image = #imageLiteral(resourceName: "zoenormal1")}
            if (clothesstyle == "日常") && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "zoenormal2")}
            if (clothesstyle == "OL") && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "zoeol1")}
            if (clothesstyle == "OL") && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "zoeol2")}
            if (clothesstyle == "運動") && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "zoesport1")}
            if (clothesstyle == "運動") && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "zoesport2")}
            if (clothesstyle == "睡衣") && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "zoesleep1")}
            if (clothesstyle == "睡衣") && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "zoesleep2")}
            if (clothesstyle == "泳衣") && selfieSwitch.isOn == true{girlImage.image = #imageLiteral(resourceName: "zoeswim1")}
            if (clothesstyle == "泳衣") && selfieSwitch.isOn == false{girlImage.image = #imageLiteral(resourceName: "zoeswim2")}
            if(clothesstyle != "泳衣")&&(clothesstyle != "睡衣")&&(clothesstyle != "運動")&&(clothesstyle != "日常")&&(clothesstyle != "OL") && selfieSwitch.isOn == false{
                girlImage.image = #imageLiteral(resourceName: "browser")}
            if(clothesstyle != "泳衣")&&(clothesstyle != "睡衣")&&(clothesstyle != "運動")&&(clothesstyle != "日常")&&(clothesstyle != "OL") && selfieSwitch.isOn == true{
                girlImage.image = #imageLiteral(resourceName: "browser")}
        }
        if relationshipValue == 0{
            let speechUtterance = AVSpeechUtterance(string: "以後別做朋友"
            )
            speechUtterance.voice = AVSpeechSynthesisVoice(language:"zh-TW")
            speechUtterance.pitchMultiplier = 1.5
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
          girlImage.image = #imageLiteral(resourceName: "2019-4-11_ 21-46-11")
            songImage.image = #imageLiteral(resourceName: "hqdefault")
            songName.text = "現正播放歌曲：以後別做朋友"
            if let url = URL(string:"https://r6---sn-5njj-u2xe.googlevideo.com/videoplayback?source=youtube&clen=12463632&dur=264.452&expire=1555260843&ei=SxGzXJW9IJKe1wKlhIOYDQ&requiressl=yes&itag=18&sparams=clen,dur,ei,expire,gir,id,ip,ipbits,itag,lmt,mime,mip,mm,mn,ms,mv,pl,ratebypass,requiressl,source&fvip=6&pl=16&mime=video%2Fmp4&id=o-AGyijP3wTCnsrewtKrnzW1guwrLf8H7r7IYfZUTUSoNn&gir=yes&key=cms1&ip=178.162.205.105&ipbits=0&c=WEB&txp=5531432&lmt=1541578060225983&ratebypass=yes&signature=50BE05A4D4B2634D1F8A1B106FB43FC9AD2C9CB2.62728065E6226B88B4CC1442FB6ED77262938E2E&title=Eric%E5%91%A8%E8%88%88%E5%93%B2%E3%80%8A%E4%BB%A5%E5%BE%8C%E5%88%A5%E5%81%9A%E6%9C%8B%E5%8F%8B%E3%80%8BOfficial_Music_Video&cms_redirect=yes&mip=140.121.196.88&mm=31&mn=sn-5njj-u2xe&ms=au&mt=1555239171&mv=m"){
                let player = AVQueuePlayer()
                let item = AVPlayerItem(url: url)
                looper = AVPlayerLooper(player: player, templateItem: item)
                player.play()
            }
        }
        if relationshipValue == 1{
            let speechUtterance = AVSpeechUtterance(string: "是我還不夠好，所以他不願承認，承認我對他的好，承認我到底有多重要，也許我不重要"
            )
            speechUtterance.voice = AVSpeechSynthesisVoice(language:"zh-TW")
            speechUtterance.pitchMultiplier = 1.5
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
            songImage.image = #imageLiteral(resourceName: "maxresdefault")
            songName.text = "現正播放歌曲：是我不夠好"
            if let url = URL(string:"https://r3---sn-5njj-u2xe.googlevideo.com/videoplayback?ratebypass=yes&sig=ALgxI2wwRQIgQZrJL4o2E2a9HapcZhUpF698dtUkm_ssQMbm68Qvsa0CIQC7-qK1NrIM7fYVt1fWNahgt7K_y1eN5SUXQYvhYuipxw%3D%3D&gir=yes&dur=219.614&clen=15974066&requiressl=yes&lmt=1552131644142863&ipbits=0&fvip=1&mime=video%2Fmp4&ip=2a01%3A4f8%3A191%3A1ac%3A%3A2&source=youtube&ei=vhKzXOP7Cs-a8gONmYeYBw&id=o-ADiW_YKU8_6014m62sZGY05NBwmVfUEpjflwo2LBRIA2&sparams=expire%2Cei%2Cip%2Cmime%2Cclen%2Csource%2Cgir%2Cipbits%2Clmt%2Cratebypass%2Cdur%2Cid%2Crequiressl%2Citag&c=WEB&txp=5531432&expire=1555261214&itag=18&title=%E6%9D%8E%E6%AF%93%E8%8A%ACTia%20Lee%E3%80%8A%E6%98%AF%E6%88%91%E4%B8%8D%E5%A4%A0%E5%A5%BDNot%20Good%20Enough%E3%80%8BOfficial%20Music%20Video%20HD&cms_redirect=yes&mip=140.121.196.88&mm=31&mn=sn-5njj-u2xe&ms=au&mt=1555239569&mv=m&pl=16&lsparams=mip,mm,mn,ms,mv,pl&lsig=AHylml4wRQIhALXfyVIH2EFO-EplHaoLw5mmiIP1iNA3fVlKL8IbnQj4AiA1Uxj9bjZKf9tFdb3r2Q-MmaPhHbTqW_fVcvzJlwzyNg=="){
                let player = AVQueuePlayer()
                let item = AVPlayerItem(url: url)
                looper = AVPlayerLooper(player: player, templateItem: item)
                player.play()
            }
        }
        if relationshipValue == 2{
            let speechUtterance = AVSpeechUtterance(string: "我們怎麼還不愛，曖昧有點煩，讓人進退兩難"
            )
            speechUtterance.voice = AVSpeechSynthesisVoice(language:"zh-TW")
            speechUtterance.pitchMultiplier = 1.5
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
            songImage.image = #imageLiteral(resourceName: "maxresdefault (1)")
            songName.text = "現正播放歌曲：怎麼還不愛"
            if let url = URL(string:"https://r4---sn-5njj-u2xl.googlevideo.com/videoplayback?source=youtube&dur=296.565&pl=16&itag=18&mime=video%2Fmp4&txp=5531432&expire=1555261387&c=WEB&ratebypass=yes&gir=yes&ipbits=0&clen=18716252&key=cms1&ip=178.162.205.110&id=o-AOpic07S-qODJFfppMe2MprAVf9j__dqdTCPyjeVHMlZ&sparams=clen,dur,ei,expire,gir,id,ip,ipbits,itag,lmt,mime,mip,mm,mn,ms,mv,pl,ratebypass,requiressl,source&ei=axOzXLfGEYSp7gPRw5wY&fvip=2&lmt=1547741616618270&requiressl=yes&signature=119B41BF9FA22A1B30F1397366DE507015934CC0.3B076BB1F6665ABDF70523AD912E4334FC869C45&title=Rosie%E6%A5%8A%E5%87%B1%E7%90%B3&%E4%BD%99%E6%A5%93%E3%80%8A%E6%80%8E%E9%BA%BC%E9%82%84%E4%B8%8D%E6%84%9B_Why_Not_Love%E3%80%8BOfficial_Music_Video=&cms_redirect=yes&mip=140.121.196.88&mm=31&mn=sn-5njj-u2xl&ms=au&mt=1555239711&mv=m"){
                let player = AVQueuePlayer()
                let item = AVPlayerItem(url: url)
                looper = AVPlayerLooper(player: player, templateItem: item)
                player.play()
            }
        }
        if relationshipValue == 3{
            let speechUtterance = AVSpeechUtterance(string: "再靠近一點點，就讓你牽手，再勇敢一點點，我就跟你走"
            )
            speechUtterance.voice = AVSpeechSynthesisVoice(language:"zh-TW")
            speechUtterance.pitchMultiplier = 1.5
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
            songImage.image = #imageLiteral(resourceName: "hqdefault (1)")
            songName.text = "現正播放歌曲：戀人未滿"
            if let url = URL(string:"https://r1---sn-5njj-u2xe.googlevideo.com/videoplayback?id=o-AG8N2k2dR9BkrWDQo_-rTR9ly6FUMobeogZBwo_sLdx3&itag=18&source=youtube&requiressl=yes&pl=16&ei=1hSzXJTnFJLsgAeAzK3oCw&mime=video%2Fmp4&gir=yes&clen=15543753&ratebypass=yes&dur=272.811&lmt=1552321493158511&fvip=1&c=WEB&txp=5531432&ip=178.162.205.110&ipbits=0&expire=1555261750&sparams=clen,dur,ei,expire,gir,id,ip,ipbits,itag,lmt,mime,mip,mm,mn,ms,mv,pl,ratebypass,requiressl,source&key=cms1&signature=46C875C2E6A8BC634B169C0247EEC0A1C333B969.22129A5B4BD0808894F5A474407D819D632E5B5D&title=S.H.E_[%E6%88%80%E4%BA%BA%E6%9C%AA%E6%BB%BF_Not_Yet_Lovers]_Official_Music_Video&cms_redirect=yes&mip=140.121.196.88&mm=31&mn=sn-5njj-u2xe&ms=au&mt=1555240065&mv=m"){
                let player = AVQueuePlayer()
                let item = AVPlayerItem(url: url)
                looper = AVPlayerLooper(player: player, templateItem: item)
                player.play()
            }
        }
        if relationshipValue == 4{
            let speechUtterance = AVSpeechUtterance(string: "原來你是我最想留住的幸運"
            )
            speechUtterance.voice = AVSpeechSynthesisVoice(language:"zh-TW")
            speechUtterance.pitchMultiplier = 1.5
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
            songImage.image = #imageLiteral(resourceName: "maxresdefault (2)")
            songName.text = "現正播放歌曲：小幸運"
            if let url = URL(string:"https://r5---sn-5njj-u2xe.googlevideo.com/videoplayback?id=o-AHi-Qft9Hl5u_qwM4isjH2Ik2Sir5QYCaFlEA44doelN&itag=18&source=youtube&requiressl=yes&pl=16&ei=kxezXPbCIM-a8gOlq7SoAg&mime=video%2Fmp4&gir=yes&clen=20331768&ratebypass=yes&dur=288.647&lmt=1552829375073234&fvip=2&c=WEB&txp=5531432&ip=178.162.205.110&ipbits=0&expire=1555262451&sparams=clen,dur,ei,expire,gir,id,ip,ipbits,itag,lmt,mime,mip,mm,mn,ms,mv,pl,ratebypass,requiressl,source&key=cms1&signature=813DDAB81D0B60FA45EA208EDAC4BAEB1053CA15.74C7CD9D60BCD4506EEC630A6FD45A7DA0992A40&title=%E3%80%90%E6%88%91%E7%9A%84%E5%B0%91%E5%A5%B3%E6%99%82%E4%BB%A3_Our_Times%E3%80%91Movie_Theme_Song_-_%E7%94%B0%E9%A6%A5%E7%94%84_Hebe_Tien%E3%80%8A%E5%B0%8F%E5%B9%B8%E9%81%8B_A_Little_Happiness%E3%80%8BOfficial_MV&cms_redirect=yes&mip=140.121.196.88&mm=31&mn=sn-5njj-u2xe&ms=au&mt=1555240737&mv=m"){
                let player = AVQueuePlayer()
                let item = AVPlayerItem(url: url)
                looper = AVPlayerLooper(player: player, templateItem: item)
                player.play()
            }
        }
        if relationshipValue == 5{
            let speechUtterance = AVSpeechUtterance(string: "只有我瞭解這幸福感覺，美得值得去付出一切，能夠遇見你認識你喜歡你愛上你，感謝我每滴眼淚"
            )
            speechUtterance.voice = AVSpeechSynthesisVoice(language:"zh-TW")
            speechUtterance.pitchMultiplier = 1.5
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
            songImage.image = #imageLiteral(resourceName: "maxresdefault (3)")
            songName.text = "現正播放歌曲：愛上你"
            if let url = URL(string:"https://r5---sn-5njj-u2xe.googlevideo.com/videoplayback?source=youtube&pl=16&requiressl=yes&ip=178.162.205.105&mime=video%2Fmp4&expire=1555262104&id=o-AGkXSDhvmqSX6pKoEK07UJgAbDnPrjG4tnSL0vmuVfkg&sparams=clen,dur,ei,expire,gir,id,ip,ipbits,itag,lmt,mime,mip,mm,mn,ms,mv,pl,ratebypass,requiressl,source&lmt=1540260055830487&gir=yes&ei=OBazXJbBK92A8gOX25boDw&dur=244.204&fvip=2&ipbits=0&ratebypass=yes&txp=5531432&key=cms1&c=WEB&clen=12398908&itag=18&signature=4D7194A1F978074E3BB0F93ECC253EA88F5C9596.64947532011992E22BAC5EDD79AC43C4A701D122&title=S.H.E_[%E6%84%9B%E4%B8%8A%E4%BD%A0_Loving_You]_Official_Music_Video&cms_redirect=yes&mip=140.121.196.88&mm=31&mn=sn-5njj-u2xe&ms=au&mt=1555240402&mv=m"){
                let player = AVQueuePlayer()
                let item = AVPlayerItem(url: url)
                looper = AVPlayerLooper(player: player, templateItem: item)
                player.play()
            }
        }
        
    }
}

