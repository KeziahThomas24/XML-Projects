<?xml version="1.0" encoding="UTF-8"?>
<!-- /*****************************************************************************
* ITC5202 – Project1
* I declare that this assignment is my own work in accordance with Humber Academic
* Policy.
* No part of this assignment has been copied manually or electronically from any other
* source (including web sites) or distributed to other students.
*
* Name: Saeeduddin Mohammed Student ID: N01547224 Date: 28/02/23
*
*
*****************************************************************************/ -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:mw="http://www.master-works.com">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

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
    <h2>Purchase Order Number: <xsl:value-of select="@PurchaseOrderNumber"/></h2>
    <p>Order Date: <xsl:value-of select="mw:OrderDate"/></p>
    <h3>Shipping Address:</h3>
    <xsl:apply-templates select="mw:Address[@Type='Shipping']"/>
    <h3>Billing Address:</h3>
    <xsl:apply-templates select="mw:Address[@Type='Billing']"/>
    <p>Delivery Notes: <xsl:value-of select="mw:DeliveryNotes"/></p>
    <h3>Items:</h3>
    <ul>
      <xsl:for-each select="mw:Items/mw:Item">
      <xsl:choose>
      <xsl:when test="mw:Status != ' Shipped '">
        <li style="color: red;">
          <xsl:variable name="itemsPartNumber" select="@PartNumber" />
          <!-- <xsl:value-of select="$itemsPartNumber" /> -->
          Part Number: <xsl:value-of select="$itemsPartNumber"/> -
          Quantity: <xsl:value-of select="mw:Quantity"/> -
          <xsl:if test="mw:Comment">
            Comment: <xsl:value-of select="mw:Comment"/> -
          </xsl:if>
          Status: <xsl:value-of select="mw:Status"/>
          <xsl:if test="mw:ShipDate">
            - Ship Date: <xsl:value-of select="mw:ShipDate"/>
          </xsl:if>
        <!-- Displaying product names for matching partNumber from Items to Products -->
        <li style="color: red;">
        <xsl:for-each select="//mw:Product">
            <xsl:if test="$itemsPartNumber = @PartNumber">
                <h4>
                 Product Name : <xsl:value-of select="mw:ProductName"/>
                </h4>
            </xsl:if>
        </xsl:for-each>
        </li>

        </li>
        </xsl:when>
        <xsl:otherwise>
        <li>
          <xsl:variable name="itemsPartNumber" select="@PartNumber" />
          <!-- <xsl:value-of select="$itemsPartNumber" /> -->
          Part Number: <xsl:value-of select="@PartNumber"/> -
          Quantity: <xsl:value-of select="mw:Quantity"/> -
          <xsl:if test="mw:Comment">
            Comment: <xsl:value-of select="mw:Comment"/> -
          </xsl:if>
          Status: <xsl:value-of select="mw:Status"/>
          <xsl:if test="mw:ShipDate">
            - Ship Date: <xsl:value-of select="mw:ShipDate"/>
          </xsl:if>
        <!-- Displaying product names for matching partNumber from Items to Products -->
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
        </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </ul>
  </xsl:template>

  <!-- Match the Address element and display its contents -->
  <xsl:template match="mw:Address">
    <p>
      Name: <xsl:value-of select="mw:Name"/><br/>
      Street: <xsl:value-of select="mw:Street"/><br/>
      City: <xsl:value-of select="mw:City"/><br/>
      State: <xsl:value-of select="mw:State"/><br/>
      Zip: <xsl:value-of select="mw:Zip"/><br/>
      Country: <xsl:value-of select="mw:Country"/>
    </p>
  </xsl:template>

</xsl:stylesheet>
