<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output
        method="xml"
        indent="yes"
        standalone="no"
        doctype-public="-//W3C//DTD SVG 1.1//EN"
        doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"
        media-type="image/svg" />

    <xsl:template match="/hardware">

        <xsl:variable name="m01" select="count(//products/product[manufacturer='m01'])" />
        <xsl:variable
            name="m02" select="count(//products/product[manufacturer='m02'])" />
        <xsl:variable
            name="m03" select="count(//products/product[manufacturer='m03'])" />
        <xsl:variable
            name="m04" select="count(//products/product[manufacturer='m04'])" />
        <xsl:variable
            name="m05" select="count(//products/product[manufacturer='m05'])" />
        <xsl:variable
            name="m06" select="count(//products/product[manufacturer='m06'])" />
        <xsl:variable
            name="m07" select="count(//products/product[manufacturer='m07'])" />
        <xsl:variable
            name="m08" select="count(//products/product[manufacturer='m08'])" />
        <xsl:variable
            name="m09" select="count(//products/product[manufacturer='m09'])" />
        
        <svg
            xmlns="http://www.w3.org/2000/svg" width="600" height="400" style="background-color: white">
            <text x="90" y="35" fill="black" font-size="25">Ilość wystąpień producentów w produktach</text>
            <line x1="50" y1="50" x2="50" y2="350" stroke="black" stroke-widts="5px" />
            <line x1="50" y1="350" x2="560" y2="350" stroke="black" stroke-widts="5px" />
            <line x1="50" y1="50" x2="560" y2="50" stroke="black" stroke-widts="5px" />
            <line x1="560" y1="50" x2="560" y2="350" stroke="black" stroke-widts="5px" />

            <text x="20" y="280" fill="black">1</text>
            <line x1="50" y1="280" x2="40" y2="280" stroke="black" stroke-widts="2px" />

            <text x="20" y="210" fill="black">2</text>
            <line x1="50" y1="210" x2="40" y2="210" stroke="black" stroke-widts="2px" />

            <text x="20" y="140" fill="black">3</text>
            <line x1="50" y1="140" x2="40" y2="140" stroke="black" stroke-widts="2px" />

            <text x="20" y="70" fill="black">4</text>
            <line x1="50" y1="70" x2="40" y2="70" stroke="black" stroke-widts="2px" />

            <!-- m01 -->
            <rect x="65" y="{350 - ($m01 * 70)}" width="40" height="{$m01 * 70}" stroke="black"
                stroke-widts="2px"
                fill="blue">
                <animate attributeName="fill" values="blue;green;yellow;green;blue" dur="10s"
                    repeatCount="indefinite" />
            </rect>
            <text x="70" y="380" fill="black">m01</text>

            <!-- m02 -->
            <rect x="120" y="{350 - ($m02 * 70)}" width="40" height="{$m02 * 70}" stroke="black"
                stroke-widts="2px"
                fill="blue">
                <animate attributeName="fill" values="blue;green;yellow;green;blue" dur="10s"
                    repeatCount="indefinite" />
            </rect>
            <text x="125" y="380" fill="black">m02</text>

            <!-- m03 -->
            <rect x="175" y="{350 - ($m03 * 70)}" width="40" height="{$m03 * 70}" stroke="black"
                stroke-widts="2px"
                fill="blue">
                <animate attributeName="fill" values="blue;green;yellow;green;blue" dur="10s"
                    repeatCount="indefinite" />
            </rect>
            <text x="180" y="380" fill="black">m03</text>

            <!-- m04 -->
            <rect x="230" y="{350 - ($m04 * 70)}" width="40" height="{$m04 * 70}" stroke="black"
                stroke-widts="2px"
                fill="blue">
                <animate attributeName="fill" values="blue;green;yellow;green;blue" dur="10s"
                    repeatCount="indefinite" />
            </rect>
            <text x="235" y="380" fill="black">m04</text>

            <!-- m05 -->
            <rect x="285" y="{350 - ($m05 * 70)}" width="40" height="{$m05 * 70}" stroke="black"
             stroke-widts="2px"
             fill="blue">
                <animate attributeName="fill" values="blue;green;yellow;green;blue" dur="10s"
                    repeatCount="indefinite" />
            </rect>
            <text x="290" y="380" fill="black">m05</text>

            <!-- m06 -->
            <rect x="340" y="{350 - ($m06 * 70)}" width="40" height="{$m06 * 70}" stroke="black"
             stroke-widts="2px"
             fill="blue">
                <animate attributeName="fill" values="blue;green;yellow;green;blue" dur="10s"
                    repeatCount="indefinite" />
            </rect>
            <text x="345" y="380" fill="black">m06</text>

             <!-- m07 -->
             <rect x="395" y="{350 - ($m07 * 70)}" width="40" height="{$m07 * 70}" stroke="black"
             stroke-widts="2px"
             fill="blue">
                <animate attributeName="fill" values="blue;green;yellow;green;blue" dur="10s"
                    repeatCount="indefinite" />
            </rect>
            <text x="400" y="380" fill="black">m07</text>

            <!-- m08 -->
            <rect x="450" y="{350 - ($m08 * 70)}" width="40" height="{$m08 * 70}" stroke="black"
             stroke-widts="2px"
             fill="blue">
                <animate attributeName="fill" values="blue;green;yellow;green;blue" dur="10s"
                repeatCount="indefinite" />
            </rect>
           <text x="455" y="380" fill="black">m08</text>

           <!-- m09 -->
           <rect x="505" y="{350 - ($m09 * 70)}" width="40" height="{$m09 * 70}" stroke="black"
           stroke-widts="2px"
           fill="blue">
              <animate attributeName="fill" values="blue;green;yellow;green;blue" dur="10s"
              repeatCount="indefinite" />
          </rect>
         <text x="510" y="380" fill="black">m09</text>

        </svg>
    </xsl:template>
</xsl:stylesheet>