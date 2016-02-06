<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="2.0">
    <xsl:output method="xml"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        encoding="UTF-8"
        indent="yes"/>

    <xsl:param name="auteur" select="''"/>

    <xsl:template match="/">
        <html xml:lang="fr" lang="fr">
            <head>
                <title>Auteurs</title>
            </head>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Prenom</th>
                            <th>Nom</th>
                            <th>Pays</th>
                            <th>Photo</th>
                            <th>Commentaire</th>
                            <th>Livre(s)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="bibliotheque/auteur[contains(nom,$auteur)]"/>
                    </tbody>
                </table>
                <p>
                    <a href="http://validator.w3.org/check?uri=referer">
                        <img src="http://www.w3.org/Icons/valid-xhtml10"
                            alt="Valid XHTML 1.0 Strict"
                            height="31"
                            width="88" />
                    </a>
                </p>
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
            <td>
                <xsl:if test="photo">
                    <img src="{photo}">
                        <xsl:attribute name="height">100</xsl:attribute>
                        <xsl:attribute name="width">100</xsl:attribute>
                        <xsl:attribute name="alt">Photo de l'auteur</xsl:attribute>
                    </img>
                </xsl:if>
            </td>
            <td><xsl:value-of select="commentaire"/></td>
            <td>
                <xsl:if test="/bibliotheque/livre[contains(@auteurs,$auteur_ident)]">
                    <ul>
                        <xsl:apply-templates select="/bibliotheque/livre[contains(@auteurs,$auteur_ident)]"></xsl:apply-templates>
                    </ul>
                </xsl:if>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="livre">
        <li><xsl:value-of select="titre"/> (<xsl:value-of select="annee"/>)</li>
    </xsl:template>

</xsl:stylesheet>
