<?xml version="1.0" encoding="UTF-8"?>
<!-- Following OpenAIRE Guidelines 1.1: http://www.openaire.eu/component/content/article/207 -->
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:doc="http://www.lyncode.com/xoai">

<xsl:output indent="yes" method="xml" omit-xml-declaration="yes" />

<xsl:template match="/doc:metadata">
	<doc:metadata>		
		<xsl:apply-templates select="@*|node()" />
		<!--<xsl:call-template name="snrdDescription"/>-->
		<xsl:call-template name="snrdType"/>
		<!--<xsl:call-template name="snrdRights"/>-->
	</doc:metadata>
</xsl:template>

<xsl:template match="@*|node()">
	<xsl:copy>
		<xsl:apply-templates select="@*|node()" />
	</xsl:copy>
</xsl:template>
	
<!-- Completas dc.type para OpenAires -->
<!--xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:field[@name='value']/text()">
	<xsl:variable name="prefijoOA" select="'info:eu-repo/semantics__'"/>
	<xsl:value-of select="concat($prefijoOA,.)" />
</xsl:template> -->
	
	<!-- SNRD: type -->
	<xsl:template name="snrdType">
	        <!--<xsl:variable name="unpType" select="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:field[@name='value']/text()"/>-->
			<xsl:variable name="unpType" select="//doc:element[@name='dc']/doc:element[@name='type']//doc:field[@name='value']/text()" />

	        <!--<xsl:variable name="unpTypeversion" select="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element[@name='version']/doc:element/doc:field[@name='value']/text()"/>-->
			<xsl:variable name="unpTypeversion" select="normalize-space(string(//doc:element[@name='dc']/doc:element[@name='type']/doc:element[@name='version']//doc:field[@name='value']))"/>

        	<!-- formato openAire-->
	        <xsl:variable name="openAireType">
        		<xsl:choose>
               		<!--<xsl:when test="contains($unpType, 'Libro')">info:eu-repo/semantics/book</xsl:when>-->
					<xsl:when test="normalize-space($unpType) = 'Libro'">info:eu-repo/semantics/book</xsl:when>
					<!--<xsl:when test="contains($unpType, 'Parte de libro')">info:eu-repo/semantics/bookPart</xsl:when>-->
					<xsl:when test="normalize-space($unpType) = 'Parte de libro'">info:eu-repo/semantics/bookPart</xsl:when>
					<xsl:when test="contains($unpType, 'Documento de conferencia')">info:eu-repo/semantics/conferenceObject</xsl:when>
                    <xsl:when test="contains($unpType, 'Tesis de doctorado')">info:eu-repo/semantics/doctoralThesis</xsl:when>
       		        <xsl:when test="contains($unpType, 'Tesis de maestría')">info:eu-repo/semantics/masterThesis</xsl:when>
       		        <xsl:when test="contains($unpType, 'Trabajo de especialización')">info:eu-repo/semantics/masterThesis</xsl:when>
                    <xsl:when test="contains($unpType, 'Tesis de grado')">info:eu-repo/semantics/bachelorThesis</xsl:when>
                    <xsl:when test="contains($unpType, 'Trabajo final de grado')">info:eu-repo/semantics/bachelorThesis</xsl:when>
                    <xsl:when test="contains($unpType, 'Informe técnico')">info:eu-repo/semantics/report</xsl:when>
                    <xsl:when test="contains($unpType, 'Artículo')">info:eu-repo/semantics/article</xsl:when>
	            	<xsl:otherwise>info:eu-repo/semantics/other</xsl:otherwise>
	            </xsl:choose>
	        </xsl:variable>        

			<!-- formato SNRD-->
	        <xsl:variable name="snrdType">
        		<xsl:choose>
               		<!--<xsl:when test="contains($unpType, 'Libro')">info:ar-repo/semantics/libro</xsl:when>-->
					<xsl:when test="normalize-space($unpType) = 'Libro'">info:ar-repo/semantics/libro</xsl:when>
					<!--<xsl:when test="contains($unpType, 'Parte de libro')">info:ar-repo/semantics/parte de libro</xsl:when>-->
					<xsl:when test="normalize-space($unpType) = 'Parte de libro'">info:ar-repo/semantics/parte de libro</xsl:when>
					<xsl:when test="contains($unpType, 'Documento de conferencia')">info:ar-repo/semantics/documento de conferencia</xsl:when>
                    <xsl:when test="contains($unpType, 'Tesis de doctorado')">info:ar-repo/semantics/tesis doctoral</xsl:when>
       		        <xsl:when test="contains($unpType, 'Tesis de maestría')">info:ar-repo/semantics/tesis de maestría</xsl:when>
       		        <xsl:when test="contains($unpType, 'Trabajo de especialización')">info:ar-repo/semantics/tesis de maestría</xsl:when>
                    <xsl:when test="contains($unpType, 'Tesis de grado')">info:ar-repo/semantics/tesis de grado</xsl:when>
                    <xsl:when test="contains($unpType, 'Trabajo final de grado')">info:ar-repo/semantics/trabajo final de grado</xsl:when>
                    <xsl:when test="contains($unpType, 'Conjunto de datos')">info:ar-repo/semantics/conjunto de datos</xsl:when>
                    <xsl:when test="contains($unpType, 'Informe técnico')">info:ar-repo/semantics/informe técnico</xsl:when>
                    <xsl:when test="contains($unpType, 'Artículo')">info:ar-repo/semantics/artículo</xsl:when>
                    <xsl:when test="contains($unpType, 'Imagen')">info:ar-repo/semantics/fotografía</xsl:when>
                    <xsl:when test="contains($unpType, 'Imagen satelital')">info:ar-repo/semantics/imagen satelital</xsl:when>
                    <xsl:when test="contains($unpType, 'Película documental')">info:ar-repo/semantics/película documental</xsl:when>
                    <xsl:when test="contains($unpType, 'Plano')">info:ar-repo/semantics/plano</xsl:when>
                    <xsl:when test="contains($unpType, 'Mapa')">info:ar-repo/semantics/mapa</xsl:when>
                    <xsl:when test="contains($unpType, 'Diapositiva')">info:ar-repo/semantics/diapositiva</xsl:when>
                    <xsl:when test="contains($unpType, 'Diapositiva de microscopio')">info:ar-repo/semantics/diapositiva de microscopio</xsl:when>
                    <xsl:when test="contains($unpType, 'Video')">info:ar-repo/semantics/videograbación</xsl:when>
                    <xsl:when test="contains($unpType, 'Audio')">info:ar-repo/semantics/otro</xsl:when>
                    <xsl:when test="contains($unpType, 'Proyecto de investigación')">info:ar-repo/semantics/proyecto de investigación</xsl:when>
	            	<xsl:otherwise>info:ar-repo/semantics/otro</xsl:otherwise>
	            </xsl:choose>
	        </xsl:variable>        

	<!-- formato Versión del Documento -->
	        <xsl:variable name="snrdversion">
        		<xsl:choose>
               		<xsl:when test="contains($unpTypeversion, 'publishedVersion')">info:eu-repo/semantics/publishedVersion</xsl:when>
					<xsl:when test="contains($unpTypeversion, 'acceptedVersion')">info:eu-repo/semantics/acceptedVersion</xsl:when>
					<xsl:when test="contains($unpTypeversion, 'updatedVersion')">info:eu-repo/semantics/updatedVersion</xsl:when>
					<xsl:otherwise>info:eu-repo/semantics/updatedVersion</xsl:otherwise>
	            </xsl:choose>
	        </xsl:variable>       

        	<!-- armo una nueva salida xoai con los dos type -->
			<doc:element name="snrd">
                <doc:element name="type">
                	<doc:element name="es-openAireType">
		        		<doc:field name="value">
		                	<xsl:value-of select="$openAireType"/>
			            </doc:field>
			        </doc:element>
			     	<doc:element name="es-snrdType">
                		<doc:field name="value">
                        	<xsl:value-of select="$snrdType"/>
			            </doc:field>
			        </doc:element>
			        <doc:element name="es-snrdversion">
                		<doc:field name="value">
                        	<xsl:value-of select="$snrdversion"/>
			            </doc:field>
			        </doc:element>
				</doc:element>
			</doc:element>
    </xsl:template>
</xsl:stylesheet>
