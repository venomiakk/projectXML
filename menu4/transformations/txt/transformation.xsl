<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes" />
    <!-- <xsl:key name="Tags" match="Tag5" use="No" /> -->

    <xsl:template name="loop">
        <!-- !emulated for loop -->
        <xsl:variable
            name="count"
            select="'5'" />
        <xsl:for-each select="(//*)[position()&lt;=$count]">
            <!-- Repeated content Here -->
            <!-- use position() to get loop index -->
        <xsl:value-of
                select="'|'" />
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="NameLen">
        <xsl:for-each
            select="//products/product">
            <xsl:sort select="string-length(name)" data-type="number" order="ascending" />
            <xsl:if
                test="position()=last()">
                <xsl:value-of select="string-length(name)" />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:variable name="longestName">
        <xsl:call-template name="NameLen"></xsl:call-template>
    </xsl:variable>

    <xsl:template name="PriceLen">
        <xsl:for-each
            select="//products/product">
            <xsl:sort select="string-length(price)" data-type="number" order="ascending" />
            <xsl:if
                test="position()=last()">
                <xsl:value-of select="string-length(price)" />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:variable name="longestPrice">
        <xsl:call-template name="PriceLen"></xsl:call-template>
    </xsl:variable>

    <xsl:template name="TypeLen">
        <xsl:for-each
            select="//products/product">
            <xsl:sort select="string-length(type)" data-type="number" order="ascending" />
            <xsl:if
                test="position()=last()">
                <xsl:value-of select="string-length(type)" />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:variable name="longestType">
        <xsl:call-template name="TypeLen"></xsl:call-template>
    </xsl:variable>

    <xsl:template name="AvaLen">
        <xsl:for-each
            select="//products/product">
            <xsl:sort select="string-length(availability)" data-type="number" order="ascending" />
            <xsl:if
                test="position()=last()">
                <xsl:value-of select="string-length(availability)" />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:variable name="longestAva">
        <xsl:call-template name="AvaLen"></xsl:call-template>
    </xsl:variable>


    <xsl:variable name="spaces">
        <xsl:value-of
            select="'&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;'"></xsl:value-of>
    </xsl:variable>


    <xsl:variable name="nazwa">
        <xsl:value-of select="'Nazwa produktu'"></xsl:value-of>
    </xsl:variable>

    <xsl:variable name="cena">
        <xsl:value-of select="'Cena'"></xsl:value-of>
    </xsl:variable>

    <xsl:variable name="typ">
        <xsl:value-of select="'Typ'"></xsl:value-of>
    </xsl:variable>

    <xsl:variable name="dost">
        <xsl:value-of select="'Dostępność'"></xsl:value-of>
    </xsl:variable>


    <xsl:template match="/">
        <xsl:variable name="nazwaF"
            select="concat($nazwa, substring($spaces, 0, $longestName - string-length($nazwa) + 1),' | ')" />
        <xsl:variable
            name="cenaF"
            select="concat($cena, substring($spaces, 0, $longestPrice - string-length($cena) + 1),' | ')" />
        <xsl:variable
            name="typF"
            select="concat($typ, substring($spaces, 0, $longestType - string-length($typ) + 1),' | ')" />
        <xsl:variable
            name="dostF" select="concat($dost, ' | ')" />


        <xsl:value-of select="'+'" />

        <xsl:for-each
            select="(//*)[position()&lt;=string-length($nazwaF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
            select="(//*)[position()&lt;=string-length($cenaF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
            select="(//*)[position()&lt;=string-length($typF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
            select="(//*)[position()&lt;=string-length($dostF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:value-of
            select="'&#10;'" />


        <xsl:value-of
            select="concat('| ',$nazwaF,$cenaF, $typF, $dostF)" />
        <xsl:value-of
            select="'&#10;'" />
            
        <xsl:value-of select="'+'" />

        <xsl:for-each
            select="(//*)[position()&lt;=string-length($nazwaF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
            select="(//*)[position()&lt;=string-length($cenaF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
            select="(//*)[position()&lt;=string-length($typF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
            select="(//*)[position()&lt;=string-length($dostF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />

        <xsl:for-each
            select="//products/product">
            <xsl:variable name="prodName"
                select="concat(name, substring($spaces, 0, $longestName - string-length(name) + 1), ' | ')" />
            <xsl:variable
                name="prodPrice"
                select="concat(price, substring($spaces, 0, $longestPrice - string-length(price) + 1), ' | ')" />
            <xsl:variable
                name="prodTyp"
                select="concat(type, substring($spaces, 0, $longestType - string-length(type) + 1), ' | ')" />
            <xsl:variable
                name="prodDost"
                select="concat(availability, substring($spaces, 0, string-length($dostF) - string-length(availability) - 2), ' | ')" />

            <xsl:value-of
                select="'&#10;'" />

            <xsl:value-of
                select="concat('| ',$prodName,$prodPrice,$prodTyp,$prodDost)" />
            <xsl:value-of
                select="'&#10;'" />
                <xsl:value-of select="'+'" />
            <xsl:for-each
                select="(//*)[position()&lt;=string-length($prodName)-1]">
                <xsl:value-of select="'-'" />
            </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
                select="(//*)[position()&lt;=string-length($prodPrice)-1]">
                <xsl:value-of select="'-'" />
            </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
                select="(//*)[position()&lt;=string-length($prodTyp)-1]">
                <xsl:value-of select="'-'" />
            </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
                select="(//*)[position()&lt;=string-length($dostF)-1]">
                <xsl:value-of select="'-'" />
            </xsl:for-each>
        <xsl:value-of select="'+'" />

        </xsl:for-each>
        <xsl:value-of
            select="'&#10;'" />

    </xsl:template>

</xsl:stylesheet>