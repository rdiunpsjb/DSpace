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
			<!-- dc.identifier.uri -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='uri']/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
			<!-- dc.identifier.url -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='url']/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
			<!-- dc.identifier.isbn -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='isbn']/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
			<!-- dc.type -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element[@name='driver']/doc:field[@name='value']">
				<dc:type><xsl:value-of select="concat('info:eu-repo/semantics/',.)" /></dc:type>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element[@name='snrd']/doc:field[@name='value']">
				<dc:type><xsl:value-of select="concat('info:ar-repo/semantics/',.)" /></dc:type>
			</xsl:for-each>
			<!-- unp.version -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element[@name='version']/doc:field[@name='value']">
				<dc:type><xsl:value-of select="." /></dc:type>
			</xsl:for-each>
			<!-- dc.title -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>
			<!-- dc.title.alternative -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element[@name='alternative']/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>
			<!-- dcterms.title.investigation -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='title']/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>-->

			<!-- dc.contributor.author -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='author']/doc:element/doc:field[@name='value']">
				<dc:creator><xsl:value-of select="." /></dc:creator>
			</xsl:for-each>
			<!-- dcterms.creator.corporate -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='creator']/doc:element[@name='corporate']/doc:element/doc:field[@name='value']">
				<dc:creator><xsl:value-of select="." /></dc:creator>
			</xsl:for-each>-->

			<!-- dc.contributor.director-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='director']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			<!-- dc.contributor.editor-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='editor']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			<!-- dc.contributor.compilator-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='compilator']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			<!-- dcterms.creator.* not author and not corporate -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='creator']/doc:element[@name!='author' and @name!='corporate']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>-->
			<!-- dc.contributor -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			<!-- dcterms.subject.* excepto subject.ford -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='subject']/doc:element[@name!='ford']/doc:element/doc:field[@name='value']">
				<dc:subject><xsl:value-of select="." /></dc:subject>
			</xsl:for-each> -->
			<!--dcterms.subject.ford imprimo solo la uri de autoridad -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='subject']/doc:element[@name='ford']/doc:element/doc:field[@name='authority']">
				<dc:subject><xsl:value-of select="." /></dc:subject>
			</xsl:for-each>-->
			<!-- dc.subject -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element/doc:field[@name='value']">
				<dc:subject><xsl:value-of select="." /></dc:subject>
			</xsl:for-each>
			<!-- dc.description.abstract -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='abstract']/doc:element/doc:field[@name='value']">
				<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>
			<!-- dc.description-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element/doc:field[@name='value']">
				<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>
			<!--dc.description.filiation = description -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='filiation']/doc:element/doc:field[@name='value']">
				<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>
			<!-- thesis.degree.name (necesario?)-->
			<xsl:for-each select="doc:metadata/doc:element[@name='thesis']/doc:element[@name='degree']/doc:element[@name='name']/doc:element/doc:field[@name='value']">
				<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>
			<!-- dcterms.format dataset description -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='format']/doc:element/doc:field[@name='value']">
				<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>-->
			<!-- dc.date.issued -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='issued']/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each>
			<!-- dcterms.created -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='created']/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each>-->
			<!-- license.embargoEnd -->
			<!-- Si tiene embargo se debe mostrar la fecha de fin (Pendiente)-->
			<xsl:for-each select="doc:metadata/doc:element[@name='snrd']/doc:element[@name='rights']/doc:element[@name='embargoEndDate']/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each>
			<!-- mimetype (Ver este caso, es automático?)-->
            <xsl:for-each select="doc:metadata/doc:element[@name='bundles']/doc:element[@name='bundle' and doc:field[@name='name' and text()='ORIGINAL']]/doc:element[@name='bitstreams']/doc:element[@name='bitstream']/doc:field[@name='format']">
                    <dc:format><xsl:value-of select="." /></dc:format>
            </xsl:for-each>
			<!-- dc.format.extent -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='format']/doc:element[@name='extent']/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- dcterms.medium -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='medium']/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>-->
            <!--  dc.coverage.spatial -->
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element[@name='spatial']/doc:element/doc:field[@name='value']">
                <dc:coverage><xsl:value-of select="." /></dc:coverage>
            </xsl:for-each>
            <!--  dc.coverage.temporal -->
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element[@name='temporal']/doc:element/doc:field[@name='value']">
                <dc:coverage><xsl:value-of select="." /></dc:coverage>
            </xsl:for-each>
			<!-- dc.publisher -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:field[@name='value']">
				<dc:publisher><xsl:value-of select="." /></dc:publisher>
			</xsl:for-each>			
			<!-- dc.language -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:field[@name='value']">
				<dc:language><xsl:value-of select="." /></dc:language>
			</xsl:for-each>
			<!-- dcterms.relation (PENDIENTE)-->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='dcterms']/doc:element[@name='relation']/doc:element/doc:field[@name='value']">
				<xsl:if test="./text()">
					<dc:relation><xsl:value-of select="." /></dc:relation>
				</xsl:if>
			</xsl:for-each>-->
			<!-- dc.identifier.other -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='other']/doc:element/doc:field[@name='value']">
				<xsl:if test="./text()">
					<dc:relation><xsl:value-of select="." /></dc:relation>
				</xsl:if>
			</xsl:for-each>
			<!-- dc.rights (VER ESTE CASO)-->
			<!-- En el contexto snrd mostrar dc:rights dependiendo de si tiene o no embargo -->
			<!--<xsl:for-each select="doc:metadata/doc:element[@name='snrd']/doc:element[@name='rights']/doc:element[@name='accessRights']/doc:element/doc:field[@name='value']">
				<dc:rights><xsl:value-of select="." /></dc:rights>
			</xsl:for-each> -->
			<!-- dc.rights -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:field[@name='value']">
				<dc:rights><xsl:value-of select="." /></dc:rights>
			</xsl:for-each>
			<!-- dc.rights.uri -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element[@name='uri']/doc:element/doc:field[@name='value']">
				<dc:rights><xsl:value-of select="." /></dc:rights>
			</xsl:for-each>
		</oai_dc:dc>
	</xsl:template>
</xsl:stylesheet>
