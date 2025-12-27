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
                .enhancer-btn {
                    position: fixed !important;
                    bottom: 80px !important;
                    right: 20px !important;
                    width: 50px !important;
                    height: 50px !important;
                    background: #ffffff !important;
                    color: #2563eb !important;
                    border-radius: 50% !important;
                    border: 2px solid #2563eb !important;
                    box-shadow: 0 4px 6px rgba(0,0,0,0.3) !important;
                    z-index: 2147483647 !important;
                    display: flex !important;
                    align-items: center !important;
                    justify-content: center !important;
                    font-size: 24px !important;
                    cursor: pointer !important;
                    transition: all 0.3s ease !important;
                    font-family: sans-serif !important;
                }
                .enhancer-btn:hover {
                    background: #2563eb !important;
                    color: white !important;
                    transform: scale(1.1) !important;
                }
                .enhancer-modal-overlay {
                    position: fixed !important;
                    top: 0 !important;
                    left: 0 !important;
                    width: 100vw !important;
                    height: 100vh !important;
                    background: rgba(0,0,0,0.6) !important;
                    z-index: 2147483647 !important;
                    display: none !important;
                    justify-content: center !important;
                    align-items: center !important;
                    backdrop-filter: blur(3px) !important;
                    opacity: 0 !important;
                    transition: opacity 0.3s ease !important;
                }
                .enhancer-modal-overlay.active {
                    display: flex !important;
                    opacity: 1 !important;
                }
                .enhancer-modal {
                    background: white !important;
                    width: 90% !important;
                    max-width: 500px !important;
                    padding: 30px !important;
                    border-radius: 16px !important;
                    box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1) !important;
                    position: relative !important;
                    transform: translateY(20px) !important;
                    transition: transform 0.3s ease !important;
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
                    text-align: left !important;
                    color: #333 !important;
                }
                .enhancer-modal-overlay.active .enhancer-modal {
                    transform: translateY(0) !important;
                }
                .enhancer-close {
                    position: absolute !important;
                    top: 15px !important;
                    right: 20px !important;
                    font-size: 24px !important;
                    cursor: pointer !important;
                    color: #999 !important;
                }
                .enhancer-title {
                    margin: 0 0 10px 0 !important;
                    font-size: 24px !important;
                    font-weight: bold !important;
                    color: #1e293b !important;
                }
                .enhancer-meta {
                    font-size: 14px !important;
                    color: #64748b !important;
                    margin-bottom: 20px !important;
                }
                .enhancer-desc {
                    font-size: 16px !important;
                    line-height: 1.6 !important;
                    margin-bottom: 25px !important;
                    color: #475569 !important;
                }
                .enhancer-tags {
                    margin-bottom: 25px !important;
                }
                .enhancer-tag {
                    display: inline-block !important;
                    background: #eff6ff !important;
                    color: #2563eb !important;
                    padding: 5px 12px !important;
                    border-radius: 20px !important;
                    font-size: 12px !important;
                    margin-right: 8px !important;
                    font-weight: 600 !important;
                }
                .enhancer-actions {
                    display: flex !important;
                    gap: 10px !important;
                }
                .enhancer-action-btn {
                    flex: 1 !important;
                    padding: 12px !important;
                    border-radius: 8px !important;
                    text-align: center !important;
                    text-decoration: none !important;
                    font-weight: 600 !important;
                    border: none !important;
                    cursor: pointer !important;
                    font-size: 14px !important;
                }
                .btn-source { background: #1e293b !important; color: white !important; }
                .btn-nav { background: #f1f5f9 !important; color: #475569 !important; }
                .enhancer-navigation {
                    display: flex !important;
                    justify-content: space-between !important;
                    margin-top: 20px !important;
                    padding-top: 20px !important;
                    border-top: 1px solid #e2e8f0 !important;
                }
                @keyframes popupEntry {
                    0% { opacity: 0; transform: translateY(20px) scale(0.96); }
                    100% { opacity: 1; transform: translateY(0) scale(1); }
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

                <a href="../index.html" style="position: fixed; bottom: 20px; right: 20px; background: #2563eb; color: white; padding: 10px 20px; border-radius: 50px; text-decoration: none; box-shadow: 0 4px 6px rgba(0,0,0,0.3); font-family: sans-serif; font-size: 16px; font-weight: bold; z-index: 10000; display: inline-flex; align-items: center; gap: 8px;">
                    <span>&#8592;</span> Back to Portfolio
                </a>
                <!-- Manually added Enhancer Button with Inline Styles and Explicit Onclick -->
                <div id="repo-enhancer-btn" onclick="window.toggleEnhancerModal()" style="position: fixed; bottom: 80px; right: 20px; width: 50px; height: 50px; background: #ffffff; color: #2563eb; border-radius: 50%; border: 2px solid #2563eb; box-shadow: 0 4px 6px rgba(0,0,0,0.3); z-index: 2147483647; display: flex; align-items: center; justify-content: center; font-size: 24px; cursor: pointer; transition: all 0.3s ease; font-family: sans-serif;">
                    ℹ️
                </div>

                <script>
<![CDATA[
window.toggleEnhancerModal = function() {
    var exp = { 
        id: "05", 
        title: "XML & XSLT", 
        date: "Oct 2020", 
        stack: ["XML", "XSLT", "Data"], 
        desc: "Structured student mark sheet data transformation to HTML tables using XSLT." 
    };

    var msg = "Exp " + exp.id + ": " + exp.title + "\n" +
              "Date: " + exp.date + "\n\n" +
              exp.desc + "\n\n" +
              "Stack: " + exp.stack.join(", ");
    
    alert(msg);
};
]]>
</script>
			</body>
		</html>
	</xsl:template>
</xsl:transform>
