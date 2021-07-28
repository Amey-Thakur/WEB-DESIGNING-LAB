<!DOCTYPE html>  
<html>  
 <head>  
  <title>Amey B-50</title>  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
 </head>  
 <body bgcolor="black">  
  <br />

<br>
    <aside id="sidebar">
                  <p>
                  <table border="3" bgcolor="#000000" align="center" cellspacing= "20">
                  <tr style="color:#000dff">
                  <th >Name</th>
                  <th>College</th>
                  <th>Department</th>
                  <th>Class</th>
                  <th>Division</th>
                  <th>Roll Number</th>

                  </tr>
                  <tr style="color:#ff0000">
                  <td>Amey Thakur</td>
                  <td>Terna Engineering College</td>
                  <td>Computer Engineering</td>
                  <td>Third Year</td>
                  <td>B</td>
                  <td>50</td>
                  </tr>
                  </table>
                </p>
                </aside>


  <div class="container" style="width:900px;">  
   <h5 align="center" style="color:#000dff" >Web Designing Laboratory Experiment - 9</h5>
   <h5 align="center" style="color:#ff0000">Dynamic Web page using PHP and AJAX</h5>  
   <br />
   <div align="right">
    <button style="color:#ffffff" type="button" name="add" id="add" class="btn btn-success">Add</button>
   </div>
   <br />
   <div id="image_data">

   </div>
  </div>  
<footer>
          <center><p style="color:#f70000">Amey Thakur B-50</p></center>
      </footer>
 </body>  
</html>

<div id="imageModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
  <div class="modal-content">
   <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title">Add Image</h4>
   </div>
   <div class="modal-body">
    <form id="image_form" method="post" enctype="multipart/form-data">
     <p><label>Select Image</label>
     <input type="file" name="image" id="image" /></p><br />
     <input type="hidden" name="action" id="action" value="insert" />
     <input type="hidden" name="image_id" id="image_id" />
     <input type="submit" name="insert" id="insert" value="Insert" class="btn btn-info" />
      
    </form>
   </div>
   <div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
   </div>
  </div>
 </div>
</div>
 
<script>  
$(document).ready(function(){
 
 fetch_data();

 function fetch_data()
 {
  var action = "fetch";
  $.ajax({
   url:"action.php",
   method:"POST",
   data:{action:action},
   success:function(data)
   {
    $('#image_data').html(data);
   }
  })
 }
 $('#add').click(function(){
  $('#imageModal').modal('show');
  $('#image_form')[0].reset();
  $('.modal-title').text("Add Image");
  $('#image_id').val('');
  $('#action').val('insert');
  $('#insert').val("Insert");
 });
 $('#image_form').submit(function(event){
  event.preventDefault();
  var image_name = $('#image').val();
  if(image_name == '')
  {
   alert("Please Select Image");
   return false;
  }
  else
  {
   var extension = $('#image').val().split('.').pop().toLowerCase();
   if(jQuery.inArray(extension, ['gif','png','jpg','jpeg']) == -1)
   {
    alert("Invalid Image File");
    $('#image').val('');
    return false;
   }
   else
   {
    $.ajax({
     url:"action.php",
     method:"POST",
     data:new FormData(this),
     contentType:false,
     processData:false,
     success:function(data)
     {
      alert(data);
      fetch_data();
      $('#image_form')[0].reset();
      $('#imageModal').modal('hide');
     }
    });
   }
  }
 });
 $(document).on('click', '.update', function(){
  $('#image_id').val($(this).attr("id"));
  $('#action').val("update");
  $('.modal-title').text("Update Image");
  $('#insert').val("Update");
  $('#imageModal').modal("show");
 });
 $(document).on('click', '.delete', function(){
  var image_id = $(this).attr("id");
  var action = "delete";
  if(confirm("Are you sure you want to remove this image from database?"))
  {
   $.ajax({
    url:"action.php",
    method:"POST",
    data:{image_id:image_id, action:action},
    success:function(data)
    {
     alert(data);
     fetch_data();
    }
   })
  }
  else
  {
   return false;
  }
 });
});  
</script>
