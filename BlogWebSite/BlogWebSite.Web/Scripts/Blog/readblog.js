$(document).ready(function () {
    $(".goodorcollect").click(function () {
        var str = $(this).children("span").eq(0).text();

        if (str == "赞") {    
            var tag = document.getElementById("zan");
            var count = parseInt(tag.children[2].innerText) + 1
            $.ajax({
                url: "/Views/Blog/ReadBlog.aspx/updatelikeviews",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                data: '{str:"赞",count:"' + count+'"}',
                success: function () {
                    var tag = document.getElementById("zan");
                    tag.children[1].innerText = "已赞"
                    tag.children[2].innerText = parseInt(tag.children[2].innerText) + 1
                    tag.style.color = "white"
                    tag.style.backgroundColor = "#00965e"
                },
                error: function () {
                    alert("兄弟，点赞失败了，要不等下试试!")
                }
            });
        } else if (str == "收藏") {
            var tag = document.getElementById("shouchang");
            var count = parseInt(tag.children[2].innerText) + 1
            $.ajax({
                url: "/Views/Blog/ReadBlog.aspx/updatecollectviews",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                data: '{str:"收藏",count:"' + count + '"}',
                success: function () {
                    var tag = document.getElementById("shouchang");
                    tag.children[1].innerText = "已收藏"
                    tag.children[2].innerText = parseInt(tag.children[2].innerText) + 1
                    tag.style.color = "white"
                    tag.style.backgroundColor = "#6c757d"
                },
                error: function () {
                    alert("兄弟，收藏失败了，要不等下试试!")
                }
            });
        } else if (str == "已赞") {
            var tag = document.getElementById("zan");
            var count = parseInt(tag.children[2].innerText) - 1
            $.ajax({
                url: "/Views/Blog/ReadBlog.aspx/updatelikeviews",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                data: '{str:"已赞",count:"' + count + '"}',
                success: function () {
                    var tag = document.getElementById("zan");
                    tag.children[1].innerText = "赞"
                    tag.children[2].innerText = parseInt(tag.children[2].innerText) - 1
                    tag.style.color = "#00965e"
                    tag.style.backgroundColor = "white"
                },
                error: function () {
                    alert("兄弟，取消点赞失败了，要不等下试试!")
                }
            }); 
        } else if (str == "已收藏") {
            var tag = document.getElementById("shouchang");
            var count = parseInt(tag.children[2].innerText) - 1
            $.ajax({
                url: "/Views/Blog/ReadBlog.aspx/updatecollectviews",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                data: '{str:"已收藏",count:"' + count + '"}',
                success: function () {
                    var tag = document.getElementById("shouchang");
                    tag.children[1].innerText = "收藏"
                    tag.children[2].innerText = parseInt(tag.children[2].innerText) - 1
                    tag.style.color = "#6c757d"
                    tag.style.backgroundColor = "white"
                },
                error: function () {
                    alert("兄弟，取消收藏失败了，要不等下试试!")
                }
            });

        }
    });
    $(".concernwriter").click(function () {
        var status = $(this).text();
        if (status == "关注作者") {
            $.ajax({
                url: "/Views/Blog/ReadBlog.aspx/followorcancel",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                data: '{str:"关注作者"}',
                success: function () {
                    var tag = document.getElementById("follow");
                    tag.innerText = "取消关注"
                },
                error: function () {
                    alert("兄弟，关注失败了，要不等下试试!")
                }
            });
        } else {
            $.ajax({
                url: "/Views/Blog/ReadBlog.aspx/followorcancel",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                data: '{str:"取消关注"}',
                success: function () {
                    var tag = document.getElementById("follow");
                    tag.innerText = "关注作者"
                },
                error: function () {
                    alert("兄弟，取消关注失败了，要不等下试试!")
                }
            });
        }
    });

});


