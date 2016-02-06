all: auteurs.xhtml livres.xhtml

%.xhtml: %.xsl bibliotheque.xml
	saxon -s:bibliotheque.xml -xsl:$< -o:$@

upload: rapport.html style.css bibliotheque.xml schema.rnc auteurs.xsl livres.xsl auteurs.xhtml livres.xhtml
	scp $^ poirigui@frontal.iro.umontreal.ca:public_html/ift3225/tp1
