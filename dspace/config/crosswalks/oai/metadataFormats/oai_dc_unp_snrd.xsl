<?xml version="1.0" encoding="UTF-8" ?>
<!-- 


    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/
	Developed by DSpace @ Lyncode <dspace@lyncode.com>
	
	> http://www.openarchives.org/OAI/2.0/oai_dc.xsd

 -->
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:doc="http://www.lyncode.com/xoai"
	version="1.0">
	<xsl:output omit-xml-declaration="yes" method="xml" indent="yes" />
	
	<xsl:template match="/">
		<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
			xmlns:dc="http://purl.org/dc/elements/1.1/" 
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
			xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">

			<!-- dc.title -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>
			<!-- dc.title.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>

			<!-- dc.creator -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='creator']/doc:element/doc:field[@name='value']">
				<dc:creator><xsl:value-of select="." /></dc:creator>
			</xsl:for-each>-->
			<!-- dc.contributor.author -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='author']/doc:element/doc:field[@name='value']">
				<dc:creator><xsl:value-of select="." /></dc:creator>
			</xsl:for-each>
			<!-- dc.contributor.director (para el caso de las tesis)-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='director']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			<!-- dc.contributor.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			<!-- dwc.identifiedBy para Herbario-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dwc']/doc:element[@name='identifiedBy']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			<!-- dwc.recordedBy Herbario-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dwc']/doc:element[@name='recordedBy']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			
			<!-- dc.subject -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element/doc:field[@name='value']">
				<dc:subject><xsl:value-of select="." /></dc:subject>
			</xsl:for-each>
			<!-- dc.subject.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element/doc:element/doc:field[@name='value']">
				<dc:subject><xsl:value-of select="." /></dc:subject>
			</xsl:for-each>
		
			<!-- dc.description(1ra instancia) -> dc.description.abstract -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='abstract']/doc:element/doc:field[@name='value']">
    			<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>
			<!--dc.description(2da instancia) -> dc.description.filiation -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='filiation']/doc:element/doc:field[@name='value']">
    			<!--<dc:description><xsl:value-of select="concat('Fil: ', .,'')" /></dc:description>-->
    			<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>

			<!-- dc.publisher -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:field[@name='value']">
				<dc:publisher><xsl:value-of select="." /></dc:publisher>
			</xsl:for-each>
			<!-- dc.publisher.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:element/doc:field[@name='value']">
				<dc:publisher><xsl:value-of select="." /></dc:publisher>
			</xsl:for-each>

			<!-- dc.date.issued -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='issued']/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each>			
			<!-- dc.date -> unp.embargoDate (Por ahora no)-->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='unp']/doc:element[@name='embargoDate']/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each>-->
			<!-- license.embargoEnd -->
			<!-- Si tiene embargo se debe mostrar la fecha de fin -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='snrd']/doc:element[@name='rights']/doc:element[@name='embargoEndDate']/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each>-->
			<!-- dc.date.* (ya comentado)-->
			<!--
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each>
			-->

			<!-- dc.type -->
			<xsl:for-each select="doc:metadata/doc:element[@name='snrd']/doc:element[@name='type']/doc:element/doc:field[@name='value']">
				<dc:type><xsl:value-of select="." /></dc:type>
			</xsl:for-each>
			<!-- dc.type.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='snrd']/doc:element[@name='type']/doc:element/doc:element/doc:field[@name='value']">
				<dc:type><xsl:value-of select="." /></dc:type>
			</xsl:for-each>

			<!-- dc.format -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='format']/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- dc.format.* (por ejemplo .extent)-->			
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='format']/doc:element/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- mimetype ejemplo unaj Formato del bitstream: Ejemplo PDF, etc -->
			<xsl:for-each select="doc:metadata/doc:element[@name='bundles']/doc:element[@name='bundle']/doc:field[@name='name'][text()='ORIGINAL']/../doc:element[@name='bitstreams']/doc:element[@name='bitstream']/doc:field[@name='format']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- mimetype ejemplo cic digital-->
            <!--xsl:for-each select="doc:metadata/doc:element[@name='bundles']/doc:element[@name='bundle' and doc:field[@name='name' and text()='ORIGINAL']]/doc:element[@name='bitstreams']/doc:element[@name='bitstream']/doc:field[@name='format']">
                    <dc:format><xsl:value-of select="." /></dc:format>
            </xsl:for-each>-->

			<!-- dc.identifier (URI) -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='uri']/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
			<!-- dc.identifier -->
			<!--
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>			
			-->
			<!-- dc.identifier.* -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>-->

			<!-- dc.source (dc.identifier.citation)-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='citation']/doc:element/doc:field[@name='value']">
				<dc:source><xsl:value-of select="." /></dc:source>
			</xsl:for-each>
			<!-- dc.source.* -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='source']/doc:element/doc:element/doc:field[@name='value']">
				<dc:source><xsl:value-of select="." /></dc:source>
			</xsl:for-each>-->

			<!-- dc.language -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:field[@name='value']">
				<dc:language><xsl:value-of select="." /></dc:language>
			</xsl:for-each>
			<!-- dc.language.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:element/doc:field[@name='value']">
				<dc:language><xsl:value-of select="." /></dc:language>
			</xsl:for-each>

			<!-- dc.relation (dc.relation.ispartofseries)-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element[@name='ispartofseries']/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="." /></dc:relation>
			</xsl:for-each>
			<!-- dc.relation -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="." /></dc:relation>
			</xsl:for-each>-->
			<!-- dc.relation.* -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="." /></dc:relation>
			</xsl:for-each>-->
			
			<!-- dc.relation.* (DOI) -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='doi']/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="concat('info:eu-repo/semantics/altIdentifier/doi/', substring-after(., 'doi.org/'))"/></dc:relation>
			</xsl:for-each>-->
			
			<!-- dc.relation.* (ISBN) -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='isbn']/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="concat('info:eu-repo/semantics/altIdentifier/isbn/', .,'')"/></dc:relation>
			</xsl:for-each>

			<!-- dc.relation.* (ISSN impreso) -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='unaj']/doc:element[@name='issn']/doc:element[@name='impreso']/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="concat('info:eu-repo/semantics/altIdentifier/pissn/', .,'')"/></dc:relation>
			</xsl:for-each>-->
			<!-- dc.relation.* (ISSN digital) -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='unaj']/doc:element[@name='issn']/doc:element[@name='digital']/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="concat('info:eu-repo/semantics/altIdentifier/eissn/', .,'')"/></dc:relation>
			</xsl:for-each>-->
			<!-- dc.relation.* (URL) -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='other']/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="concat('info:eu-repo/semantics/altIdentifier/url/', substring-after(., '//'))"/></dc:relation>
			</xsl:for-each>-->

			<!-- dc.coverage -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element/doc:field[@name='value']">
				<dc:coverage><xsl:value-of select="." /></dc:coverage>
			</xsl:for-each>
			<!-- dc.coverage.* (Ejemplo: .spatial, .temporal)-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element/doc:element/doc:field[@name='value']">
				<dc:coverage><xsl:value-of select="." /></dc:coverage>
			</xsl:for-each>

			<!-- dc.rights 1ra instancia: Nivel de accesibilidad-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:field[@name='value']">
				<dc:rights><xsl:value-of select="." /></dc:rights>
			</xsl:for-each>
			<!-- dc.rights.* 2da instancia: Condición de Licencia(dc.right.uri)-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element[@name='uri']/doc:element/doc:field[@name='value']">
				<dc:rights><xsl:value-of select="." /></dc:rights>
			</xsl:for-each>			



			<!-- revisar campos-->


			<!-- dcterms.extent -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='extent']/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>-->
			<!-- dcterms.medium -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='medium']/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>-->

			<!-- dcterms.relation -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='relation']/doc:element/doc:field[@name='value']">
				<xsl:if test="./text()">
					<dc:relation><xsl:value-of select="." /></dc:relation>
				</xsl:if>
			</xsl:for-each>-->
			<!-- dcterms.identifier.other -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='identifier']/doc:element[@name='other']/doc:element/doc:field[@name='value']">
				<xsl:if test="./text()">
					<dc:relation><xsl:value-of select="." /></dc:relation>
				</xsl:if>
			</xsl:for-each>-->
		</oai_dc:dc>
	</xsl:template>
</xsl:stylesheet>
