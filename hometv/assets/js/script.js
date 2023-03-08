funJump(99);
var link = window.location.href;
function funJump(secs) {
  var left_span = document.getElementById("left_sec");
  left_span.innerHTML = secs + "s";
  if (--secs > 0) {
    setTimeout(function () {
      funJump(secs);
    }, 1000);
  } else {
    location.href = link;
  }
}
function globalRefresh() {
  location.href = link;
}
//随机访问亮灯动画
var hl_idx = 0;
function doRandHL(id_val, sec, isReset) {
  //某个变亮,整体变暗 a动画时长
  $("#" + id_val)
    .siblings() //被选元素的所有同级元素
    .stop()
    .fadeTo(sec * (1 / 4), 0.4);
  $("#" + id_val)
    .stop()
    .fadeTo(sec * (1 / 4), 1);
  //持续 b时间
  if (!isReset) {
    return;
  }
  setTimeout(function () {
    //恢复 所有变亮 c动画时长
    $("#" + id_val)
      .stop()
      .fadeTo(sec * (1 / 4), 0.4);
    hl_idx++;
  }, sec * (3 / 4));
}
var hl_timer = null;
var rand_hl_data = [];
function doRandHLTimer() {
  if (hl_timer != null) {
    //使在循环过程中时间不再累加
    return;
  }
  //获取此页中的部分数据，取随机N个
  var rand_hl_num = 10;
  rand_hl_data = [];
  for (var i = 0; i < rand_hl_num; i++) {
    var ran = Math.floor(Math.random() * (DATA_ARR.length - i));
    rand_hl_data.push(DATA_ARR[ran]);
  }
  console.log("高亮ID数组", rand_hl_data);
  hl_timer = setInterval(function () {
    //时间间隔从小到大，即从100到300，分rand_hl_num份
    var per_dif = (300 - 100) / rand_hl_num;
    var per_sec = 100 + per_dif * hl_idx;

    if (hl_idx >= rand_hl_data.length - 1) {
      doRandHL(rand_hl_data[hl_idx].id, 3000, false);
      stopTimer();
    } else {
      doRandHL(rand_hl_data[hl_idx].id, per_sec, true);
    }
  }, 200);
}
function stopTimer() {
  clearInterval(hl_timer); //当点击停止按钮时，清除时间函数。
  hl_timer = null;
  hl_idx = 0;
}
function randVisit() {
  stopChangeHL(); //停止定时随机高亮
  doRandHLTimer();
  setTimeout(function () {
    // console.log("执行跳转", rand_hl_data[rand_hl_data.length - 1]);
    var weblink = rand_hl_data[rand_hl_data.length - 1].link;
    window.open(weblink, "_blank");
    listenChangeHL(ID_ARR); //重新恢复定时随机高亮
  }, 5000);
}
