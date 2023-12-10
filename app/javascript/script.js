/* global $*/

// let title = "javaが使えました。"
// alert(title);
// $(document).ready(function(){
//   document.getElementsByClassName('element')[1].style.display = "none"
// })

// const elements = document.getElementsByClassName('elem').style.display = "none"
// let len = elements.length;
// console.log(len)

// const elements = document.getElementsByClassName('elem')
// for(let i = 0; i < elements.length; i++){
//   elements[i].style.display = "none";
// }


// $(document).ready(function(){
//   $('.jquery').on('click', function(){
//     console.log('button clicked!');
//     $(this).css('color','red');
//   })
// })

// $(document).ready(function(){
//   $('.ruby-btn').on('click', function(){
//     console.log('Button clicked!');
//   $('.ruby').removeClass();
//   })
// })

// $(document).ready(function(){
//   $('.ruby-btn').on('click', function(){
//     console.log('Button clicked!');
//   $('#ruby').removeClass('inactive');
//   })
// })

$(document).ready(function(){
  $('.ruby-btn').on('click', function(){
    console.log('button clicked!');
    $('#ruby').toggle();
  })
})

$(document).ready(function(){
  $('.santa_hat-btn').on('click', function(){
    console.log('button clicked!');
    $('#santa_hat').toggle();
  })
})

$(document).ready(function(){
  $('.necktie-btn').on('click', function(){
    console.log('button clicked!');
    $('#necktie').toggle();
  })
})

$(document).ready(function(){
  $('.sunglasses-btn').on('click', function(){
    console.log('button clicked!');
    $('#sunglasses').toggle();
  })
})

$(document).ready(function(){
  setInterval(function(){
    $("#arrow2").animate({
      bottom: "-=55px"}, 1000);
    $("#arrow2").animate({
      bottom: "+=55px"}, 1000);
  }, 1000)
})

// $(document).ready(function(){
//   setInterval(function(){
//     $(".move-btn").animate({
//     bottom: "-=100px"}, 1000)
//   })
// })

$(document).ready(function(){
  setInterval(function(){
    $("#test-btn").animate({
      right: "+=90%"}, 3000);
    $("#test-btn").animate({
      right: "-=90%"}, 3000);
  }, 1000)
})

$(document).ready(function(){
  setInterval(function(){
    $("#moving-text").animate({
      right: "+=105%"}, 3000);
    $("#moving-text").hide(3000);
    $("#moving-text").animate({
      right: "-=105%"});
    $("#moving-text").show(3000);
  }, 1000)
})

// $(document).ready(function(){
//   $("#moving-box").on('click', function(){
//     // $("#moving-box").hide()
//     $("#moving-box").animate({
//       right: "+=500px"}, 1000)
//   })
// })

// canvas

// if (typeof paper.getContext === 'undefined'){
//   return;
// }

window.onload = function(){
  const paper = document.getElementById("paper");
  const context = paper.getContext("2d");
  paper.width = 400;
  paper.height = 800;
  
  // 四角形
  context.fillStyle = '#429955';
  context.fillRect(0, 0, 100, 100);
  context.clearRect(100, 100, 20, 20);
  
  // 重なる四角形
  context.fillStyle = 'rgba(0, 0, 200, 0.5)';
  context.fillRect(50, 50, 80, 80);
  
  // 線
  context.beginPath();
  context.moveTo(240, 80);
  context.lineTo(320, 160);
  context.strokeStyle = '#420000';
  context.stroke();
  
  // 三角形
  context.beginPath();
  context.moveTo(320, 160);
  context.lineTo(320, 320);
  context.lineTo(240, 320);
  context.fillStyle = '#123456';
  context.fill();
  // 円
  context.beginPath();
  context.moveTo(0, 0);
  context.arc(60, 200, 50, 0, Math.PI*2, false);
  context.fillStyle = '#ff0000';
  context.fill();
  
  // スマイリー
  context.beginPath();
  context.arc(50, 300, 30, 0, Math.PI*2, true);
  // 口
  context.moveTo(25, 300);
  context.arc(50, 300, 25, 0, Math.PI, false);
  // 左目
  context.moveTo(32, 285);
  context.arc(32, 285, 4, 0, Math.PI*2, true);
  // 右目
  context.moveTo(68, 285);
  context.arc(68, 285, 4, 0, Math.PI*2, true);
  context.stroke();
  
  // 欠けた円
  context.beginPath();
  context.arc(50, 372, 40, 0, Math.PI+(Math.PI*7)/2, true);
  context.stroke();
  
  // 太い線
  context.beginPath();
  context.moveTo(100, 150);
  context.lineTo(170, 270);
  context.lineWidth = 20;
  context.stroke();
  
  // 文章
  context.beginPath();
  context.font = '48px serif';
  context.fillText("Hello World", 20, 50);
  

  function loop(){
    // キャンバスの大きさ設定
    // x軸の位置
    let x = 0;
    let xx = 100;
    // 移動速度
    let speed = 2;
    const w = paper.width;
    (function render() {
    // 1. 要素を削除（キャンバス上の図形を削除）
    context.clearRect(0, 400, w, 100);
    context.clearRect(0, 500, w, 150);
    // 2. 要素を描画
    context.beginPath();
    context.arc(x, 450, 50, 0, 2*Math.PI, false);
    context.fillStyle = '#ff0000';
    context.fill();
    // 青い箱
    context.clearRect(0, 600, w, 50);
    context.fillStyle = "#2222ff";
    context.fillRect(xx, 600, 50, 50);
    // 言葉
    context.font = '28px serif';
    context.fillText("Hello!", xx, 550);
    
    // 3. 要素を動かす
    if (x > paper.width + 50) {
    x = -50;
    } else {
    x += speed;
    }
    
    if (xx < -70) {
    xx = paper.width + 50;
    } else {
    xx -= speed;
    }
    
    requestAnimationFrame(render);
    })();
  } loop();
  
};
  
  
  


// $(document).ready(function(){
//   function loop() {
//     var paper  = document.getElementById('paper');
//     if (typeof paper.getContext === 'undefined') {return;}
//     var context = paper.getContext('2d');
//     // キャンバスの大きさ設定
//     // paper.width = 400;
//     // paper.height = 200;
//     // var w = paper.width;
//     // var h = paper.height;
//     // x軸の位置
//     var x = 0;
//     // 移動速度
//     var speed = 2;
//     (function render() {
//     // 1. 要素を削除（キャンバス上の図形を削除）
//     // context.clearRect(0, 0, w, h);
//     // 2. 要素を描画
//     context.beginPath();
//     context.arc(x, 150, 50, 0, 2*Math.PI, false);
//     context.fillStyle = '#ff0000';
//     context.fill();
//     // 3. 要素を動かす
//     if (x > paper.width + 50) {
//     x = -50;
//     } else {
//     x += speed;
//     }
//     requestAnimationFrame(render);
//     })();
//   }
// loop();
// })