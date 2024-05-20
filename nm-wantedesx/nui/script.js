$(document).ready(function(){

    $('.main').fadeOut(1)
    $('.background').fadeOut(1)

    window.addEventListener('message', function(event){
    var action = event.data.action;
    switch(action) {
        case "openNormal":
            $(".main").fadeIn(1000)
            document.querySelector('.date').textContent = JSON.stringify(event.data.date);
            document.querySelector('.reason').textContent = event.data.reason;
            document.querySelector('.description').textContent = event.data.description;
            document.querySelector('.reward_amount').textContent = '$' + event.data.reward;
            $(".face").attr("src", event.data.image);
            break;
        case "openNormalEditor":
            $(".background").fadeIn(1000)
            break;
        }
    });

    
    $(".confirm_button").click(function() { 
        $.post('https://nm-wanted/updateData', JSON.stringify({
            dateData : $('.date_input').val(),
            reasonData : $('.reason_input').val(),
            descData : $('.desc_input').val(),
            rewardData : $('.reward_input').val(),
            imageData : $('.img_input').val(),
        }));
        $('.main').fadeOut(1000)
        $(".background").fadeOut(1500)
        $.post('https://nm-wanted/exit', JSON.stringify({}));
      });

    $(document).on('keydown', function() {
        switch(event.keyCode) {
            case 27: // ESCAPE
            $('.main').fadeOut(1000)
            $(".background").fadeOut(1000)
            $.post('https://nm-wanted/exit', JSON.stringify({}));
        }
    });

})
