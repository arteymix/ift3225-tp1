<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>

    <xsl:param name="auteur" select="''"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Auteurs</title>
            </head>
            <body>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Prenom</th>
                        <th>Nom</th>
                        <th>Pays</th>
                        <th>Photo</th>
                        <th>Commentaire</th>
                        <th>Livre(s)</th>
                    </tr>
                    <xsl:apply-templates select="bibliotheque/auteur[contains(nom,$auteur)]"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="auteur">
        <xsl:variable name="auteur_ident" select="@ident"/>
        <tr>
            <td><xsl:value-of select="@ident"/></td>
            <td><xsl:value-of select="prenom"/></td>
            <td><xsl:value-of select="nom"/></td>
            <td><xsl:value-of select="pays"/></td>
            <td><img src="{photo}">
                <xsl:attribute name="height">100</xsl:attribute>
                <xsl:attribute name="width">100</xsl:attribute>
                <xsl:attribute name="alt">Photo de l'auteur</xsl:attribute>
            </img>
            </td>
            <td><xsl:value-of select="commentaire"/></td>
            <td>
                <ul>
                <xsl:apply-templates select="/bibliotheque/livre[contains(@auteurs,$auteur_ident)]"></xsl:apply-templates>
                </ul>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="livre">
        <li><xsl:value-of select="titre"/> (<xsl:value-of select="annee"/>)</li>
    </xsl:template>

</xsl:stylesheet>
