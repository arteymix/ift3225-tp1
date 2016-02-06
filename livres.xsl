<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>

    <xsl:param name="livre" select="''"/>

    <xsl:template match="/">
        <html>
            <body>
                <table>
                    <tr>
                        <th>Titre</th>
                        <th>Auteurs</th>
                        <th>Langue</th>
                        <th>Annee</th>
                        <th>Prix</th>
                        <th>Couverture</th>
                        <th>Film</th>
                        <th>Commentaire</th>
                        <th>Personnage(s)</th>
                    </tr>
                    <xsl:apply-templates select="bibliotheque/livre[contains(titre,$livre)]"/>
                </table>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="livre">

        <xsl:variable name="auteurs" select="@auteurs"/>
        <tr>
            <td><xsl:value-of select="titre"/></td>

            <!-- afficher les auteurs-->
            <td>
                <ul>

                    <xsl:apply-templates select="/bibliotheque/auteur[contains($auteurs,@ident)]"></xsl:apply-templates>
                </ul>
            </td>
            <td><xsl:value-of select="@xml:lang"/></td>
            <td><xsl:value-of select="annee"/></td>
            <td><xsl:apply-templates select="prix"></xsl:apply-templates></td>

            <td><img src="{couverture}">
                <xsl:attribute name="height">100</xsl:attribute>
                <xsl:attribute name="width">100</xsl:attribute>
            </img></td>
            <td><a href="{film}">lien vers le film</a></td>
            <td><xsl:value-of select="commentaire"/></td>
            <td><xsl:apply-templates select="personnage"></xsl:apply-templates></td>
        </tr>
    </xsl:template>

    <xsl:template match="prix">
        <xsl:value-of select="valeur"/>&#160;<xsl:value-of select="@monnaie"/>
    </xsl:template>

    <xsl:template match="auteur | personnage">
        <li><xsl:value-of select="nom"/>, <xsl:value-of select="prenom"/> (<xsl:value-of select="pays"/>)</li>
    </xsl:template>

</xsl:stylesheet>
