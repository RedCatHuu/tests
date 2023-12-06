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