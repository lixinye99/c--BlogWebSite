<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlogChange.aspx.cs" Inherits="Views_Blog_BlogChange" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<link rel="stylesheet" type="text/css" href="/Common/bootstrap.min.css">
<script type="text/javascript" src="/Common/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/Common/bootstrap.min.js"></script>
<script type="text/javascript" src="/Scripts/Blog/editormd.min.js"></script>    
<script type="text/javascript" src="/Scripts/Blog/blogedit.js"></script>
<link type="text/css" rel="stylesheet" href="/Content/Blog/RichTextCss/editormd.css" />
<link rel="stylesheet" type="text/css" href="/Content/Blog/BlogEdit.css">
<body>
    <form id="form1" runat="server">      
        <nav class="navbar navbar-default ">  
            <div class="container">            
                <div class="edit-nav">
                    <a class="Blog-name" href="../Index/Index.html">MyBlog</a>
                    <div class="h5 mb-0 text-secondary">修改文章</div>                  
                    <div class="div-choose">
                        <asp:Button ID="chooseType" runat="server" Text="修改文章 ▾" class="btn btn-primary dropdown-toggle dropdown-toggle" data-toggle="dropdown"/>
                        <div class="dropdown-menu div-publish">                        
                            <div class="px-4 py-3"><label class="d-block">文章主要类型</label>
                            <select runat="server" id="selecttype" class="form-control" data-stopPropagation="true">
                                <option>前端</option>
                                <option>后端</option>
                                <option>移动端</option>
                                <option>数据</option>
                                <option>运维</option>
                                <option>人工</option>
                                <option>工具</option>
                                <option>其他</option>
                            </select>
                            <asp:Button ID="publish" runat="server" Text="确认修改" class="btn btn-primary btn-block" OnClick="Change_Click" />
                            </div>                           
                        </div>
                    </div>
                </div> 
            </div>                             
        </nav>
        
        <div class="container">         
            <div class="row">                
                <asp:TextBox ID="title" runat="server" placeholder="请输入标题" class="title"></asp:TextBox>
            </div>
            <div class="row">
                <div class="tag-dropdown dropdown d-inline-block">
                    <textarea runat="server" id="mytag" style="display:none"></textarea>
                    <asp:Button ID="add_tag_btn" runat="server" Text="+ 添加标签" class="btn-addtags" data-toggle="dropdown" aria-expanded="false"/>
                    <div class="dropdown-menu" style="min-width: 480px;" aria-labelledby="add-tag-btn">
                        <h6 class="dropdown-header" id="tagDlgHeader">
                            还可添加 
                            <span class="tags-left">5</span> 
                            个标签
                            <span class="float-right">找不到标签？<a href="#" onclick="create_tag()" id="createTag">创建</a></span>
                        </h6>
                        <div class="px-4">
                            <input type="search" class="form-control" id="searchTag" autocomplete="off" placeholder="搜索标签" />
                        </div>                        
                        <ul class="nav nav-tabs px-4 font-size-14" id="sort-nav">
                            <li class="active" id="first"><a data-toggle="tab" href="#tag-panel-1">前端</a></li>
                            <li><a data-toggle="tab" href="#tag-panel-2">后端</a></li>
                            <li><a data-toggle="tab" href="#tag-panel-3">移动端</a></li>
                            <li><a data-toggle="tab" href="#tag-panel-4">数据库</a></li>
                            <li><a data-toggle="tab" href="#tag-panel-5">运维</a></li>
                            <li><a data-toggle="tab" href="#tag-panel-6">人工智能</a></li>
                            <li><a data-toggle="tab" href="#tag-panel-7">工具</a></li>
                            <li><a data-toggle="tab" href="#tag-panel-8">其他</a></li>
                        </ul>
                        <div class="tab-content px-4 mb-2">
                            <div class="tab-pane fade in active m-n1" id="tag-panel-1"><a class="badge-tag m-1" href="#" >javascript</a><a class="badge-tag m-1" href="#" >前端</a><a class="badge-tag m-1" href="#" >vue.js</a><a class="badge-tag m-1" href="#" >css</a><a class="badge-tag m-1" href="#" >html</a><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/102/500/1025005915-54cb538538eea_small"/>html5</a><a class="badge-tag m-1" href="#" >node.js</a><a class="badge-tag m-1" href="#" >react.js</a><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/745/445/745445564-54cb540ec31aa_small"/>jquery</a><a class="badge-tag m-1" href="#" >css3</a><a class="badge-tag m-1" href="#" >es6</a><a class="badge-tag m-1" href="#" >typescript</a><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/541/659/541659371-5df9fc6ddfc06_small"/>chrome</a><a class="badge-tag m-1" href="#" >npm</a><a class="badge-tag m-1" href="#" >bootstrap</a><a class="badge-tag m-1" href="#" >sass</a><a class="badge-tag m-1" href="#" >less</a><a class="badge-tag m-1" href="#" >chrome-devtools</a><a class="badge-tag m-1" href="#" >angular</a><a class="badge-tag m-1" href="#" >firefox</a><a class="badge-tag m-1" href="#" >coffeescript</a><a class="badge-tag m-1" href="#" >safari</a><a class="badge-tag m-1" href="#" >postman</a><a class="badge-tag m-1" href="#" >postcss</a><a class="badge-tag m-1" href="#" >fiddler</a><a class="badge-tag m-1" href="#" >yarn</a><a class="badge-tag m-1" href="#" >webkit</a><a class="badge-tag m-1" href="#" >firebug</a><a class="badge-tag m-1" href="#" >edge</a></div>
                            <div class="tab-pane fade m-n1" id="tag-panel-2"><a class="badge-tag m-1" href="#" >php</a><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/868/271/868271510-54cb382abb7a1_small"/>java</a><a class="badge-tag m-1" href="#" >node.js</a><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/252/177/2521771040-54cb53b372821_small"/>python</a><a class="badge-tag m-1" href="#" >c++</a><a class="badge-tag m-1" href="#" >c</a><a class="badge-tag m-1" href="#" >golang</a><a class="badge-tag m-1" href="#" >spring</a><a class="badge-tag m-1" href="#" >后端</a><a class="badge-tag m-1" href="#" >springboot</a><a class="badge-tag m-1" href="#" >django</a><a class="badge-tag m-1" href="#" >flask</a><a class="badge-tag m-1" href="#" >c#</a><a class="badge-tag m-1" href="#" >swoole</a><a class="badge-tag m-1" href="#" >ruby</a><a class="badge-tag m-1" href="#" >asp.net</a><a class="badge-tag m-1" href="#" >ruby-on-rails</a><a class="badge-tag m-1" href="#" >scala</a><a class="badge-tag m-1" href="#" >rust</a><a class="badge-tag m-1" href="#" >lavarel</a><a class="badge-tag m-1" href="#" >爬虫</a></div>
                            <div class="tab-pane fade m-n1" id="tag-panel-3"><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/868/271/868271510-54cb382abb7a1_small"/>java</a><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/287/281/287281599-5a263edae47e9_small"/>android</a><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/300/191/3001919899-5488009eb028c_small"/>ios</a><a class="badge-tag m-1" href="#" >objective-c</a><a class="badge-tag m-1" href="#" >小程序</a><a class="badge-tag m-1" href="#" >swift</a><a class="badge-tag m-1" href="#" >react-native</a><a class="badge-tag m-1" href="#" >xcode</a><a class="badge-tag m-1" href="#" >android-studio</a><a class="badge-tag m-1" href="#" >webapp</a><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/362/535/362535569-5cbf21e81c4e0_small"/>flutter</a><a class="badge-tag m-1" href="#" >kotlin</a></div>
                            <div class="tab-pane fade m-n1" id="tag-panel-4"><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/949/844/9498447-54cb56e325a72_small"/>mysql</a><a class="badge-tag m-1" href="#" >redis</a><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/183/816/1838168166-54cb5552ef5de_small"/>mongodb</a><a class="badge-tag m-1" href="#" >sql</a><a class="badge-tag m-1" href="#" >数据库</a><a class="badge-tag m-1" href="#" >json</a><a class="badge-tag m-1" href="#" >elasticsearch</a><a class="badge-tag m-1" href="#" >nosql</a><a class="badge-tag m-1" href="#" >memcached</a><a class="badge-tag m-1" href="#" >postgresql</a><a class="badge-tag m-1" href="#" >sqlite</a><a class="badge-tag m-1" href="#" >mariadb</a></div>
                            <div class="tab-pane fade m-n1" id="tag-panel-5"><a class="badge-tag m-1" href="#" >linux</a><a class="badge-tag m-1" href="#" >nginx</a><a class="badge-tag m-1" href="#" >docker</a><a class="badge-tag m-1" href="#" >apache</a><a class="badge-tag m-1" href="#" >centos</a><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/335/109/3351090335-569f0f26a2a86_small"/>ubuntu</a><a class="badge-tag m-1" href="#" >服务器</a><a class="badge-tag m-1" href="#" >运维</a><a class="badge-tag m-1" href="#" >负载均衡</a><a class="badge-tag m-1" href="#" >ssh</a><a class="badge-tag m-1" href="#" >容器</a><a class="badge-tag m-1" href="#" >vagrant</a><a class="badge-tag m-1" href="#" >jenkins</a><a class="badge-tag m-1" href="#" >devops</a><a class="badge-tag m-1" href="#" >debian</a><a class="badge-tag m-1" href="#" >fabric</a></div>
                            <div class="tab-pane fade m-n1" id="tag-panel-6"><a class="badge-tag m-1" href="#" >算法</a><a class="badge-tag m-1" href="#" >机器学习</a><a class="badge-tag m-1" href="#" >人工智能</a><a class="badge-tag m-1" href="#" >深度学习</a><a class="badge-tag m-1" href="#" >数据挖掘</a><a class="badge-tag m-1" href="#" >tensorflow</a><a class="badge-tag m-1" href="#" >神经网络</a><a class="badge-tag m-1" href="#" >图像识别</a><a class="badge-tag m-1" href="#" >人脸识别</a><a class="badge-tag m-1" href="#" >自然语言处理</a><a class="badge-tag m-1" href="#" >机器人</a><a class="badge-tag m-1" href="#" >pytorch</a><a class="badge-tag m-1" href="#" >自动驾驶</a></div>
                            <div class="tab-pane fade m-n1" id="tag-panel-7"><a class="badge-tag m-1" href="#" >git</a><a class="badge-tag m-1" href="#" >github</a><a class="badge-tag m-1" href="#" >macos</a><a class="badge-tag m-1" href="#" >visual-studio-code</a><a class="badge-tag m-1" href="#" >windows</a><a class="badge-tag m-1" href="#" >vim</a><a class="badge-tag m-1" href="#" >sublime-text</a><a class="badge-tag m-1" href="#" >intellij-idea</a><a class="badge-tag m-1" href="#" >phpstorm</a><a class="badge-tag m-1" href="#" >eclipse</a><a class="badge-tag m-1" href="#" >webstorm</a><a class="badge-tag m-1" href="#" >编辑器</a><a class="badge-tag m-1" href="#" >svn</a><a class="badge-tag m-1" href="#" >visual-studio</a><a class="badge-tag m-1" href="#" >pycharm</a><a class="badge-tag m-1" href="#" >emacs</a></div>
                            <div class="tab-pane fade m-n1" id="tag-panel-8"><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/187/562/1875620466-5df9fe086a004_small"/>程序员</a><a class="badge-tag m-1" href="#" >http</a><a class="badge-tag m-1" href="#" >segmentfault</a><a class="badge-tag m-1" href="#" >https</a><a class="badge-tag m-1" href="#" >安全</a><a class="badge-tag m-1" href="#" >websocket</a><a class="badge-tag m-1" href="#" >restful</a><a class="badge-tag m-1" href="#" >xss</a><a class="badge-tag m-1" href="#" >区块链</a><a class="badge-tag m-1" href="#" >csrf</a><a class="badge-tag m-1" href="#" >graphql</a><a class="badge-tag m-1" href="#" >rpc</a><a class="badge-tag m-1" href="#" ><img src="https://avatar-static.segmentfault.com/272/250/2722506514-5a55e1864a41a_small"/>比特币</a><a class="badge-tag m-1" href="#" >以太坊</a><a class="badge-tag m-1" href="#" >udp</a><a class="badge-tag m-1" href="#" >智能合约</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="test-editor">
                    <textarea id="content" runat="server" style="display:none;" autofocus="autofocus"></textarea>
                </div>      
                <div class="editormd-dialog" style="display:none">
                    <div class="editormd-dialog-header" style="cursor: move;"><strong class="editormd-dialog-title">添加图片</strong>                        
                    </div>
                    <a href="javascript:;" class="fa fa-close editormd-dialog-close" id="closefile" ></a>                    
                    <div class="editormd-dialog-container">                        
                        <div class="choosefile">
                            <a href="javascript:;" class="file">选择文件
                            <asp:FileUpload ID="ful" runat="server" onchange="getImgURL(this)"/>                      
                            </a>
                            <input type="text" class="fileurl" id="fileurl"/>
                        </div>
                        <br/>
                        <div class="choosefile-1">
                            <label>图片描述</label>
                            <input runat="server" id="imgdes" type="text" class="fileurl-1"/>
                        </div>
                        <div class="choosefile-1">
                            <label>图片链接</label>
                            <input runat="server" type="text" id="imglink" value="https://" class="fileurl-1"/>    
                        </div>
                        <div class="editormd-dialog-footer">
                        <asp:Button ID="Button1" type="button" runat="server" Text="确定" OnClick="Button1_Click" style="text-align:center" />
                        <button id="goback" class="editormd-btn editormd-cancel-btn">取消</button>
                        </div>
                    </div>
                    <asp:Literal ID="ltaMsg" runat="server"></asp:Literal>
                </div>                

                <script>                    
                    function getImgURL(node) {
                        var url = document.getElementById("fileurl")
                        url.value = node.value
                    }                    
                </script>
                
                <script type="text/javascript">
                    $(function() {
                        var editor = editormd("test-editor", {
                            width: "100%",
                            height: "500",
                            path: "/RichText/lib/",
                            delay: 0,
                            placeholder: "开始写你的博客吧！！！",
                            emoji: true,
                            taskList: true,
                            tocm: true,         
                            tex: true,
                            flowChart: true,             
                            sequenceDiagram: true,
                            imageUpload: true,
                            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"]
                        });
                    });
                </script>
            </div>    
         </div>       
    </form>
</html>
