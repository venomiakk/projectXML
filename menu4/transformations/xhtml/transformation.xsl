<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="iso-8859-2" />
    <xsl:template name="data">
        <table class="data-table">
            <tr>
                <td>Nazwa</td>
                <td>Cena</td>
                <td>Typ</td>
                <td>Dostępność</td>
            </tr>
            <xsl:for-each select="hardware/products/product">
                <xsl:sort select="price" data-type="number" />
                <tr>
                    <td>
                        <xsl:value-of select="name" />
                    </td>
                    <td>
                        <xsl:value-of select="price" />
                    </td>
                    <td>
                        <xsl:value-of select="type" />
                    </td>
                    <td>
                        <xsl:value-of select="availability" />
                    </td>
                </tr>
            </xsl:for-each>
        </table>

    </xsl:template>

    <xsl:template name="avgManVal">
        <p>Średnia wartość producenta ($):</p>
        <span class="highlight">
            <xsl:value-of
                select="format-number(sum(hardware/manufacturers/manufacturer/value) 
            div count(hardware/manufacturers/manufacturer/value), '###,###,###,###.00')" />
        </span>
    </xsl:template>

    <xsl:template name="manCount">
        <p>Liczba wszystkich producentów:</p>
        <span class="highlight">
            <xsl:value-of
                select="count(/hardware/manufacturers/manufacturer)" />
        </span>
    </xsl:template>

    <xsl:template name="prodCount">
        <p>Liczba wszystkich produktów:</p>
        <span class="highlight">
            <xsl:value-of
                select="count(/hardware/products/product)" />
        </span>
    </xsl:template>

    <xsl:template name="typeCount">
        <p>Liczba rodzajów produktów:</p>
        <span class="highlight">
            <xsl:value-of
                select="count(/hardware/product_types/product_type)" />
        </span>
    </xsl:template>

    <xsl:template name="countProdTypes">
        <p>Jaki typ produktu wystąpił ile razy:</p>    
    <ul>
            <xsl:for-each select="//product_types/product_type">
                <xsl:variable name="currentType" select="@ptID" />
                <li>
                    <xsl:value-of select="." />
                    <div class="lidiv">
                        <span class="highlight">
                            <xsl:value-of
                                select="count(//products/product[type=$currentType])" />
                        </span>
                    </div>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="countManTypes">
        <p>Jaki producent wystąpił ile razy:</p>    
    <ul>
            <xsl:for-each select="//manufacturers/manufacturer">
                <xsl:variable name="currentMan" select="@manufacturerID" />
                <li>
                    <xsl:value-of select="name" />
                    <div class="lidiv">
                        <span class="highlight">
                            <xsl:value-of
                                select="count(//products/product[manufacturer=$currentMan])" />
                        </span>
                    </div>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="avgProdPrice">
        <p>Średnia wartość produktu</p>
        <span class="highlight">
            <xsl:value-of
                select="format-number(sum(//products/product/price) div count(//products/product/price), '###,###.00')" />
        </span>
    </xsl:template>

    <xsl:template name="avaibleProd">
        <p>Dostępność</p>
        <ul>
            <li>low <div class="lidiv">
                    <span class="highlight">
                        <xsl:value-of
                            select="count(//products/product[availability='low'])" />
                    </span>
                </div>
            </li>
            <li>medium <div class="lidiv">
                    <span class="highlight">
                        <xsl:value-of
                            select="count(//products/product[availability='medium'])" />
                    </span>
                </div>
            </li>
            <li>high <div class="lidiv">
                    <span class="highlight">
                        <xsl:value-of
                            select="count(//products/product[availability='high'])" />
                    </span>
                </div>
            </li>
        </ul>
    </xsl:template>

    <xsl:template name="sumProdPrice">
        <p>Sumaryczna wartość produktów ($)</p>
        <span class="highlight">
            <xsl:value-of
                select="format-number(sum(//products/product/price), '###,###.00')" />
        </span>
    </xsl:template>

    <xsl:template name="sumManValue">
        <p>Sumaryczna wartość producentów ($)</p>
        <span class="highlight">
            <xsl:value-of
                select="format-number(sum(//manufacturers/manufacturer/value), '###,###,###,###,###.00')" />
        </span>
    </xsl:template>

    <xsl:template match="/">
        <html xml:lang="pl" lang="pl">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <link href="style.css" rel="stylesheet" type="text/css" />
                <title>Transformacja do XHTML</title>
            </head>
            <body>
                <div class="flex-container">
                    <div>
                        <h3>Tabela przedstawiająca listę produktów</h3>
                        <xsl:call-template name="data" />
                    </div>
                    <div>
                        <h3>Statystyki</h3>
                        <div class="flex-container">
                            <div>
                                <h4>Producent</h4>
                                <div class="stat-container">
                                    <xsl:call-template name="manCount" />
                                </div>
                                <div class="stat-container">
                                    <xsl:call-template name="sumManValue" />
                                </div>
                                <div class="stat-container">
                                    <xsl:call-template name="avgManVal" />
                                </div>

                                <h4>Typ produktu</h4>
                                <div class="stat-container">
                                    <xsl:call-template name="typeCount" />
                                </div>
                                <h4>Produkt</h4>
                                <div class="stat-container">
                                    <xsl:call-template name="prodCount" />
                                </div>
                                <div class="stat-container">
                                    <xsl:call-template name="sumProdPrice" />
                                </div>
                                <div class="stat-container">
                                    <xsl:call-template name="avgProdPrice" />
                                </div>
                                <div class="stat-container">
                                    <xsl:call-template name="avaibleProd" />
                                </div>
                            </div>
                            <div>
                                <div class="stat-container">
                                    <xsl:call-template name="countProdTypes" />
                                </div>
                                <div class="stat-container">
                                    <xsl:call-template name="countManTypes" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>