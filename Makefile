all: auteurs.xhtml livres.xhtml

%.xhtml: %.xsl bibliotheque.xml
	xsltproc $^ > $@
