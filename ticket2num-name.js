javascript: (function (d) {
  var e = d.createElement('textarea');
  e.id = "pz-hbc-sc";
  var ticket = location.pathname.replace('/issues/', '');
  title = $('.subject h3').text();
  e.innerHTML = '#' + ticket + ' : ' + title;
  var b = d.getElementsByTagName('body').item(0);
  b.appendChild(e);
  d.getElementById('pz-hbc-sc').select();
  d.execCommand('Copy');
  b.removeChild(e);
})(document);
