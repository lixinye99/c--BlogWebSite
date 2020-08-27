$(document).ready(function () {
    var selectd;
    var readytags = $("#mytag").text().split(',');
    if (readytags != null && readytags != "") {
        if (readytags.length == 6) {
            $(".btn-addtags").hide()
        }
        for (var i = 0; i < readytags.length-1; i++) {
            var addtag = "<a class='btn btn-light btn-sm tag-input mr-2' href='#' name='tag'>" + readytags[i] + "<span class='ml-2' id='deletetag'> ✗</span></a>"        
            $("#add_tag_btn").before(addtag);              
        }
    }
    

    $("#sort-nav").children().hover(function () {
        $("#sort-nav").children().removeClass("active")
        $(this).addClass("active")
        var childrena = $(this).children("a")
        selectd = childrena.attr("href")
        $(".tab-pane").removeClass("active", "in")
        $(selectd).addClass("active in")      
    }, function () {
    });

    $(".badge-tag").click(function () {            
        var name = $(".btn-sm").text()
        var choosetags = $(this).text()
        var nowhave = $("#mytag").text()
        if (name.includes(choosetags))
            return;        
        if (nowhave == "") {
            $("#mytag").html(choosetags+",")
        } else {
            $("#mytag").html(nowhave + choosetags + ",")
        }        
        var add = "<a class='btn btn-light btn-sm tag-input mr-2' href='#' name='tag'>" + choosetags + "<span class='ml-2' id='deletetag'> ✗</span></a>"          
        $("#add_tag_btn").before(add)
        var num = $(".btn-sm").length
        $(".tags-left").text(5 - num)
        if (num == 5) {
            $(".btn-addtags").hide()
            return;
        }
    });

    $("body").on("click", "#deletetag", function () {
        var text = $(this).parent()[0].text.split(' ')[0] + ","        
        $(this).parent()[0].remove()       
                
        $("#mytag").text($("#mytag").text().replace(text,""))
        num = $(".btn-sm").length
        $(".tags-left").text(5 - num)
        if (num != 5) {
            $(".btn-addtags").show()
            return;
        }
    });

    $("body").on('click', '[data-stopPropagation]', function (e) {
        e.stopPropagation();
    });

    $("#goback").click(function () {
        $("#closefile").click()      
    });

    $("#closefile").click(function () {
        var first_parent = $(this).parent().attr('class')
        $("." + first_parent).css("display", "none")
    });
 });


