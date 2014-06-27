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

//일단 css로 전부다 숨겼으니 처음 하나 살리고

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
	alert("파일의 최대 크기는 '10Mb' 입니다.");
	if (navigator.userAgent.toLowerCase().indexOf("msie") != -1) {
	       $("#num"+num).replaceWith( $("#num"+num).clone(true) );  // ie 일때 초기화
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
		
		$('#wrap'+num).hide(); //이놈은 숨기고
		
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
			alert("파일은 5개까지 추가 가능합니다.");
			 $('#wrap6').show();
			}
		
		previewImage(targetObj,num);
		
	}
	else{
		alert("jpg, png, bmp, jpge, gif 파일만 올리실 수 있습니다.");
		
		if (navigator.userAgent.toLowerCase().indexOf("msie") != -1) {
		       $("#num"+num).replaceWith( $("#num"+num).clone(true) );  // ie 일때 초기화
		     } else {
		      $("#num"+num).val("");
		     }
		
	}
		
}
		}
	

function cancel(num)
{
	
	if(count==5) //5개 다 올려놓구선 지울 때 ㅠㅜ나쁜
	{
		 if (navigator.userAgent.toLowerCase().indexOf("msie") != -1) {
		       $("#num"+num).replaceWith( $("#num"+num).clone(true) );  // ie 일때 초기화
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
	       $("#num"+num).replaceWith( $("#num"+num).clone(true) );  // ie 일때 초기화
	     
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

function skmagic() //석구 매직!
{
	
	for(var i=1;i<6;i++) //전부다 숨기고
	{
	   $('#wrap'+i).hide();
	}
   
   for(var i=1;i<6;i++) //가장 앞에서 아직 선택 안된 친구를 올리고
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
         alert("제목은 반드시 입력해야 합니다.<br>제목을 입력하세요.");
         form.subject.focus;
         return;
        
      } 
	  if(form.mainimg.value == null || form.mainimg.value == ""){
	         alert("메인 사진은 반드시 등록해야 합니다.");
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
    		"서울": {
    	         "key" : 10,
                 "defaultvalue" : 111,
    	         "values" : {
                     "강남구": 110,
                     "강동구": 111,
                     "강북구": 112
                     }
              },
            "경기": {
                 "key" : 20,
                 "defaultvalue" : 212,
                 "values" : {
                     "수원시 팔달구": 210,
                     "수원시 영통구": 211,
                     "수원시 권선구": 212,
                     "수원시 장안구": 213
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
<td>프로필 제목
</td>
<td><input type="text" name="subject">
</td>

</tr>
<tr>
<td>메인 사진
</td>
<td><input type="file" name="mainimg">
</td>

</tr>
<tr>
<td>아이디
</td>
<td><input type="text" name="id" readonly="true" >
</td>

</tr>
<tr>
<td>이름
</td>
<td><input type="text" name="name" >
</td>

</tr>
<tr>
<td>성별
</td>
<td><input type="radio" name="sex" value="man">남자
	<input type="radio" name="sex" value="woman">여자
</td>
</tr>

<tr>
<td>나이
</td>
<td><input type="text" name="age">
</td>
</tr>


<tr>
<td>연락처
</td>
<td><input type="text" name="phone" >
</td>
</tr>




<tr>
<td>이 메일
</td>
<td><input type="text" name="email" >
</td>
</tr>

<tr>
<td>홈페이지
</td>
<td><input type="text" name="homepage">
</td>
</tr>

<tr>
<td>키
</td>
<td><input type="text" name="height">cm
</td>
</tr>

<tr>
<td>몸무게
</td>
<td><input type="text" name="weight">kg
</td>
</tr>
<tr>
<td>상의 사이즈
</td>
<td><select name="topsize"><option value="85">85</option><option value="90">90</option><option value="95">95</option><option value="100">100</option><option value="105">105</option><option value="110">110</option></select>
</td>
</tr>
<tr>
<td>하의 사이즈
</td>
<td><input type="text" name="bottomsize">inch
</td>
</tr>
<tr>
<td>신발 사이즈
</td>
<td><input type="text" name="shoe">mm
</td>
</tr>
<tr>
<td>희망 근무지 1
</td>
<td><select id="first" name="first" size="1"><option value="">--</option></select><select id="second" name="second" size="1"><option value="">--</option></select>
</td>
</tr>
<tr>
<td>희망 근무지 2
</td>
<td><select id="third" name="third" size="1"><option value="">--</option></select><select id="four" name="four" size="1"><option value="">--</option></select>
</td>
</tr>
<tr>
<td>최소 급여
</td>
<td><select name="pay" size="1" onchange="payo(this.value)">
<option value="1">급여 협의</option>
<option value="2">시급</option>
<option value="3">일급</option>
<option value="4">주급</option>
<option value="5">월급</option>
<option value="6">건당</option>
</select>
<input type=text name="amount" id="amount">원
</td>
</tr>
<tr>
<td>총 경력
</td>
<td><select  name="experience" size="1">
<option value='0'>경력 없음</option>
<option value='1'>3개월 미만</option>
<option value='2'>6개월 미만</option>
<option value='3'>1년 미만</option>
<option value='4'>1~2년</option>
<option value='5'>2~5년</option>
</select>

</td>
</tr>
<tr>
<td>소속사 유무
</td>
<td>
<select  name="management" size="1">
<option value='0'>없음</option>
<option value='1'>있음</option>

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
자기 소개
</td>
<td>
<textarea cols="70" rows="20" name="content"></textarea>
</td>
</tr> 



<tr>
<td colspan="2">
<input type="hidden" name="count" value="0"><input type="button" onclick="gogo(this.form)" value="확인">
</td>
</tr> 

</table>
</form>


<!-- //감싸기 -->

	



</body>
</html>