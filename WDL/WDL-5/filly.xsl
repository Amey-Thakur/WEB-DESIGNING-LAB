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
                <script>
<![CDATA[
(function () {
    // 1. Define Experiment Data & Order
    const repoBase = "https://github.com/Amey-Thakur/WEB-DESIGNING-LAB/tree/main/WDL/";
    const experimentOrder = [
        "WDL-1", "WDL-2A", "WDL-2B", "WDL-3", "WDL-4",
        "WDL-5", "WDL-6", "WDL-7", "WDL-8", "WDL-9",
        "WDL-10", "INTEREST-CALCULATOR"
    ];
    const experiments = {
        "WDL-1": {
            id: "01",
            title: "Semantic HTML5",
            date: "Sept 2020",
            stack: ["HTML5", "Semantics", "Accessibility"],
            desc: "Implementation of core structural elements using HTML5 semantic tags. Focuses on accessibility, logical document flow, and meaningful markup for browsers.",
            path: "WDL-1/index.html"
        },
        "WDL-2A": {
            id: "02A",
            title: "CSS3 Layouts",
            date: "Sept 2020",
            stack: ["CSS3", "Flexbox", "Grid"],
            desc: "Sophisticated layout designs utilizing CSS3 Flexbox and Grid. Demonstrates multi-column architectures and specialized header components.",
            path: "WDL-2A/home.html"
        },
        "WDL-2B": {
            id: "02B",
            title: "Responsive Design",
            date: "Sept 2020",
            stack: ["Media Queries", "Mobile-First", "Adaptive"],
            desc: "Mobile-first responsive design implementation. Uses media queries to create adaptive interfaces that provide optimal viewing experiences across device viewports.",
            path: "WDL-2B/index.html"
        },
        "WDL-3": {
            id: "03",
            title: "JavaScript Basics",
            date: "Oct 2020",
            stack: ["ES6", "Logic", "Client-Side"],
            desc: "Fundamental client-side scripting using JavaScript. Implements core programming logic, functional abstractions, and interactive behavior for the web browser.",
            path: "WDL-3/index.html"
        },
        "WDL-4": {
            id: "04",
            title: "DOM Manipulation",
            date: "Oct 2020",
            stack: ["DOM API", "Events", "Interactive"],
            desc: "Advanced DOM interaction and event handling. Features dynamic UI updates and specialized computational interfaces with real-time feedback.",
            path: "WDL-4/index.html"
        },
        "WDL-5": {
            id: "05",
            title: "XML & XSLT",
            date: "Oct 2020",
            stack: ["XML", "XSLT", "Data"],
            desc: "Data representation and transformation. Structured student mark sheet data transformation to HTML tables using XSLT styling principles.",
            path: "WDL-5/index.xml"
        },
        "WDL-6": {
            id: "06",
            title: "Server-Side PHP",
            date: "Nov 2020",
            stack: ["PHP 7", "Backend", "Server-Side"],
            desc: "Introduction to server-side processing using PHP. Implements form handling, arithmetic processing, and dynamic HTML response generation.",
            path: "WDL-6/index.html"
        },
        "WDL-7": {
            id: "07",
            title: "PHP Prime Numbers",
            date: "Nov 2020",
            stack: ["Algorithms", "PHP", "Processing"],
            desc: "Server-side algorithms and form processing. Interactive input for algorithmic processing with core iterations for prime number identification.",
            path: "WDL-7/index.html"
        },
        "WDL-8": {
            id: "08",
            title: "Database Connectivity",
            date: "Nov 2020",
            stack: ["MySQL", "PHP", "Full-Stack"],
            desc: "PHP and MySQL database integration. Data input form for MySQL integration with prepared statements for robust data persistence.",
            path: "WDL-8/index.html"
        },
        "WDL-9": {
            id: "09",
            title: "AJAX & Dynamic Web",
            date: "Dec 2020",
            stack: ["AJAX", "JSON", "Async"],
            desc: "Asynchronous requests and dynamic content. Dynamic UI for asynchronous image loading and server-side responders for AJAX requests.",
            path: "WDL-9/index.html"
        },
        "WDL-10": {
            id: "10",
            title: "Web Frameworks Study",
            date: "Dec 2020",
            stack: ["React", "Angular", "Architectures"],
            desc: "Comparative analysis of modern web architectures and enterprise frameworks like React, Angular, and Vue for scalable application design.",
            path: "WDL-10/index.html"
        },
        "INTEREST-CALCULATOR": {
            id: "EXAM",
            title: "Interest Calculator",
            date: "Dec 2020",
            stack: ["JS Mastery", "DOM", "Certification"],
            desc: "The final practical exam implementation. A robust tool designed to calculate Compound and Simple Interest based on precise user-provided inputs.",
            path: "INTEREST-CALCULATOR/index.html"
        }
    };

    // 2. Detect Current Experiment
    let currentKey = null;
    const path = window.location.pathname.toUpperCase();

    for (const key of experimentOrder) {
        if (path.includes(key)) {
            currentKey = key;
            break;
        }
    }

    if (!currentKey) {
        console.warn("Portfolio Enhancer: No experiment detected in path", path);
    } else {

        const currentExp = experiments[currentKey];
        const currentIndex = experimentOrder.indexOf(currentKey);

        // Determine Prev/Next
        const prevKey = currentIndex > 0 ? experimentOrder[currentIndex - 1] : null;
        const nextKey = currentIndex < experimentOrder.length - 1 ? experimentOrder[currentIndex + 1] : null;

        // 3. Inject CSS
        const style = document.createElement('style');
        style.innerHTML = `
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
        `;
        document.head.appendChild(style);

        // 4. Inject HTML Elements
        const btn = document.createElement('div');
        btn.className = 'enhancer-btn';
        btn.innerHTML = 'ℹ️';
        document.body.appendChild(btn);

        const modalOverlay = document.createElement('div');
        modalOverlay.className = 'enhancer-modal-overlay';

        let navHtml = '';
        if (prevKey || nextKey) {
            navHtml = `<div class="enhancer-navigation">`;
            if (prevKey) navHtml += `<a href="../${experiments[prevKey].path}" class="enhancer-action-btn btn-nav">← Prev: ${experiments[prevKey].id}</a>`;
            else navHtml += `<div></div>`;
            if (nextKey) navHtml += `<a href="../${experiments[nextKey].path}" class="enhancer-action-btn btn-nav">Next: ${experiments[nextKey].id} →</a>`;
            else navHtml += `<div></div>`;
            navHtml += `</div>`;
        }

        modalOverlay.innerHTML = `
            <div class="enhancer-modal">
                <div class="enhancer-close">&times;</div>
                <h2 class="enhancer-title">Exp ${currentExp.id}: ${currentExp.title}</h2>
                <div class="enhancer-meta">📅 ${currentExp.date}</div>
                <p class="enhancer-desc">${currentExp.desc}</p>
                <div class="enhancer-tags">
                    ${currentExp.stack.map(tech => `<span class="enhancer-tag">${tech}</span>`).join('')}
                </div>
                <div class="enhancer-actions">
                    <a href="${repoBase + currentExp.path}" target="_blank" class="enhancer-action-btn btn-source">View Source</a>
                </div>
                ${navHtml}
            </div>
        `;
        document.body.appendChild(modalOverlay);

        // 5. Event Listeners
        btn.addEventListener('click', () => modalOverlay.classList.add('active'));
        modalOverlay.querySelector('.enhancer-close').addEventListener('click', () => modalOverlay.classList.remove('active'));

        document.addEventListener('keydown', (e) => {
            if (!modalOverlay.classList.contains('active')) return;
            if (e.key === 'ArrowLeft' && prevKey) window.location.href = `../${experiments[prevKey].path}`;
            if (e.key === 'ArrowRight' && nextKey) window.location.href = `../${experiments[nextKey].path}`;
            if (e.key === 'Escape') modalOverlay.classList.remove('active');
        });
    }

})();
]]>
</script>
			</body>
		</html>
	</xsl:template>
</xsl:transform>
