<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:mw="http://www.master-works.com">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- Creating the parameter called Param -->
  <xsl:param name="Param"/>

  <!-- Match the root element and apply templates to its children -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Purchase Orders</title>
      </head>
      <body>
        <xsl:apply-templates select="mw:dataset"/>
      </body>
    </html>
  </xsl:template>

  <!-- Match each PurchaseOrder element and display its items using a for-each loop -->
  <xsl:template match="mw:PurchaseOrders/mw:PurchaseOrder">
    <xsl:variable name="orderDate" select="@OrderDate" />
     <!-- <xsl:text>
            Parameter Name: </xsl:text><xsl:value-of select="$Param"/> -->
    <!-- Checking if the OrderDate matches parameter value -->
    <xsl:if test="contains($orderDate, $Param)">
    <xsl:apply-templates select="mw:Address[@Type='Shipping']"/>
    <h3>Items:</h3>
    <ul>
      <xsl:for-each select="mw:Items/mw:Item">
        <li>
          <xsl:variable name="itemsPartNumber" select="@PartNumber" />
          Part Number: <xsl:value-of select="$itemsPartNumber"/> -
          Quantity: <xsl:value-of select="mw:Quantity"/> -
          Status: <xsl:value-of select="mw:Status"/>
        <li>
        <xsl:for-each select="//mw:Product">
            <xsl:if test="$itemsPartNumber = @PartNumber">
                <h4>
                 Product Name : <xsl:value-of select="mw:ProductName"/>
                </h4>
            </xsl:if>
        </xsl:for-each>
        </li>

        </li>
      </xsl:for-each>
    </ul>
    </xsl:if>
  </xsl:template>

  <!-- Match the Address element and display its contents -->
  <xsl:template match="mw:Address">
    <p>
      Name: <xsl:value-of select="mw:Name"/><br/>
      Zip: <xsl:value-of select="mw:Zip"/><br/>
      Country: <xsl:value-of select="mw:Country"/>
    </p>
  </xsl:template>

</xsl:stylesheet>
