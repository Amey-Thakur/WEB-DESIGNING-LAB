<?php
/*
    Author: Amey Thakur
    GitHub: https://github.com/Amey-Thakur
    Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
    Description: Web Designing Laboratory - Experiment 9: AJAX Backend Logic (action.php)
    Task: Process CRUD requests (Fetch, Insert, Update, Delete) from the frontend via AJAX 
          and interact with the MySQL database to manage binary image data.
*/

if (isset($_POST["action"])) {
    // Establishing database connection
    $connect = mysqli_connect("localhost", "root", "", "filly");

    // Logic for fetching all records and building a dynamic HTML table
    if ($_POST["action"] == "fetch") {
        $query = "SELECT * FROM amey ORDER BY id DESC";
        $result = mysqli_query($connect, $query);
        $output = '
   <table class="table table-bordered table-striped" style="color: black; background-color: white;">  
    <tr>
     <th width="10%">ID</th>
     <th width="70%">Image</th>
     <th width="10%">Change</th>
     <th width="10%">Remove</th>
    </tr>
  ';
        while ($row = mysqli_fetch_array($result)) {
            $output.= '

    <tr>
     <td>' . $row["id"] . '</td>
     <td>
      <img src="data:image/jpeg;base64,' . base64_encode($row['name']) . '" height="60" width="75" class="img-thumbnail" />
     </td>
     <td><button type="button" name="update" class="btn btn-warning bt-xs update" id="' . $row["id"] . '">Change</button></td>
     <td><button type="button" name="delete" class="btn btn-danger bt-xs delete" id="' . $row["id"] . '">Remove</button></td>
    </tr>
   ';
        }
        $output.= '</table>';
        echo $output;
    }

    // Logic for inserting new image blob into the database
    if ($_POST["action"] == "insert") {
        $file = addslashes(file_get_contents($_FILES["image"]["tmp_name"]));
        $query = "INSERT INTO amey(name) VALUES ('$file')";
        if (mysqli_query($connect, $query)) {
            echo 'Image Inserted into Database';
        }
    }

    // Logic for updating an existing image record
    if ($_POST["action"] == "update") {
        $file = addslashes(file_get_contents($_FILES["image"]["tmp_name"]));
        $query = "UPDATE amey SET name = '$file' WHERE id = '" . $_POST["image_id"] . "'";
        if (mysqli_query($connect, $query)) {
            echo 'Image Updated into Database';
        }
    }

    // Logic for deleting an image record
    if ($_POST["action"] == "delete") {
        $query = "DELETE FROM amey WHERE id = '" . $_POST["image_id"] . "'";
        if (mysqli_query($connect, $query)) {
            echo 'Image Deleted from Database';
        }
    }
}
?>
