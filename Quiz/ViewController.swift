//
//  ViewController.swift
//  Quiz
//
//  Created by 米澤瑞希 on 2017/09/24.
//  Copyright © 2017年 GeekSalon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 変数宣言と初期化
    var point: Int = 0
    var quizNumber: Int = 0
    var quizArray: [Quiz] = []
    
    // Storyboard上のパーツについて宣言
    @IBOutlet var quizNumberLabel: UILabel!
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var option1Button: UIButton!
    @IBOutlet var option2Button: UIButton!
    @IBOutlet var option3Button: UIButton!
    
    //画面起動時に呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // クイズのセットアップ
        setUpQuiz()
        
        //　クイズ番号、クイズ、各選択肢の表示
        showQuiz()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // クイズのセットアップ
    func setUpQuiz() {
        let quiz1 = Quiz(text: "次の一節は欅坂46のある歌の歌詞の一部です。この歌詞を含む曲名は？　ー人が溢れた交差点をどこへ行く？似たような服を着て似たような表情でー", option1: "キミガイナイ", option2: "サイレントマジョリティー", option3: "不協和音", answer: "サイレントマジョリティー")
        let quiz2 = Quiz(text: "次の一節は桑田佳祐さんのある歌の歌詞の一部です。この歌詞を含む曲名は？　ー神より賜えし孤独やトラブル泣きたい時は並みなよ　これが運命でしょうか？あきらめようか？季節は巡る魔法のように-", option1: "可愛いミーナ", option2: "祭りのあと", option3: "明日晴れるかな", answer: "明日晴れるかな")
        let quiz3 = Quiz(text: "次の一節はSuchmosのある歌の歌詞の一部です。この歌詞を含む曲名は？　ーしょうもないbut 本能優勢　A low brain and doewn brain SOS　猿の惑星そう　結果 we are ape-", option1: "MINT", option2: "STAY TUNE", option3: "Miree", answer: "Miree")
        let quiz4 =  Quiz(text: "2006年のヒット曲ランキング１位は？",    option1: "KAT-TUN 「Real Face」", option2: "レミオロメン「粉雪」", option3: "修二と彰「青春アミーゴ」", answer: "KAT-TUN 「Real Face」")
        let quiz5 = Quiz(text: "ロックバンドbacknumberの1stシングルは？", option1: "花束", option2: "はなびら", option3: "高嶺の花子さん", answer: "はなびら")
        
        // quizArray配列に問題を追加
        quizArray.append(quiz1)
        quizArray.append(quiz2)
        quizArray.append(quiz3)
        quizArray.append(quiz4)
        quizArray.append(quiz5)
        
        // quizArrayをシャッフルして、入れ直す
        quizArray = Quiz.shuffle(quizArray: quizArray)
    }
    
    // クイズを各パーツに表示
    func showQuiz() {
        //　クイズ番号、クイズ、各選択肢の表示    
        quizNumberLabel.text = String(quizNumber + 1) + "問目"
        quizTextView.text = quizArray[quizNumber].text
        option1Button.setTitle(quizArray[quizNumber].option1, for: .normal)
        option2Button.setTitle(quizArray[quizNumber].option2, for: .normal)
        option3Button.setTitle(quizArray[quizNumber].option3, for: .normal)
}
    
    // クイズの各データをリセット
    func resetQuiz() {
        point = 0
        quizNumber = 0
        self.quizArray = Quiz.shuffle(quizArray: self.quizArray)
        self.showQuiz()
    }
    
    // クイズをアップデート
    func updateQuiz() {
        //　問題番号を更新
        quizNumber = quizNumber + 1
        
        //　もし最終問題を解き終えたら、アラートを出して結果表示
        if quizNumber == quizArray.count {
            let alertText = "\(quizArray.count)問中、\(point)問正解でした。"
            let alertController = UIAlertController(title: "結果", message: alertText, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in self.resetQuiz()
            })
            alertController.addAction(okAction)
            self.present(alertController, animated:true, completion: nil)
        } else {
            // 最終問題以外では次の問題を表示
            showQuiz()
        }
    }
    
    //　選択肢1が押された時の処理
    @IBAction func selectOption1(){
        // ボタンないの文言と、もともと設定していた答えが一致しているか確認
        if option1Button.titleLabel?.text == quizArray[quizNumber].answer{
            print("正解!")
            //　正解ポイント追加
            point = point + 1
        } else {
            print("不正解!")
        }
        
        //　次の問題へ
        updateQuiz()
    }
    
    // 選択肢2が背押された時の処理
    @IBAction func selectOption2() {
        // ボタンないの文言と、もともと設定していた答えが一致しているか確認
        if option2Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解!")
            // 正解ポイント追加
            point = point + 1
        } else {
            print("不正解!")
        }
        
        //  次の問題へ
        updateQuiz()
    }
    
    // 選択肢３が押された時の処理
    @IBAction func selectOption3() {
        //ボタン内の文言と、もともと設定していた答えが一致しているか確認
        if option3Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解!")
            // 正解ポイント追加
            point = point + 1
        } else {
            print("不正解!")
        }
        
        // 次の問題へ
        updateQuiz()
    
    
    }
    
}

