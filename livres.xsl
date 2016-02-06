<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="2.0">
    <xsl:output method="xml"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        encoding="UTF-8"
        indent="yes"/>

    <xsl:param name="livre" select="''"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
            <head>
                <title>Livres</title>
            </head>
            <body>
                <table>
                    <thead>
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
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="bibliotheque/livre[contains(titre,$livre)]"/>
                    </tbody>
                </table>
                <p>
                    <a href="http://validator.w3.org/check?uri=referer">
                        <img src="http://www.w3.org/Icons/valid-xhtml10"
                            alt="Valid XHTML 1.0 Strict"
                            height="31" width="88" />
                    </a>
                </p>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="livre">

        <xsl:variable name="auteurs" select="@auteurs"/>
        <tr>
            <td><xsl:value-of select="titre"/></td>

            <!-- afficher les auteurs-->
            <td>
                <xsl:if test="/bibliotheque/auteur[contains($auteurs,@ident)]">
                    <ul>
                        <xsl:apply-templates select="/bibliotheque/auteur[contains($auteurs,@ident)]"></xsl:apply-templates>
                    </ul>
                </xsl:if>
            </td>
            <td><xsl:value-of select="@xml:lang"/></td>
            <td><xsl:value-of select="annee"/></td>
            <td><xsl:apply-templates select="prix"></xsl:apply-templates></td>

            <td>
                <xsl:if test="couverture">
                    <img src="{couverture}">
                        <xsl:attribute name="height">100</xsl:attribute>
                        <xsl:attribute name="width">100</xsl:attribute>
                        <xsl:attribute name="alt">Couverture du livre</xsl:attribute>
                    </img>
                </xsl:if>
            </td>
            <td>
                <xsl:if test="couverture">
                    <a href="{film}">lien vers le film</a>
                </xsl:if>
            </td>
            <td><xsl:value-of select="commentaire"/></td>
            <td>
                <xsl:if test="personnage">
                    <ul>
                        <xsl:apply-templates select="personnage"></xsl:apply-templates>
                    </ul>
                </xsl:if>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="prix">
        <xsl:value-of select="valeur"/>&#160;<xsl:value-of select="@monnaie"/>
    </xsl:template>

    <xsl:template match="auteur | personnage">
        <li><xsl:value-of select="nom"/>, <xsl:value-of select="prenom"/> (<xsl:value-of select="pays"/>)</li>
    </xsl:template>

</xsl:stylesheet>
