/* global $*/

// let title = "javaが使えました。"
// alert(title);
// $(document).ready(function(){
//   document.getElementsByClassName('element')[1].style.display = "none"
// })

const elements = document.getElementsByClassName('element').style.display = "none"
let len = elements.length;
console.log(len)

$(document).ready(function(){
  $('.jquery').on('click', function(){
    console.log('button clicked!');
    $(this).css('color','red');
  })
})

$(document).ready(function(){
  $('.ruby-btn').on('click', function(){
    console.log('Button clicked!');
   $('.ruby').removeClass();
  })
})


