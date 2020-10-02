<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output omit-xml-declaration="no" method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
	<xsl:include href="includes/web-page.xsl"/>
	<xsl:variable name="title">Error</xsl:variable>

	<xsl:template name="content">
		<h2><xsl:value-of select="$title" /></h2>
		<xsl:for-each select="/report/incident">
			<section class="box">
				<h3 class="box_title">Response</h3>
				<h4>Message</h4>
				<p><xsl:value-of select="state/text" /></p>
				<xsl:if test="state/@definition">
					<p>Error code: <xsl:value-of select="state/@definition" /></p>
				</xsl:if>
			</section>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
