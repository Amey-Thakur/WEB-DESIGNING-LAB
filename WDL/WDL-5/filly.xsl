<?xml version="1.0" encoding="UTF-8"?>
<!--
    Author: Amey Thakur
    GitHub: https://github.com/Amey-Thakur
    Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
    Description: Web Designing Laboratory - Experiment 5: XSL Transformation (filly.xsl)
    Task: Transform XML marksheet data into a human-readable HTML table.
-->

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- Template matching the root element to start building the HTML document -->
	<xsl:template match="/">
		<html>
			<head>
				<title>MU Grade Card | Amey Thakur B-50</title>
                <style>
                    body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #dbdbdb; }
                    .header-sec { text-align: center; color: #ff0000; margin-bottom: 20px; }
                    .info-block { margin-left: 10%; margin-bottom: 20px; line-height: 1.6; }
                    .marks-table { border-collapse: collapse; margin: auto; box-shadow: 0 4px 8px rgba(0,0,0,0.2); }
                    .marks-table th { padding: 12px; border: 1px solid #444; }
                    .marks-table td { padding: 10px; border: 1px solid #444; }
                    footer { text-align: center; margin-top: 30px; color: #f70000; font-weight: bold; }
                </style>
			</head>
			<body>
				<header class="header-sec">
					<h1>UNIVERSITY OF MUMBAI</h1>
					<h2>GRADE CARD</h2>
				</header>

                <!-- Processing Student Information -->
				<div class="info-block">
					<xsl:for-each select="/marksheet/stud">
                        <strong>NAME: </strong> <xsl:value-of select="name"/><br/>
                        <strong>EXAMINATION: </strong> <xsl:value-of select="exam"/><br/>
                        <strong>HELD IN: </strong> <xsl:value-of select="heldin"/><br/>
                        <strong>SEAT NUMBER: </strong> <xsl:value-of select="seat"/><br/>
					</xsl:for-each>
				</div>

				<table class="marks-table" border="0" bgcolor="#000000">
					<tr style="color:#ff0000">
						<th rowspan="2">COURSE<br/>CODE</th>
						<th rowspan="2">COURSE TITLE</th>
						<th rowspan="2">COURSE<br/>CREDITS</th>
						<th colspan="3">GRADE</th>
						<th rowspan="2">CREDIT<br/>EARNED (C)</th>
						<th rowspan="2">GRADE<br/>POINTS (G)</th>
						<th rowspan="2">C X G</th>
					</tr>
					<tr style="color:#ff0000">
						<th>ESE/PR/OR</th>
						<th>IA/TW</th>
						<th>OVERALL</th>
					</tr>

                    <!-- Iterating through each course node in XML -->
					<xsl:for-each select="/marksheet/course">
						<tr style="color:#FFFFFF">
							<td align="center"><xsl:value-of select="code"/></td>
							<td><xsl:value-of select="title"/></td>
							<td align="center"><xsl:value-of select="cr"/></td>
							<td align="center"><xsl:value-of select="or"/></td>
							<td align="center"><xsl:value-of select="ia"/></td>
							<td align="center"><xsl:value-of select="ovrl"/></td>
							<td align="center"><xsl:value-of select="ce"/></td>
							<td align="center"><xsl:value-of select="gp"/></td>
							<td align="center"><xsl:value-of select="cxg"/></td>
						</tr>
					</xsl:for-each>

                    <!-- Summary Row -->
					<tr>
						<td colspan="2" style="color:#ff0000">TOTAL</td>
						<td colspan="4" style="color:#FFFFFF; text-align: center;">27</td>
						<td align="center" style="color:#FFFFFF">27</td>
						<td align="center" style="color:#FFFFFF">--</td>
						<td align="center" style="color:#FFFFFF">169.00</td>
					</tr>
				</table>

				<div class="info-block" style="margin-top: 20px;">
                    <strong>REMARK: </strong> Successful <br/>
                    <strong>SGPI: </strong> 6.26 <br/>
                    <strong>RESULT DECLARED ON: </strong> JULY 13, 2019
				</div>

				<div style="text-align: center; color:#ff0000; margin-top: 40px;">
					<p>DIRECTOR</p>
					<p>BOARD OF EXAMINATIONS AND EVALUATION</p>
				</div>

				<footer>
					<p>Amey Thakur B-50 | TEC Computer Engineering</p>
				</footer>
			</body>
		</html>
	</xsl:template>
</xsl:transform>
