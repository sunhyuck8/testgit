
class Stick{
    constructor(container, width, height, x, y, velY, innerText){
        this.container = container;
        this.width = width;
        this.height = height;
        this.x = x;
        this.y  =y;
        this.velY = velY;
        this.innerText = innerText;

        this.div = document.createElement("div");
        this.div.style.width=this.width+"%";
        this.div.style.height=this.height+"%";
        this.div.style.position="relative";
        this.div.style.left=this.x+"px";
        this.div.style.top=this.y+"px";
        this.div.style.float = "left";
        this.div.style.border="1px solid black";
        this.div.style.boxSizing="border-box";

        //div 안에 텍스트 
        this.div.innerText = this.innerText;
        this.div.style.textAlign = "center";
        this.div.style.fontSize = "30px";
        
        //부착
        this.container.appendChild(this.div);
    } 
}

class downNote{
    constructor(container, width, height, x, y, velY, delayT, text1, text2){
        this.container = container;
        this.img = document.createElement("img")
        this.width = width;
        this.height = height;
        this.x = x;
        this.y  =y;
        this.velY = velY;
        this.delayT=delayT;
        this.text1 = text1;
        this.text2 = text2;


        this.delayMove();
        this.div = document.createElement("div");
        this.div.style.width=this.width+"%";
        this.div.style.height=this.height+"%";
        this.div.style.position="absolute";
        this.div.style.left=this.x+"px";
        this.div.style.top=this.y+"%";
        this.div.style.float = "left";
        this.div.style.overflow = "hidden";
        this.div.style.boxSizing="border-box";
        this.div.style.background = "white";


         //img에 대한 설정
         if(text1 == 0 || text1 == 4){
            this.img.src = "../images/button/button1.png"
        }else if(text1 == 1 || text1 == 3){
            this.img.src = "../images/button/button2.png"
        }else if(text1 ==2){
            this.img.src = "../images/button/button3.png"
        }
        this.img.style.width = "100%";
        this.img.style.height = "100%";
        this.img.style.left = "0px";
        this.img.style.position = "relative";
        this.div.appendChild(this.img)


        this.container.appendChild(this.div);
    }
    delayMove(){
        this.y=this.y-this.velY/20*this.delayT;
        
    }
    tick(){
        if(parseInt(this.y)<100){
            this.y += this.velY;
        }

        // if(parseInt(this.div.style.top)+parseInt(this.div.style.height)>100){
        //     // this.div.style.display = "none";
        //     var index = downNoteArray.indexOf(this);
        //     // console.log("1",index)
        //     this.container.removeChild(this.div);
        //     downNoteArray.splice(index,1);
      
        //     return sliceCount=1
        // }
        
    }
    render(){
        //내려올때,
        if( parseInt(this.y) > 0 && parseInt(this.y)<100){
            this.div.style.top= this.y+"%";
        }
        //닿을때,
        if( parseInt(this.y) > 90){
            this.div.style.background = "yellow"

            if( parseInt(this.y) == 99){
                var score = parseInt(scoreBox.div.innerText);

                
                // 시작과 종료하는거
                if(score<0){
                    vid.pause();
                    var response = confirm("끝\n이 노래를 다시 재생합니다.");
                    if(response){
                        location.href="./O2jam.html?mSrc:"+selectNum;
                    }else{
                        location.href="../intro.html";
                    }
                }


                score -= 100;
                scoreBox.div.innerText = score;

                
            }

        }
        //넘어갔을때.
        if(parseInt(this.y)+parseInt(this.height)>99){
            this.div.style.display ="none";
        }
    }
    getTarget(){
        //바에 닿는거 체크
        if(parseInt(this.div.style.top) >87 && parseInt(this.div.style.top)+parseInt(this.div.style.height) < 95 ){
           if(this.text1 == testword){
                this.div.style.display ="none"
                // scoreBox.innerText += 100;
                targetpoint[this.text1].div.style.opacity ="";

                var score = parseInt(scoreBox.div.innerText);
                score += 100;
                scoreBox.div.innerText = score;
           }
        }








        // if(parseInt(this.y)>10&&parseInt(this.y)<12){
        //     // console.log(this.text1, ", ", this.text2)
        //     // console.log(this.container,"-----", this.div, "-----", this.div.container)
        //     this.div.style.display="none";
        //     // console.log(this.div.parentNode)
        //     var pic = {
        //         "col" : this.text1,
        //         "row":this.text2,
        //         "status" : testword
        //     }
        //     return pic
        // }
    }

    targetTest(eventkeyCode){
        console.log(eventkeyCode);
    }
}
    

class pointTarget{
    constructor(container, width, height, x, y, color){
        this.container = container;
        this.width = width;
        this.height = height;
        this.x = x;
        this.y  =y;
        this.color = color;

        this.div = document.createElement("div");
        this.div.style.width=this.width+"%";
        this.div.style.height=this.height+"%";
        this.div.style.position="absolute";
        this.div.style.left=this.x+"%";
        this.div.style.top=this.y+"%";
        this.div.style.float = "left";
        this.div.style.border="1px solid black";
        this.div.style.boxSizing="border-box";
        this.div.style.background = color;

        this.container.appendChild(this.div);
    }
}

// 시간을 재는 함수 
function checkTime(eventkeyCode, time){
    var minute= new Date().getMinutes();
    var seconds= new Date().getSeconds();
    var milliseconds= new Date().getMilliseconds();
    var day = new Date();
 
    var info = (day-time);
    
    // console.log(day-time);
    switch(eventkeyCode){
        case 83 :noteSaveBox[0].push(info) ;break;
        case 68 :noteSaveBox[1].push(info) ;break;
        case 32 :noteSaveBox[2].push(info) ;break;
        case 75 :noteSaveBox[3].push(info) ;break;
        case 76 :noteSaveBox[4].push(info) ;break;
    }
}

function attachImg(target, imgName, opacity){
    var img = document.createElement("img");
    img.src = "../images/button/"+imgName;
    img.style.width ="100%";
    img.style.height = "100%";
    img.style.opacity = opacity

    target.appendChild(img);
}

function rotaImg(target , angle){
    target.div.style.transform ="rotate("+angle+"deg)";
    // console.log("testword는?", testword)
    if(testword!=10){
        var targetNum=buttonBarArray.indexOf(target);
        // console.log("번호는 ", targetNum);
        targetpoint[targetNum].div.style.opacity ="0.5" ;
    }
}

 //수동으로 이미지 붙이기
 function buttonImg(target , imgName, imgOpacity){
    var img = document.createElement("img");
    img.src = "../images/button/"+imgName
    img.style.width = "100%";
    img.style.height = "100%";
    img.style.opacity = imgOpacity;
    
    target.appendChild(img);
    
    // var imgTop = img;
    // img.style.height = "50%";
    // imgTop.style.opacity = 0.5;
    
    // targetTop.appendChild(imgTop)
}


 //버튼 이펙트
 function buttonImgEffect(target , imgName){
    var img = document.createElement("img");
    img.src = "../images/button/"+imgName
    img.style.width = "100%";
    img.style.height = "100%";
    img.style.position = "relative";
    img.style.top = "80%"
    img.style.opacity = 0.3;
    img.style.display = "none";
    // img.style.transform ="rotate(180deg)";
    target.appendChild(img);
}


// //  //백그라운드
 function rightBackImg(target ,num){
    var img = document.createElement("img");
    img.src = "../static/pic/song"+num+".png"
    img.style.width = "100%";
    img.style.height = "100%";
    img.style.position = "relative";
    img.style.opacity = 0.5;

    target.appendChild(img);
}


// 노트 뽑아오기 
function recordSaveBox(){
    for(i=0;i<noteSaveBox.length;i++){
        document.write("[")
        for(j=0;j<noteSaveBox[i].length;j++){
            var a = (j==noteSaveBox[i].length-1)?  "" : ", "
            document.write(noteSaveBox[i][j]+a)
        }
        document.write("],<br>")
    }
}