<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


  <xsl:template match="/">
    <html>
      <body>
        <h2>-ADRESAR-</h2>
        <h2>Uslov: e-mail adrese</h2>
        <table border="1">
          <tr>
            <td style="font-size:20px">Podaci o osobama</td>
          </tr>
          <tr bgcolor="#9acd32">
            <th style="text-align:center">Ime</th>
            <th style="text-align:center">Prezime</th>
            <th style="text-align:center">Datum rodjenja</th>
            <th style="text-align:center">Adresa</th>
            <th style="text-align:center">Telefon</th>
            <th style="text-align:center">E-mail</th>
          </tr>
          <xsl:for-each select="Adresar">

            <xsl:if test="count(Osoba/email)>1">
              <tr>
                <td>
                  <xsl:value-of select="Osoba/punoIme/ime"/>
                </td>
                <td>
                  <xsl:value-of select="Osoba/punoIme/prezime"/>
                </td>
                <td>
                  <xsl:value-of select="Osoba/datumRodjenja"/>
                </td>
                <td>
                  <xsl:value-of select="Osoba/adresa"/>
                </td>
                <td>
                  <xsl:value-of select="Osoba/telefon"/>
                </td>
                <td>
                  <xsl:value-of select="Osoba/email"/>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
          <tr>
            <td style="font-size:20px">Podaci o kompanijama</td>
          </tr>
          <tr bgcolor="#9acd32">
            <th style="text-align:center">Naziv</th>
            <th style="text-align:center">Adresa</th>
            <th style="text-align:center">Telefon</th>
            <th style="text-align:center">E-mail</th>
          </tr>
          <xsl:for-each select="Adresar">
            <xsl:if test="count(Kompanija/email)>1">
              <tr>
                <td>
                  <xsl:value-of select="Kompanija/naziv"/>
                </td>
                <td>
                  <xsl:value-of select="Kompanija/adresa"/>
                </td>
                <td>
                  <xsl:value-of select="Kompanija/telefon"/>
                </td>
                <td>
                  <xsl:value-of select="Kompanija/email"/>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
      
        </table>
        <h2>Podaci o osobama</h2>
          <h3>Uslovi: datum rodjenja,adresa i ime koje pocinje na slovo M</h3>
          <table border="1">
            <tr>
              <td style="font-size:20px">Podaci o osobama</td>
            </tr>
            <tr bgcolor="#9acd32">
              <th style="text-align:center">Ime</th>
              <th style="text-align:center">Prezime</th>
              <th style="text-align:center">Datum rodjenja</th>
              <th style="text-align:center">Adresa</th>
              <th style="text-align:center">Telefon</th>
              <th style="text-align:center">E-mail</th>
            </tr>
            <xsl:for-each select="Adresar/Osoba">
              <xsl:if test="adresa/@tip='stalna' and (datumRodjenja/godina&gt;1996) and starts-with(punoIme/prezime, 'M')">
                <tr>
                  <td>
                    <xsl:value-of select="punoIme/ime"/>
                  </td>
                  <td>
                    <xsl:value-of select="punoIme/prezime"/>
                  </td>
                  <td>
                    <xsl:value-of select="datumRodjenja"/>
                  </td>
                  <td>
                    <xsl:value-of select="adresa"/>
                  </td>
                  <td>
                    <xsl:value-of select="telefon"/>
                  </td>
                  <td>
                    <xsl:value-of select="email"/>
                  </td>
                </tr>
              </xsl:if>
            </xsl:for-each>
          </table>

        <h2>Podaci o kompanijama</h2>
        <h3>Uslovi: adresa i naziv duzi od 6 slova</h3>
        <table border="1">
          <tr>
            <td style="font-size:20px">Podaci o kompanijama</td>
          </tr>
          <tr bgcolor="#9acd32">
            <th style="text-align:center">Naziv</th>
            <th style="text-align:center">Adresa</th>
            <th style="text-align:center">Telefon</th>
            <th style="text-align:center">E-mail</th>
          </tr>
          <xsl:for-each select="Adresar/Kompanija">
            <xsl:if test="string-length(naziv)>6 and adresa/@tip='stalna'">
              <tr>
                <td>
                  <xsl:value-of select="naziv"/>
                </td>
                <td>
                  <xsl:value-of select="adresa"/>
                </td>
                <td>
                  <xsl:value-of select="telefon"/>
                </td>
                <td>
                  <xsl:value-of select="email"/>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
          
        </table>
     
      </body>
    </html>
  </xsl:template>
  <xsl:template match="Adresar/Kompanija">
    <adresa>
      <xsl:attribute name="ulica">
        <xsl:value-of select="adresa/ulica" />
      </xsl:attribute>
    </adresa>
    <adresa>
      <xsl:attribute name="broj">
        <xsl:value-of select="adresa/broj" />
      </xsl:attribute>
    </adresa>
    <adresa>
      <xsl:attribute name="grad">
        <xsl:value-of select="adresa/grad" />
      </xsl:attribute>
    </adresa>
  </xsl:template>
</xsl:stylesheet>
