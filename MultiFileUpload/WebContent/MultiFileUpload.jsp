<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<style>


.wrap {width:220px; height:20px;

  display:none; 
 
} 

.file_text {float:left; width:160px; height:20px; background-color:#f6f6f6; border:1px solid #eee; color:#777; text-align: center; font-size: 13px; }

.file_text2 {float:left; width:200px; height:20px; background-color:#f6f6f6; border:1px solid #eee; color:#777; text-align: center; font-size: 13px; }

.file_wrap {display:inline-block; width:40px; height:20px;  background:url(search.png) 0 0 no-repeat;

}
.file_wrap2
{
display:inline-block; width:40px; height:20px;  background:url(search.png) 0 0 no-repeat;

}
li{
height:30px;background-color:blue;width:300px;
}
.file_add {filter:alpha(opacity:0); opacity:0; width:40px; height:20px; }



</style>


 
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
 <script>

//�ϴ� css�� ���δ� �������� ó�� �ϳ� �츮��

$( document ).ready(function() {
	 
	$('#wrap1').show();
	});

var count =0;

function filechange(num,filename,targetObj)
{
	
	 var allowsize = 10*1024*1024;
	 var size = document.getElementById("num"+num).files[0].size;
if(size>allowsize)
{
	alert("������ �ִ� ũ��� '10Mb' �Դϴ�.");
	if (navigator.userAgent.toLowerCase().indexOf("msie") != -1) {
	       $("#num"+num).replaceWith( $("#num"+num).clone(true) );  // ie �϶� �ʱ�ȭ
	     } else {
	      $("#num"+num).val("");
	     }
}
else{
	var ext=filename;
	ext = ext.slice(ext.indexOf(".") + 1).toLowerCase();

	

	if((ext == "jpg" || ext == "png" || ext == "gif" || ext == "bmp" || ext == "jpeg")){
		
		//$('#file_route'+num).val(filename);
		
		var filecheck=document.getElementById('ul_in_filecheck');
		var ff=filecheck.innerHTML;  
		var strFile = filename;
		var lastIndex = strFile.lastIndexOf('\\');
		var strFileName = strFile.substring(lastIndex + 1, strFile.length);

		

		ff=ff+"<li id='li"+num+"'>"+strFileName+" <a href='javascript:cancel("+num+")' ><img src='cancel.png' class='cancelimg'></a></li>";
		filecheck.innerHTML=ff;
		
		$('#wrap'+num).hide(); //�̳��� �����
		
		count++;
		
		for(var i=1;i<6;i++)
		{
			if(($('#num'+i).val())=="")
				{
				$('#wrap'+i).show();
				break;
				}
		}
		
		if(count==5)
			{
			alert("������ 5������ �߰� �����մϴ�.");
			 $('#wrap6').show();
			}
		
		previewImage(targetObj,num);
		
	}
	else{
		alert("jpg, png, bmp, jpge, gif ���ϸ� �ø��� �� �ֽ��ϴ�.");
		
		if (navigator.userAgent.toLowerCase().indexOf("msie") != -1) {
		       $("#num"+num).replaceWith( $("#num"+num).clone(true) );  // ie �϶� �ʱ�ȭ
		     } else {
		      $("#num"+num).val("");
		     }
		
	}
		
}
		}
	

function cancel(num)
{
	
	if(count==5) //5�� �� �÷������� ���� �� �Ф̳���
	{
		 if (navigator.userAgent.toLowerCase().indexOf("msie") != -1) {
		       $("#num"+num).replaceWith( $("#num"+num).clone(true) );  // ie �϶� �ʱ�ȭ
		     } else {
		      $("#num"+num).val("");
		     }
		
		 $('#li'+num).remove();
		   count--;
		   $('#wrap6').hide();
		   $('#wrap'+num).show();
	}
	
	
	else
	{
	   if (navigator.userAgent.toLowerCase().indexOf("msie") != -1) 
	   {
	       $("#num"+num).replaceWith( $("#num"+num).clone(true) );  // ie �϶� �ʱ�ȭ
	     
	       skmagic();
	   } 
	   else
	   {
	       $("#num"+num).val("");
	      
	       skmagic();
	   }
	 
	 
	   $('#li'+num).remove();
	   count--;
	   
	   

    
	   $('#blah'+num).attr('src',"nullimg.png" );
     
       
       reader.readAsDataURL(input.files[0]);
	   
	}
}

function skmagic() //���� ����!
{
	
	for(var i=1;i<6;i++) //���δ� �����
	{
	   $('#wrap'+i).hide();
	}
   
   for(var i=1;i<6;i++) //���� �տ��� ���� ���� �ȵ� ģ���� �ø���
	{
		if(($('#num'+i).val())=="")
			{
			$('#wrap'+i).show();
			break;
			}
	}
}



function previewImage(input,num) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah'+num).attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}



</script>
 
<script>
function checkPost()
{
	window.open("zipcode.jsp","","width=500 height=500 scrollbars=yes");
}

function payo(num)
{
	
	
	if(num=='1')
		{
		document.getElementById("amount").disabled = "true";
		
		}
	else
	{
		document.getElementById("amount").disabled = "";
		
	} 
	}

function gogo(form)
{
	
	
	  if(form.subject.value == null || form.subject.value == ""){
         alert("������ �ݵ�� �Է��ؾ� �մϴ�.<br>������ �Է��ϼ���.");
         form.subject.focus;
         return;
        
      } 
	  if(form.mainimg.value == null || form.mainimg.value == ""){
	         alert("���� ������ �ݵ�� ����ؾ� �մϴ�.");
	         form.subject.focus;
	         return;
	        
	 } 
	 var uploadid = form.id.value;
	  
	
	 form.method="post";
	form.action="control?cmd=modelregisterimpl&uploadid="+uploadid;
	form.submit();	
	
	}


</script>

<script type="text/javascript" src="jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="jquery.doubleSelect.js"></script>
<script type="text/JavaScript">
 $(document).ready(function()
 {
	    var selectoptions = {
    		"����": {
    	         "key" : 10,
                 "defaultvalue" : 111,
    	         "values" : {
                     "������": 110,
                     "������": 111,
                     "���ϱ�": 112
                     }
              },
            "���": {
                 "key" : 20,
                 "defaultvalue" : 212,
                 "values" : {
                     "������ �ȴޱ�": 210,
                     "������ ���뱸": 211,
                     "������ �Ǽ���": 212,
                     "������ ��ȱ�": 213
                     }
              }
    };

	    $('#first').doubleSelect('second', selectoptions); 
	    $('#third').doubleSelect('four', selectoptions);
 });
 
 

function search(){
	$("#search_bar").toggle(1000) ;  
}


</script>

</head>
<body>



<form id="writeForm" enctype="multipart/form-data">
<table border="1" cellpadding="0" cellspacing="0">


<tr>
<td>������ ����
</td>
<td><input type="text" name="subject">
</td>

</tr>
<tr>
<td>���� ����
</td>
<td><input type="file" name="mainimg">
</td>

</tr>
<tr>
<td>���̵�
</td>
<td><input type="text" name="id" readonly="true" >
</td>

</tr>
<tr>
<td>�̸�
</td>
<td><input type="text" name="name" >
</td>

</tr>
<tr>
<td>����
</td>
<td><input type="radio" name="sex" value="man">����
	<input type="radio" name="sex" value="woman">����
</td>
</tr>

<tr>
<td>����
</td>
<td><input type="text" name="age">
</td>
</tr>


<tr>
<td>����ó
</td>
<td><input type="text" name="phone" >
</td>
</tr>




<tr>
<td>�� ����
</td>
<td><input type="text" name="email" >
</td>
</tr>

<tr>
<td>Ȩ������
</td>
<td><input type="text" name="homepage">
</td>
</tr>

<tr>
<td>Ű
</td>
<td><input type="text" name="height">cm
</td>
</tr>

<tr>
<td>������
</td>
<td><input type="text" name="weight">kg
</td>
</tr>
<tr>
<td>���� ������
</td>
<td><select name="topsize"><option value="85">85</option><option value="90">90</option><option value="95">95</option><option value="100">100</option><option value="105">105</option><option value="110">110</option></select>
</td>
</tr>
<tr>
<td>���� ������
</td>
<td><input type="text" name="bottomsize">inch
</td>
</tr>
<tr>
<td>�Ź� ������
</td>
<td><input type="text" name="shoe">mm
</td>
</tr>
<tr>
<td>��� �ٹ��� 1
</td>
<td><select id="first" name="first" size="1"><option value="">--</option></select><select id="second" name="second" size="1"><option value="">--</option></select>
</td>
</tr>
<tr>
<td>��� �ٹ��� 2
</td>
<td><select id="third" name="third" size="1"><option value="">--</option></select><select id="four" name="four" size="1"><option value="">--</option></select>
</td>
</tr>
<tr>
<td>�ּ� �޿�
</td>
<td><select name="pay" size="1" onchange="payo(this.value)">
<option value="1">�޿� ����</option>
<option value="2">�ñ�</option>
<option value="3">�ϱ�</option>
<option value="4">�ֱ�</option>
<option value="5">����</option>
<option value="6">�Ǵ�</option>
</select>
<input type=text name="amount" id="amount">��
</td>
</tr>
<tr>
<td>�� ���
</td>
<td><select  name="experience" size="1">
<option value='0'>��� ����</option>
<option value='1'>3���� �̸�</option>
<option value='2'>6���� �̸�</option>
<option value='3'>1�� �̸�</option>
<option value='4'>1~2��</option>
<option value='5'>2~5��</option>
</select>

</td>
</tr>
<tr>
<td>�Ҽӻ� ����
</td>
<td>
<select  name="management" size="1">
<option value='0'>����</option>
<option value='1'>����</option>

</select>

</td>
</tr>






<tr>
<td>
 
</td>
<td>
<div style="width:350px;height:150px;background-color:red;" id="filecheck">
<ul id="ul_in_filecheck">

</ul>
</div>

    <img id="blah1" src="nullimg.png" alt="your image" style="width:100px;height:100px; margin:10px;" />
    <img id="blah2" src="nullimg.png" alt="your image" style="width:100px;height:100px; margin:10px;" />
    <img id="blah3" src="nullimg.png" alt="your image" style="width:100px;height:100px; margin:10px;" />
    <img id="blah4" src="nullimg.png" alt="your image" style="width:100px;height:100px; margin:10px;" />
    <img id="blah5" src="nullimg.png" alt="your image" style="width:100px;height:100px; margin:10px;" />
</td>
</tr> 

<tr>
<td>
�ڱ� �Ұ�
</td>
<td>
<textarea cols="70" rows="20" name="content"></textarea>
</td>
</tr> 



<tr>
<td colspan="2">
<input type="hidden" name="count" value="0"><input type="button" onclick="gogo(this.form)" value="Ȯ��">
</td>
</tr> 

</table>
</form>


<!-- //���α� -->

	



</body>
</html>