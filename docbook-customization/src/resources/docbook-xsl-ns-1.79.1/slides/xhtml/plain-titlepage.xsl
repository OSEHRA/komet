<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns="http://www.w3.org/1999/xhtml" xmlns:dbs="http://docbook.org/ns/docbook-slides" version="1.0" exclude-result-prefixes="exsl">

<!-- This stylesheet was created by template/titlepage.xsl-->

<xsl:template name="slides.titlepage.recto">
  <xsl:choose>
    <xsl:when test="slidesinfo/title">
      <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="slidesinfo/title"/>
    </xsl:when>
    <xsl:when test="docinfo/title">
      <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="docinfo/title"/>
    </xsl:when>
    <xsl:when test="info/title">
      <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="info/title"/>
    </xsl:when>
    <xsl:when test="title">
      <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="title"/>
    </xsl:when>
  </xsl:choose>

  <xsl:choose>
    <xsl:when test="slidesinfo/subtitle">
      <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="slidesinfo/subtitle"/>
    </xsl:when>
    <xsl:when test="docinfo/subtitle">
      <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="docinfo/subtitle"/>
    </xsl:when>
    <xsl:when test="info/subtitle">
      <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="info/subtitle"/>
    </xsl:when>
    <xsl:when test="subtitle">
      <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="subtitle"/>
    </xsl:when>
  </xsl:choose>

  <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="slidesinfo/corpauthor"/>
  <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="docinfo/corpauthor"/>
  <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="info/corpauthor"/>
  <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="slidesinfo/authorgroup"/>
  <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="docinfo/authorgroup"/>
  <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="info/authorgroup"/>
  <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="slidesinfo/author"/>
  <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="docinfo/author"/>
  <xsl:apply-templates mode="slides.titlepage.recto.auto.mode" select="info/author"/>
</xsl:template>

<xsl:template name="slides.titlepage.verso">
</xsl:template>

<xsl:template name="slides.titlepage.separator">
</xsl:template>

<xsl:template name="slides.titlepage.before.recto">
</xsl:template>

<xsl:template name="slides.titlepage.before.verso">
</xsl:template>

<xsl:template name="slides.titlepage">
  <div class="slide cover title">
    <xsl:variable name="recto.content">
      <xsl:call-template name="slides.titlepage.before.recto"/>
      <xsl:call-template name="slides.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="slides.titlepage.before.verso"/>
      <xsl:call-template name="slides.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="slides.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="slides.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="slides.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="title" mode="slides.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="slides.titlepage.recto.style">
<xsl:apply-templates select="." mode="slides.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="subtitle" mode="slides.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="slides.titlepage.recto.style">
<xsl:apply-templates select="." mode="slides.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="corpauthor" mode="slides.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="slides.titlepage.recto.style">
<xsl:apply-templates select="." mode="slides.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="authorgroup" mode="slides.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="slides.titlepage.recto.style">
<xsl:apply-templates select="." mode="slides.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="author" mode="slides.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="slides.titlepage.recto.style">
<xsl:apply-templates select="." mode="slides.titlepage.recto.mode"/>
</div>
</xsl:template>

</xsl:stylesheet>

