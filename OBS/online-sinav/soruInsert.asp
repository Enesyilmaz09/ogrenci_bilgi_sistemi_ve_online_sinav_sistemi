<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Sınav Sistemi</title>
</head>
<body>
    <%
    Response.CodePage = 65001
    Response.Charset = "UTF-8" 
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/SORU.mdb")

    
    soru = request.form("soruMetni")
    A = request.form("secenekA")
    B = request.form("secenekB")
    C = request.form("secenekC")
    D = request.form("secenekD")
    cevap = request.form("cevap")

    sinav_tur=session("sinav_tur")
    sinav_ad=Session("sinav_ad")
    sinav_aciklama=Session("sinav_aciklama")
    sinav_suresi=Session("sinav_suresi")
    sinav_tarihi=Session("sinav_tarihi")
    
    ders_kodu = Session("ders_kodu")
    
    conn.Execute("INSERT INTO "&ders_kodu&" (sinavad, sinavaciklama, sinavsuresi, sinavtarihi,sinav_tur, Soru, secenekA, secenekB, secenekC, secenekD, Cevap) VALUES ('"&sinav_ad&"','"&sinav_aciklama&"','"&sinav_suresi&"','"&sinav_tarihi&"','"&sinav_tur&"','"&soru&"','"&A&"','"&B&"','"&C&"','"&D&"','"&cevap&"')")
    conn.Close

    Set conn = Nothing

    

%>
<script>
    window.location = 'soruEkle.asp'
</script>

</body>
</html>