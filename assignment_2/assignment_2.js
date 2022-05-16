let av;
let oneg;
let twog;
let threeg;
let fourg;
let fiveg;
let sixg;
let seveng;
let nm;
let start;
let count;
let score = 0;
let scoreArray;
let counter = 0;
let sum = 0;
let highScore = 0;
let speed = 0;
function setup(){
    start = true;
    speed = -1;
    createCanvas(1600, 900);
    av=new Avatar(750, 800);
    nm=new Name();
    oneg=new Log(1600, 105, 118, 65, 0);
    twog=new Log(1600, 205, 118, 65, 0);
    threeg=new Log(0, 305, 118, 65, 0);
    fourg=new Log(1600, 405, 118, 65, 0);
    fiveg=new Log(1600, 505, 118, 65, 0);
    sixg=new Log(0, 605, 118, 65, 0);
    seveng=new Log(0, 705, 118, 65, 0);
    scoreArray=new Array(nm.getMaxNumberOfGames());
}

function draw(){
    if(score >= highScore) {
        highScore=score;
    }
    background(0, 104, 211);
    if(keyIsPressed) {
        if((key == ' ') && !start && !(counter == nm.getMaxNumberOfGames())) {
            start=true;
            sum=0;
            score=0;
            key=0;
        }
    }
    if(start) {
        drawLand();
        oneg.display();
        oneg.setXPos(oneg.getXPos() - (2 + speed));
        if(oneg.getXPos() <= 0) {
            oneg.setXPos(1600);
        }
        twog.display();
        twog.setXPos(twog.getXPos() - (3 + speed));
        if(twog.getXPos() <= 0) {
            twog.setXPos(1600);
        }
        threeg.display();
        threeg.setXPos(threeg.getXPos() + (3 + speed));
        if(threeg.getXPos() >= 1600) {
            threeg.setXPos(0);
        }
        fourg.display();
        fourg.setXPos(fourg.getXPos() - (3 + speed));
        if(fourg.getXPos() <= 0) {
            fourg.setXPos(1600);
        }
        fiveg.display();
        fiveg.setXPos(fiveg.getXPos() - (2 + speed));
        if(fiveg.getXPos() <= 0) {
            fiveg.setXPos(1600);
        }
        sixg.display();
        sixg.setXPos(sixg.getXPos() + (5 + speed));
        if(sixg.getXPos() >= 1600) {
            sixg.setXPos(0);
        }
        seveng.display();
        seveng.setXPos(seveng.getXPos() + (3 + speed));
        if(seveng.getXPos() >= 1600) {
            seveng.setXPos(0);
        }
        detectMoving();
        moveAvatar();
        av.display();
        nm.display(score, 675, 50);
    }
    else if(!start) {
        drawMenu();
    }
    detectLogCollision(oneg.getXPos(), oneg.getYPos() - 5);
    detectLogCollision(twog.getXPos(), twog.getYPos() - 5);
    detectLogCollision(threeg.getXPos(), threeg.getYPos() - 5);
    detectLogCollision(fourg.getXPos(), fourg.getYPos() - 5);
    detectLogCollision(fiveg.getXPos(), fiveg.getYPos() - 5);
    detectLogCollision(sixg.getXPos(), sixg.getYPos() - 5);
    detectLogCollision(seveng.getXPos(), seveng.getYPos() - 5);
}

function drawMenu(){
    if(counter < nm.getMaxNumberOfGames()) {
        background(124, 177, 255);
        textSize(100);
        text("Fail", 700, 100);
        textSize(60);
        text("Press space to (re)start!", 500, 200);
        for(let i = 0;i < scoreArray.length;i++) {
            textSize(40);
            text("Attempt " + (i + 1) + ":" + scoreArray[i], 500, 400 + (i * 50));
            text("Average of past " + counter + " attempt(s):" + (sum / counter), 900, 500);
            text("High score:" + highScore, 900, 450);
            text("Total score:" + sum, 900, 400);
        }
    }
    else {
        textSize(100);
        text("Finished!", 600, 100);
        textSize(60);
        text("Press space to exit", 500, 200);
        for(let i = 0;i < scoreArray.length;i++) {
            textSize(40);
            text("Attempt " + (i + 1) + ":" + scoreArray[i], 500, 400 + (i * 50));
            text("Average of past " + counter + " attempt(s):" + (sum / counter), 900, 500);
            text("High score:" + highScore, 900, 450);
            text("Total score:" + sum, 900, 400);
        }
        if(key == ' ') {
            exit();
        }
    }
}

function detectMoving(){
    if((av.getYCoord() >= 100) && (av.getYCoord() <= 700)) {
        if((av.getYCoord() == 300) || (av.getYCoord() == 700) && (av.getXCoord() <= 1500)) {
            av.setXCoord(av.getXCoord() + (3 + speed));
        }
    else if((av.getYCoord() == 600) && (av.getXCoord() <= 1500)) {
            av.setXCoord(av.getXCoord() + (5 + speed));
        }
    else if(((av.getYCoord() == 400) || (av.getYCoord() == 200)) && (av.getXCoord() >= 0)) {
            av.setXCoord(av.getXCoord() - (3 + speed));
        }
    else if(!(av.getXCoord() < 5)) {
            av.setXCoord(av.getXCoord() - (2 + speed));
        }
    }
}

function detectLogCollision(xPos, yPos){
    if(!(((av.getXCoord() > xPos - 50) && (av.getXCoord() < xPos + 300)) || ((av.getXCoord() > xPos - 850) && (av.getXCoord() < xPos - 550)) || ((av.getXCoord() > xPos + 750) && (av.getXCoord() < xPos + 1050)) || (av.getXCoord() > xPos - 1650) && (av.getXCoord() < xPos - 1350)) && (av.getYCoord() == yPos)) {
        start=false;
        scoreArray[counter]=score;
        counter+=1;
        av.setYCoord(800);
        for(let i = 0;i < scoreArray.length;i++) {
            sum+=scoreArray[i];
        }
        speed=-1;
    }
}

function drawLand(){
    noStroke();
    fill(0, 214, 58);
    rect(0, 0, width, 100);
    rect(0, height - 100, width, 100);
}

function moveAvatar(){
    if(keyIsPressed) {
        if(true) {
            if((keyCode == LEFT_ARROW) && !(av.getXCoord() < 5)) {
                av.setXCoord(av.getXCoord() - 100);
                keyCode=0;
            }
    else if((keyCode == RIGHT_ARROW) && !(av.getXCoord() > 1500)) {
                av.setXCoord(av.getXCoord() + 100);
                keyCode=0;
            }
    else if(keyCode == UP_ARROW) {
                av.setYCoord(av.getYCoord() - 100);
                keyCode=0;
            }
    else if((keyCode == DOWN_ARROW) && !(av.getYCoord() == 800)) {
                av.setYCoord(av.getYCoord() + 100);
                keyCode=0;
            }
        }
    }
}

class Avatar{
    constructor(xCoord, yCoord){
        this.xCoord = 0;
        this.yCoord = 0;
        if((xCoord >= 5) && (xCoord <= 1495)) {
            this.xCoord=xCoord;
        }
    else if(xCoord > 745) {
            this.xCoord=645;
        }
    else {
            this.xCoord=5;
        }
        if(yCoord < 0) {
            this.yCoord=800;
        }
    else {
            this.yCoord=yCoord;
        }
    }

    display(){
        fill(0, 178, 50);
        stroke(0);
        rect(this.xCoord + 10, this.yCoord + 10, 80, 80);
    }

    move(xCoord, yCoord){
        if((xCoord >= 5) && (xCoord <= 1495)) {
            this.xCoord=xCoord;
        }
    else if(xCoord > 1495) {
            this.xCoord=1495;
        }
    else {
            this.xCoord=5;
        }
        this.yCoord=yCoord;
    }

    getYCoord(){
        return this.yCoord;
    }

    getXCoord(){
        return this.xCoord;
    }

    setXCoord(xCoord){
        if((xCoord >= 5) && (xCoord <= 1495)) {
            this.xCoord=xCoord;
        }
    else if(xCoord > 1495) {
            this.xCoord=1495;
        }
    else {
            this.xCoord=5;
        }
    }

    setYCoord(yCoord){
        if(yCoord < 0) {
            this.yCoord=800;
            score+=10;
            speed+=1;
        }
    else {
            this.yCoord=yCoord;
        }
    }

}

class Log{
    constructor(xPos, yPos, logColorR, logColorG, logColorB){
        this.xPos = 0;
        this.yPos = 0;
        this.logColorR = 0;
        this.logColorG = 0;
        this.logColorB = 0;
        this.xPos=xPos;
        this.yPos=yPos;
        this.logColorR=logColorR;
        this.logColorG=logColorG;
        this.logColorB=logColorB;
    }

    display(){
        fill(this.logColorR, this.logColorG, this.logColorB);
        for(let i = -2;i < 2;i++) {
            rect(this.xPos + (800 * i), this.yPos, 300, 90);
        }
    }

    getYPos(){
        return this.yPos;
    }

    getXPos(){
        return this.xPos;
    }

    setXPos(xPos){
        this.xPos=xPos;
    }

    setYPos(yPos){
        this.yPos=yPos;
    }

}

class Name{
    constructor(){
        this.name = prompt("Please enter your name\n\n(max of 6 characters)", "John");
        this.numString = prompt("Welcome to frogger!\n\nPlease enter the number of games you would like to play: ", "3");
        this.maxNumberOfGames=parseInt(this.numString);
    }

    display(score, xPos, yPos){
        fill(0);
        textSize(40);
        if(this.name.length <= 6) text(this.name + "'s Score is:" + score, xPos, yPos);
    else text(this.name.substring(0, 6) + "'s Score is:" + score, xPos, yPos);
    }

    getName(){
        return this.name;
    }

    getMaxNumberOfGames(){
        return this.maxNumberOfGames;
    }

    setName(name){
        this.name=name;
    }

    setMaxNumberOfGames(maxNumberOfGames){
        this.maxNumberOfGames=maxNumberOfGames;
    }

}

