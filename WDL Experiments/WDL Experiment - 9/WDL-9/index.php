<!DOCTYPE html>
<html lang="en">
<!--
    Author: Amey Thakur
    GitHub: https://github.com/Amey-Thakur
    Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
    Description: Web Designing Laboratory - Experiment 9: Dynamic Web Page (AJAX)
    Task: Implement a dynamic image management system using PHP, AJAX, and MySQL.
-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Dynamic Image Management using AJAX and PHP">
    <meta name="author" content="Amey Thakur">
    <title>Dynamic Gallery | Amey Thakur B-50</title>
    
    <!-- Dependencies: jQuery and Bootstrap (for Modal) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #007bff;
            --accent-color: #ff0000;
            --bg-color: #f8f9fa;
            --card-bg: #ffffff;
            --text-color: #333;
            --box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            --border-radius: 8px;
        }

        body {
            font-family: 'Inter', -apple-system, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            line-height: 1.6;
        }

        .main-header {
            text-align: center;
            margin: 40px 0;
        }

        .main-header h1 {
            color: #002dff;
            font-size: 2.2rem;
            margin-bottom: 5px;
        }

        .main-header h2 {
            color: var(--accent-color);
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }

        .student-info { margin-bottom: 30px; }

        .id-table {
            width: 100%;
            background: var(--card-bg);
            border-collapse: collapse;
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--box-shadow);
        }

        .id-table th, .id-table td {
            padding: 15px;
            border: 1px solid #eee;
            text-align: left;
        }

        .id-table th {
            background-color: #f0f4f8;
            color: var(--primary-color);
            width: 25%;
        }

        .gallery-card {
            background: var(--card-bg);
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        .gallery-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            border-bottom: 2px solid #eee;
            padding-bottom: 15px;
        }

        .gallery-header h3 {
            margin: 0;
            color: var(--primary-color);
            font-weight: 600;
        }

        .main-footer {
            text-align: center;
            padding: 50px 20px;
            color: var(--accent-color);
            font-weight: bold;
        }
    </style>
</head>
<body>
    <header class="main-header">
        <h1>Web Designing Laboratory</h1>
        <h2>Experiment No. 09: Dynamic Web Page (AJAX)</h2>
    </header>

    <main class="container">
        <!-- Student Identification Section -->
        <section class="student-info">
            <table class="id-table">
                <tr>
                    <th>Name:</th>
                    <td>Amey Thakur</td>
                    <th>Roll No:</th>
                    <td>B-50</td>
                </tr>
                <tr>
                    <th>Branch:</th>
                    <td>Computer Engineering</td>
                    <th>Semester:</th>
                    <td>V</td>
                </tr>
            </table>
        </section>

        <!-- Gallery Management Portal -->
        <section class="gallery-card">
            <div class="gallery-header">
                <h3>Image Management Portal</h3>
                <button type="button" name="add" id="add" class="btn btn-primary">
                    <span class="glyphicon glyphicon-plus"></span> Add New Image
                </button>
            </div>

            <!-- This div will be populated dynamically via AJAX -->
            <div id="image_data">
                <p class="text-center text-muted">Loading gallery data...</p>
            </div>
        </section>
    </main>

    <footer class="main-footer">
        <p>Amey Thakur B-50 | TEC Computer Engineering</p>
    </footer>

    <!-- Bootstrap Modal for Image Operations -->
    <div id="imageModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Management Operations</h4>
                </div>
                <div class="modal-body">
                    <form id="image_form" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Select Image File:</label>
                            <input type="file" name="image" id="image" class="form-control" />
                            <p class="help-block">Supported formats: JPG, JPEG, PNG, GIF</p>
                        </div>
                        <input type="hidden" name="action" id="action" value="insert" />
                        <input type="hidden" name="image_id" id="image_id" />
                        <input type="submit" name="insert" id="insert" value="Insert" class="btn btn-info btn-block" />
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- AJAX & jQuery Logic -->
    <script>
    $(document).ready(function(){
        
        // Initial data fetch on page load
        fetch_data();

        /**
         * Function to fetch image data from the server asynchronously
         */
        function fetch_data() {
            var action = "fetch";
            $.ajax({
                url: "action.php",
                method: "POST",
                data: { action: action },
                success: function(data) {
                    $('#image_data').html(data);
                }
            });
        }

        // Open Modal for adding new image
        $('#add').click(function(){
            $('#imageModal').modal('show');
            $('#image_form')[0].reset();
            $('.modal-title').text("Add New Image");
            $('#image_id').val('');
            $('#action').val('insert');
            $('#insert').val("Upload to Database");
            $('#insert').removeClass('btn-warning').addClass('btn-info');
        });

        /**
         * Logic to handle form submission (Insert/Update)
         */
        $('#image_form').submit(function(event){
            event.preventDefault();
            var image_name = $('#image').val();
            
            // Basic validation for Insert action
            if($('#action').val() == 'insert' && image_name == '') {
                alert("Please select an image file first.");
                return false;
            }

            // Extension validation
            if(image_name != '') {
                var extension = image_name.split('.').pop().toLowerCase();
                if(jQuery.inArray(extension, ['gif','png','jpg','jpeg']) == -1) {
                    alert("Invalid File Format. Please upload an Image.");
                    $('#image').val('');
                    return false;
                }
            }

            // Perform AJAX submission
            // Using FormData(this) is essential for binary/file data transfer
            $.ajax({
                url: "action.php",
                method: "POST",
                data: new FormData(this),
                contentType: false,
                processData: false,
                success: function(data) {
                    alert(data);
                    fetch_data(); // Refresh view
                    $('#image_form')[0].reset();
                    $('#imageModal').modal('hide');
                }
            });
        });

        // Open Modal for updating an existing image
        $(document).on('click', '.update', function(){
            $('#image_id').val($(this).attr("id"));
            $('#action').val("update");
            $('.modal-title').text("Replace Image Content");
            $('#insert').val("Confirm Update");
            $('#insert').removeClass('btn-info').addClass('btn-warning');
            $('#imageModal').modal("show");
        });

        // Handle Image Deletion
        $(document).on('click', '.delete', function(){
            var image_id = $(this).attr("id");
            var action = "delete";
            if(confirm("Warning: This will permanently remove the image from the database. Proceed?")) {
                $.ajax({
                    url: "action.php",
                    method: "POST",
                    data: { image_id: image_id, action: action },
                    success: function(data) {
                        alert(data);
                        fetch_data(); // Refresh view
                    }
                });
            }
        });
    });
    </script>
</body>
</html>
