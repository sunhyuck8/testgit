
class Bar{
 
    constructor(container, width, height, x, y, bg, targetH){ 

        this.container=container;
        this.width=width;
        this.height=height;
        this.x=x;
        this.y=y;
        this.bg=bg;
        this.a=0.1; //비율계수
        this.targetH=targetH;

        this.div = document.createElement("div");
        //크기
        this.div.style.width=this.width+"px";
        this.div.style.height=this.height+"px";
        //위치 
        this.div.style.position="absolute";
        this.div.style.left=this.x+"px";
        this.div.style.top=this.y+"px";
        //배경색 
        this.div.style.background=this.bg;  
        //테두리 
        this.div.style.border="1px solid black";
        //box모델의 크기에 영향을 주지말기!!
        this.div.style.boxSizing="border-box";
        
        //부모요소에 부착!!
        this.container.appendChild(this.div);
    }

    
    render(){//화면에 보여질 처리 = 게임 분야에서는 렌더링

        this.div.style.height=parseFloat(this.div.style.height)+this.a*(this.targetH-parseFloat(this.div.style.height)) +"px";
        
        this.div.innerText=this.div.style.height;
    }
}