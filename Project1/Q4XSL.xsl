<?xml version="1.0" encoding="UTF-8" ?>
<!-- /*****************************************************************************
* ITC5202 – Project1
* I declare that this assignment is my own work in accordance with Humber Academic
* Policy.
* No part of this assignment has been copied manually or electronically from any other
* source (including web sites) or distributed to other students.
*
* Name: Keziah Thomas Student ID: N01541155 Date: 28/02/23
*
*
*****************************************************************************/ -->
<xsl:stylesheet version="1.0"
    xmlns:my="http://www.master-works.com"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template match="/my:dataset">

        <html>
            <head>
                <title>Q4</title>
            </head>

            <body>
                <table border='1'>
                <!-- Table Header Row -->
                    <tr style="background-color: beige;">
                        <th>Order Number</th>
                        <th>Order Date</th>
                        <th>Address Type</th>
                        <th>Address</th>
                        <th>Address Type</th>
                        <th>Address</th>
                        <th>Delivery Notes</th>
                        <th>Part Number</th>
                        <th>Quantity</th>
                        <th>Comment</th>
                        <th>Status</th>
                        <th>Ship Date</th>
                        <th>Part Number</th>
                        <th>Quantity</th>
                        <th>Comment</th>
                        <th>Status</th>
                        <th>Ship Date</th>
                        <th>Part Number</th>
                        <th>Quantity</th>
                        <th>Comment</th>
                        <th>Status</th>
                        <th>Ship Date</th>
                    </tr>
                    <!-- Iterating through every Purchase Order -->
                    <xsl:for-each select="//my:PurchaseOrder">
                        <tr style="background-color: #fcf7a2;">
                            <!-- Selecting Purchase Order Number -->
                            <td><xsl:value-of select="@PurchaseOrderNumber"/></td>
                            <!-- Selecting Order Date -->
                            <td><xsl:value-of select="@OrderDate"/></td>
                            <!-- Selecting Shipping and Billing Address -->
                            <xsl:for-each select="my:Address">
                                <td><xsl:value-of select="@Type"/></td>
                                <td><xsl:value-of select="."/></td>
                            </xsl:for-each>
                            <!-- Selecting Delivery Notes -->
                            <td><xsl:value-of select="my:DeliveryNotes"/></td>
                            <!-- Iterating through every Item in the Product Order and selecting Item info -->
                            <xsl:for-each select="my:Items/my:Item">
                                <td><xsl:value-of select="@PartNumber"/></td>
                                <td><xsl:value-of select="my:Quantity"/></td>
                                <td><xsl:value-of select="my:Comment"/></td>
                                <td><xsl:value-of select="my:Status"/></td>
                                <td><xsl:value-of select="my:ShipDate"/></td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>

        </html>
    </xsl:template>

</xsl:stylesheet>