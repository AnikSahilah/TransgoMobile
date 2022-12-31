class BaseAPI {
  static String base = "http://10.0.2.2";
  static var api = "$base/api";
  static var authPath = "$api/auth";
  static var terminalPath = "$api/terminal";
  static var jadwalPath = "$api/jadwal";
  static var ticketPath = "$api/pemesanan";

  var login = "$authPath/login.php";
  var register = "$authPath/register.php";
  var getProfile = "$authPath/check-user.php";

  var allTerminal = "$terminalPath/all.php"; 

  var allJadwal = "$jadwalPath/jadwal.php"; 

  var createTicket = "$ticketPath/create.php";
  var historyTicket = "$ticketPath/riwayat.php";
  var myTicket = "$ticketPath/tiket-saya.php";
  var incomingTicket = "$ticketPath/tiket.php";
  var historyTicket2 = "$ticketPath/history-kernet.php";
  var updateStatus = "$ticketPath/update-tiket.php";
  // more routes
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}
