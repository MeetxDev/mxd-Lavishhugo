$(document).ready(function () {
    window.addEventListener("message", function (event) {
        if (event.data.action == 'open') {
            updateT1(event.data.t1);
			updateT1K(event.data.t1k);
            updateT2(event.data.t2)
            updateT2K(event.data.t2k)
            $(".infoContainer").css("display", "block")
        };
        if (event.data.action == 'close') {
            if($('.logoContainer').css('display') === 'none')
            {
                $(".logoContainer").css("display", "")
                $(".infoContainer").css("display", "")
            }
            else
            {
                $(".logoContainer").css("display", "none")
                $(".infoContainer").css("display", "none")
            }
        };
    });

});

function myFunction() {
    if($('.logoContainer').css('display') === 'none')
    {
        $(".logoContainer").css("display", "")
        $(".infoContainer").css("display", "")
    }
    else
    {
        $(".logoContainer").css("display", "none")
        $(".infoContainer").css("display", "none")
    }
}

function updateT1(name) {
    document.getElementById("team1").innerHTML = name;
}


function updateT2(name2) {
    document.getElementById("team2").innerHTML = name2;
}

function updateT1K(kills) {
	if (kills > 0) $kills = kills;
	    $("#statBox-Kills").html(` ${kills}`);
}

function updateT2K(tote) {
    if (tote > 0) $tote = tote;
        $("#statBox-Deaths").html(` ${tote}`);		
}