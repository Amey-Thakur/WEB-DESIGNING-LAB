<?php
/**
 * Author: Amey Thakur
 * Description: AJAX Controller for Dynamic Image Management.
 * Handles Fetch, Insert, Update, and Delete operations for the database.
 */

if (isset($_POST["action"])) {
    
    // Establishing Database Connection
    // Note: 'filly' is the local database name used in this laboratory project
    $connect = mysqli_connect("localhost", "root", "", "filly");
    
    // --- FETCH ACTION ---
    // Retrieve all records from the 'amey' table and format them as an HTML table
    if ($_POST["action"] == "fetch") {
        $query = "SELECT * FROM amey ORDER BY id DESC";
        $result = mysqli_query($connect, $query);
        
        $output = '
            <table class="table table-hover table-bordered">  
                <tr class="info">
                    <th width="10%">ID</th>
                    <th width="60%">Image Preview</th>
                    <th width="15%" class="text-center">Action</th>
                    <th width="15%" class="text-center">Remove</th>
                </tr>
        ';
        
        while ($row = mysqli_fetch_array($result)) {
            // Processing binary blob into base64 for direct browser rendering
            $base64_image = base64_encode($row['name']);
            
            $output .= '
                <tr>
                    <td style="vertical-align: middle;">' . $row["id"] . '</td>
                    <td>
                        <img src="data:image/jpeg;base64,' . $base64_image . '" class="img-thumbnail" style="max-height: 80px; transition: transform 0.3s;" onmouseover="this.style.transform=\'scale(1.1)\'" onmouseout="this.style.transform=\'scale(1)\'" />
                    </td>
                    <td class="text-center" style="vertical-align: middle;">
                        <button type="button" name="update" class="btn btn-warning btn-sm update" id="' . $row["id"] . '">
                            <span class="glyphicon glyphicon-edit"></span> Change
                        </button>
                    </td>
                    <td class="text-center" style="vertical-align: middle;">
                        <button type="button" name="delete" class="btn btn-danger btn-sm delete" id="' . $row["id"] . '">
                            <span class="glyphicon glyphicon-trash"></span> Delete
                        </button>
                    </td>
                </tr>
            ';
        }
        $output .= '</table>';
        echo $output;
    }

    // --- INSERT ACTION ---
    // Convert uploaded file to binary format and insert into database
    if ($_POST["action"] == "insert") {
        // file_get_contents reads the file as binary data
        // addslashes escapes special characters for safe SQL execution
        $file = addslashes(file_get_contents($_FILES["image"]["tmp_name"]));
        $query = "INSERT INTO amey(name) VALUES ('$file')";
        
        if (mysqli_query($connect, $query)) {
            echo 'System Message: Image uploaded and recorded successfully!';
        } else {
            echo 'SQL Error: ' . mysqli_error($connect);
        }
    }

    // --- UPDATE ACTION ---
    // Update existing record's binary content based on ID
    if ($_POST["action"] == "update") {
        $file = addslashes(file_get_contents($_FILES["image"]["tmp_name"]));
        $query = "UPDATE amey SET name = '$file' WHERE id = '" . $_POST["image_id"] . "'";
        
        if (mysqli_query($connect, $query)) {
            echo 'System Message: Record updated successfully!';
        } else {
            echo 'SQL Error: ' . mysqli_error($connect);
        }
    }

    // --- DELETE ACTION ---
    // Remove record from the database based on ID
    if ($_POST["action"] == "delete") {
        $query = "DELETE FROM amey WHERE id = '" . $_POST["image_id"] . "'";
        
        if (mysqli_query($connect, $query)) {
            echo 'System Message: Image removed from the database.';
        } else {
            echo 'SQL Error: ' . mysqli_error($connect);
        }
    }

    mysqli_close($connect);
}
?>
