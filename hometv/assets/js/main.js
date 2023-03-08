$(function () {
  var SCREEN_WIDTH = $(document).width();
  var SCREEN_HEIGHT = $(document).height();
  var BOX_SIZE_WIDTH = (SCREEN_WIDTH - 10) / 2;
  var BOX_SIZE_HEIGHT = 300;
  console.log("获取屏幕数据width,height", SCREEN_WIDTH, SCREEN_HEIGHT);
  $.ajax({
    url: "./assets/data.json", //json文件位置，文件名
    type: "GET", //请求方式为get
    dataType: "json", //返回数据格式为json
    async: false,
    success: function (arr) {
      //请求成功完成后要执行的方法
      var html_head = "<ul>";
      var html_tail = "</ul>";
      var html_content = "";
      var count = arr.length;
      var height_count = Math.ceil(count / 2);
      BOX_SIZE_HEIGHT = (SCREEN_HEIGHT - 10) / height_count;
      //渲染
      $.each(arr, function (index, value) {
        html_content +=
          '<a href="' +
          value.link +
          '" target="_blank">' +
          '<li style="width:' +
          BOX_SIZE_WIDTH +
          "px;height:" +
          BOX_SIZE_HEIGHT +
          "px;line-height:" +
          BOX_SIZE_HEIGHT +
          'px;">' +
          value.name +
          "</li></a>";
      });
      var html_str = html_head + html_content + html_tail;
      $("#box").html(html_str);
    },
  });
});
