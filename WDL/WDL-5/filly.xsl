<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Author: Amey Thakur
    GitHub: https://github.com/Amey-Thakur
    Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
    Description: Web Designing Laboratory - Experiment 5: XSL Marksheet Transformation
    Task: Define transformation rules for XML student data into an HTML table format.
-->
<xsl:transform version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html
			xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title>MU RESULTS</title>
                <style>
                    /* Portfolio Button &amp; Page Transition */
                    body {
                        animation: pageFadeIn 0.4s ease-in;
                    }

                    @keyframes pageFadeIn {
                        from {
                            opacity: 0;
                            transform: translateY(10px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    .back-to-dashboard {
                        position: fixed !important;
                        bottom: 20px !important;
                        right: 20px !important;
                        background: #2563eb !important;
                        color: white !important;
                        padding: 10px 20px !important;
                        border-radius: 50px !important;
                        text-decoration: none !important;
                        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3) !important;
                        font-family: sans-serif !important;
                        font-size: 16px !important;
                        font-weight: bold !important;
                        z-index: 10000 !important;
                        display: inline-flex !important;
                        align-items: center !important;
                        gap: 8px !important;
                        cursor: pointer !important;
                    }

                    .back-to-dashboard:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.4) !important;
                    }
                </style>
			</head>
			<body bgcolor="#dbdbdb">
                <!-- University Header -->
				<center>
					<h1 style="color:#ff0000">UNIVERSITY OF MUMBAI</h1>
					<h2 style="color:#ff0000">GRADE CARD</h2>
				</center>
				<br/>
                
                <!-- Student Identification Block -->
				<xsl:for-each select="/marksheet/stud">
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;NAME&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;:&#xa0;&#xa0;&#xa0;
					<xsl:value-of select="name"/>
					<br/>
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;EXAMINATION&#xa0;&#xa0;&#xa0;&#xa0;&#xa0; :&#xa0;&#xa0;&#xa0;
					<xsl:value-of select="exam"/>
					<br/>
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;HELD IN&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;:&#xa0;&#xa0;&#xa0;
					<xsl:value-of select="heldin"/>
					<br/>
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;SEAT NUMBER&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
      :&#xa0;&#xa0;&#xa0;
					<xsl:value-of select="seat"/>
					<br/>
				</xsl:for-each>
				<br/>
                
                <!-- Main Records Table -->
				<table border="0" bgcolor="#000000" align="center" cellspacing= "20">
					<!-- Nested Headers for Course Details -->
                    <tr style="color:#ff0000">
						<th rowspan="2">COURSE
							<BR/> CODE
						</th>
						<th rowspan="2">COURSE TITLE</th >
						<th rowspan="2">COURSE
							<BR/> CREDITS
						</th>
						<th colspan="3">GRADE</th>
						<th rowspan="2">CREDIT
							<BR/> EARNED
							<BR/> (C)
						</th>
						<th rowspan="2">GRADE
							<BR/> POINTS
							<BR/> (G)
						</th>
						<th rowspan="2">C X G</th>
					</tr>
					<tr style="color:#ff0000">
						<th>ESE/PR/OR</th>
						<th>IA/TW</th>
						<th>OVERALL</th>
					</tr>
                    <!-- Loop through each Course in XML -->
					<xsl:for-each select="/marksheet/course">
						<tr style="color:#FFFFFF">
							<td align="center">
								<xsl:value-of select="code"/>
							</td>
							<td>
								<xsl:value-of select="title"/>
							</td>
							<td align="center">
								<xsl:value-of select="cr"/>
							</td>
							<td align="center">
								<xsl:value-of select="or"/>
							</td>
							<td align="center">
								<xsl:value-of select="ia"/>
							</td>
							<td align="center">
								<xsl:value-of select="ovrl"/>
							</td>
							<td align="center">
								<xsl:value-of select="ce"/>
							</td>
							<td align="center">
								<xsl:value-of select="gp"/>
							</td>
							<td align="center">
								<xsl:value-of select="cxg"/>
							</td>
						</tr>
					</xsl:for-each>
                    <!-- Summary/Total Row -->
					<tr>
						<td colspan="2" style="color:#ff0000">TOTAL</td>
						<td colspan="4" style="color:#FFFFFF">&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;27</td>
						<td align="center" style="color:#FFFFFF">27</td>
						<td align="center" style="color:#FFFFFF">--</td>
						<td align="center" style="color:#FFFFFF">169.00</td>
					</tr>
				</table>
				<br/>
                
                <!-- Footer Grades Policy/Remarks -->
				<xsl:text>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
  &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;REMARK     :&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
    &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0; Successful &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
    &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0; SGPI    :&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;6.26&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
    &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
    &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;CGPI:</xsl:text>
				<br/>
				<xsl:text>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;
    &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;RESULT DECLARED ON     :&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0; JULY 13, 2019</xsl:text>
				<br/>
				<br/>
				<br/>
				<center style="color:#ff0000">
					<xsl:text>DIRECTOR</xsl:text>
				</center>
				<br/>
				<center style="color:#ff0000">
					<xsl:text>BOARD OF EXAMINATIONS AND EVALUATION</xsl:text>
				</center>
				<footer>
					<center>
						<p style="color:#f70000">Amey Thakur B-50</p>
					</center>
				</footer>

                <a href="../index.html" class="back-to-dashboard">
                    <span>&#8592;</span> Back to Portfolio
                </a>
			</body>
		</html>
	</xsl:template>
</xsl:transform>
