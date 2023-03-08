//鼠标静止
let isMove = false,
  timer = null,
  changeHLTimer = null,
  togSec = 3000,
  stopTimeStamp = new Date().getTime(),
  ID_ARR = [],
  DATA_ARR = [];
window.onmousemove = function () {
  isMove = true;
  clearTimeout(timer);
  timer = setTimeout(function () {
    isMove = false;
    stopTimeStamp = new Date().getTime();
  }, 200);
};
//执行高亮事件 a/b+c=循环时长
function doHL(id_val) {
  //某个变亮,整体变暗 a动画时长
  $("#" + id_val)
    .siblings() //被选元素的所有同级元素
    .stop()
    .fadeTo(500, 0.4);
  $("#" + id_val)
    .stop()
    .fadeTo(500, 1);
  //持续 b时间
  setTimeout(function () {
    //恢复 所有变亮 c动画时长
    $("#" + id_val)
      .stop()
      .fadeTo(500, 0.4);
  }, 2500);
}
//监听鼠标,触发高亮切换
function listenChangeHL(id_arr) {
  changeHLTimer = setInterval(function () {
    now = new Date().getTime();
    dif = now - stopTimeStamp;
    if (!isMove && dif > togSec) {
      var rand_id = id_arr[Math.floor(Math.random() * id_arr.length)];
      // console.log("change hightlight", rand_id);
      doHL(rand_id);
      stopTimeStamp = new Date().getTime();
    }
  }, 1000);
}
function stopChangeHL() {
  clearInterval(changeHLTimer); //当点击停止按钮时，清除时间函数。
  changeHLTimer = null;
}
$(function () {
  //加载数据
  var IMG_SIZE = 120;
  var BOX_SIZE = IMG_SIZE + 1; //间隔+图片宽度
  var SCREEN_WIDTH = $(document).width();
  var SCREEN_HEIGHT = $(document).height();
  var WIDTH_YU = SCREEN_WIDTH % BOX_SIZE; //取余
  console.log(
    "获取屏幕数据imgsize,width,height,width_yu",
    IMG_SIZE,
    SCREEN_WIDTH,
    SCREEN_HEIGHT,
    WIDTH_YU
  );
  var row_num = Math.floor(SCREEN_WIDTH / BOX_SIZE);
  var col_num = Math.floor(SCREEN_HEIGHT / BOX_SIZE);
  var rand_num = row_num * col_num;
  console.log("计算屏幕占用数量row,col,rand", row_num, col_num, rand_num);
  //计算增量
  var PER_IMG_ADD = WIDTH_YU / row_num;
  var NEW_IMG_SIZE = Math.floor(IMG_SIZE + PER_IMG_ADD * 2);
  var NEW_BOX_SIZE = NEW_IMG_SIZE + 1;
  console.log("[重置]新图片尺寸", NEW_IMG_SIZE);
  var new_row_num = Math.floor(SCREEN_WIDTH / NEW_BOX_SIZE);
  var new_col_num = Math.floor(SCREEN_HEIGHT / NEW_BOX_SIZE);
  var new_rand_num = new_row_num * new_col_num;
  console.log(
    "[重置]计算屏幕占用数量row,col,rand",
    new_row_num,
    new_col_num,
    new_rand_num
  );
  $.ajax({
    url: "./data/result/data_res.json", //json文件位置，文件名
    type: "GET", //请求方式为get
    dataType: "json", //返回数据格式为json
    async: false,
    success: function (arr) {
      //请求成功完成后要执行的方法
      var html_head = "<ul>";
      var html_tail = "</ul>";
      var html_content = "";
      //取随机N个
      var rand_data = [];
      for (var i = 0; i < new_rand_num; i++) {
        var ran = Math.floor(Math.random() * (arr.length - i));
        rand_data.push(arr[ran]);
        arr[ran] = arr[arr.length - i - 1];
      }
      var id_arr = [];
      DATA_ARR = rand_data;
      //渲染
      $.each(rand_data, function (index, value) {
        id_arr.push(value.id);
        html_content +=
          '<li id="' +
          value.id +
          '" style="width:' +
          NEW_IMG_SIZE +
          "px;height:" +
          NEW_IMG_SIZE +
          'px"><a href="' +
          value.link +
          '" target="_blank" title="[' +
          value.name +
          "] 签约于" +
          value.date +
          "  寄语:" +
          value.title +
          '"><img src="assets/avatar/' +
          value.avatar +
          '" width="' +
          NEW_IMG_SIZE +
          '" height="' +
          NEW_IMG_SIZE +
          '" /></a></li>';
      });
      ID_ARR = id_arr;
      console.log("随机取到的数据", id_arr);
      var html_str = html_head + html_content + html_tail;
      $("#box").html(html_str);
      $("li").mouseover(function (e) {
        $(this).siblings().stop().fadeTo(500, 0.4);
      });
      $("li").mouseout(function (e) {
        $(this).siblings().stop().fadeTo(500, 1);
      });
      //监听切换事件
      listenChangeHL(id_arr);
    },
  });
});
