<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0">
	<xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" />
	<!-- Import include files -->
	<xsl:include href="includes/page.xsl"/>
	<xsl:include href="includes/mountnav.xsl"/>

	<xsl:variable name="title">Move listeners</xsl:variable>

	<xsl:template name="content">
				<div class="section">
					<h2><xsl:value-of select="$title" /></h2>
					<section class="box">
						<h3 class="box_title">Mountpoint <code><xsl:value-of select="@mount" /></code></h3>
						<!-- Mount nav -->
						<xsl:call-template name="mountnav">
							<xsl:with-param name="mount" select="current_source"/>
						</xsl:call-template>
						<xsl:choose>
							<xsl:when test="source">
								<xsl:choose>
									<xsl:when test="param-id">
										<input type="hidden" name="id" value="{param-id}" />
										<p>Choose the mountpoint to which you want to move the listener to:</p>
									</xsl:when>
									<xsl:otherwise>
										<p>Choose the mountpoint to which you want to move the listeners to:</p>
									</xsl:otherwise>
								</xsl:choose>
								<form method="post" action="moveclients.xsl">
									<label for="moveto" class="hidden">
										Move from <code><xsl:value-of select="current_source" /></code> to
									</label>
									<select name="destination" id="moveto">
										<xsl:for-each select="source">
											<option value="{@mount}">
												<xsl:value-of select="@mount" />
											</option>
										</xsl:for-each>
									</select>
									<input type="hidden" name="mount" value="{current_source}" />
									&#160;
									<input type="submit" value="Move listeners" />
								</form>
							</xsl:when>
							<xsl:otherwise>
								<p class="warning">
									<strong>No mounts!</strong> 
									There are no other mountpoints you could move the listeners to.
								</p>
							</xsl:otherwise>
						</xsl:choose>
					</section>
				</div>
	</xsl:template>
</xsl:stylesheet>
