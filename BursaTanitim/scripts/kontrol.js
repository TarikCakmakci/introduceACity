function adSoyadKontrol() {
	var ad = document.getElementByName("ctl00$ContentPlaceHolder1$txtAd");
	var soyad = document.getElementByName("ctl00$ContentPlaceHolder1$txtSoyad");

	var girilmemesiGerekenler = ["<", ">", ",", ";", "--", "=", "<html>", "<body>", "src", "+", "!", "'", "^", "+", "%", "&"];

	for (var i = 0; i < girilmemesiGerekenler.length; i++) {
		if (ad.value == girilmemesiGerekenler[i]) {
			alert("Hatalı ifade girdiniz");
		}
	}
	if (ad.value.length > 50) {
		window.alert("Maksimumu 50 karakter girebilirsiniz");
	}
	if (ad.value > 0 || ad.value < 0) {
		alert("Sayı girdiniz");
	}

	for (var i = 0; i < girilmemesiGerekenler.length; i++) {
		if (soyad.value == girilmemesiGerekenler[i]) {
			alert("Hatalı ifade girdiniz");
		}
	}
	if (soyad.value.length > 50) {
		window.alert("Maksimumu 50 karakter girebilirsiniz");
	}
	if (soyad.value > 0 || soyad.value < 0) {
		alert("Sayı girdiniz");
	}


	// burası doğru ad soyad
}
