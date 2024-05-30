/*大きさ、時間、右方向か左方向かのどちらかに発生させるかを任意に決めることができる波発生プログラム*/

import Foundation
func right_shift(chenge_wave:inout[Character],i:Int,x:Int){   //右方向に波を発生
    var a=0
    if((i/(x-1))%2==0){
        a=i%(x-1)
        chenge_wave[a]="■"          //波を発生させる
    }else{
        a=(x-1)-i%(x-1)
        chenge_wave[a]=" "          //波を収束させる
    }
}
func left_shift(chenge_wave:inout[Character],i:Int,x:Int){   //左方向に波を発生
    var a=0
    if((i/(x-1))%2==0){
        a=(x-1)-i%(x-1)
        chenge_wave[a]="■"          //波を発生させる
    }else{
        a=i%(x-1)
        chenge_wave[a]=" "          //波を収束させる
    }
}
func main(){
    print("どのくらいの大きさの波を発生させますか")
    let x=Int(readLine()!)!             //波の大きさを指定
    var wave:String=String(repeating:" ",count:x)
    var chenge_wave=Array(wave)
    print("何秒波を発生させますか")
    let n=(Int(readLine()!)!)*100       //波の発生時間を指定
    print("右方向と左方向のどちらの方向に発生させますか(右方向:1,左方向:2)")
    var R_or_L=Int(readLine()!)!        //波の発生方向の指定
    while(R_or_L<1 || R_or_L>2){
        print("右方向と左方向のどちらの方向に発生させますか(右方向:1,左方向:2)")
        R_or_L=Int(readLine()!)!
    }
    for i in 0...n-1{
        wave=String(chenge_wave)
        print(wave,"\n")                    //波の発生を表示
        Thread.sleep(forTimeInterval:0.01)  //約0.01秒の処理待ち(より滑らかに波を表示させるため)
        switch(R_or_L){
        case 1 : right_shift(chenge_wave:&chenge_wave,i:i,x:x); break   //右方向に波を発生
        case 2 : left_shift(chenge_wave:&chenge_wave,i:i,x:x); break    //左方向に波を発生
        default : break
        }
    }
}
main()
