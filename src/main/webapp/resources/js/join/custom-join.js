$(document).ready(function() {

    // 매장정보 불러오기
    $(document).on('click', '.v_store', function() {
        var sid = $(this).attr("sid");

        $.ajax({
            type : "POST",
            url : "ajax/ajax_modal_store.asp",
            data : "sid=" + sid,
            dataType : "html",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            error: function(html) {
                alert("ajaxCall_edit Error!");
            },
            success: function(html) {
                $("#view_store").html(html);
            }
        });
    });

    // 채용검색 시도 옵션 채우기
    $("#search-modal").on('show.bs.modal', function(e) {
        $.ajax({
            type : "POST",
            url : "ajax/ajax_modal_area_1st.asp",
            dataType : "html",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            error: function(html) {
                alert("ajaxCall_edit Error!");
            },
            success: function(html) {
                $("#area1").html(html);
            }
        });
    });

    // 시도 옵션 채우기
    $(document).on('change', '#area1', function(e) {
        var cido = $(this).val();
        $.ajax({
            type : "POST",
            data : "cido=" + cido,
            url : "ajax/ajax_modal_area_2nd.asp",
            dataType : "html",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            error: function(html) {
                alert("ajaxCall_edit Error!");
            },
            success: function(html) {
                $("#area2").html(html);
            }
        });
    });

    $("#confirm_again").click(function() {
		 var m_pass = jQuery("#frm").serialize();

        $.ajax({
            type : "POST",
            data	: m_pass,
            url : "ajax/ajax_pass_confirm.asp",
            dataType : "html",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            error: function(html) {
                alert("ajaxCall_edit Error!");
            },
            success: function(html) {
                if (html == "success") {
                    //alert('');
                    location.href = 'member_info.asp';
                } else {
                    //alert(html);
                    alert('비밀번호가 일치하지 않습니다.');
                }
            }
        });
    });


    // 적성테스트 값 넘기기
    $("#test_submit").click(function(e) {
        var ans2 = $('input:radio[name="ans2"]:checked').val();  //1번 응답
        var ans4 = $('input:radio[name="ans4"]:checked').val();  //2번 응답
        var ans5 = $('input:radio[name="ans5"]:checked').val();  //3번 응답
        var ans8 = $('input:radio[name="ans8"]:checked').val();  //4번 응답
        var ans9 = $('input:radio[name="ans9"]:checked').val();  //5번 응답
        var ans12 = $('input:radio[name="ans12"]:checked').val();//6번 응답
        var ans13 = $('input:radio[name="ans13"]:checked').val();//7번 응답
        var ans16 = $('input:radio[name="ans16"]:checked').val();//8번 응답
        var ans18 = $('input:radio[name="ans18"]:checked').val();//9번 응답
        var ans19 = $('input:radio[name="ans19"]:checked').val();//10번 응답

        if ($('input:radio[name="ans2"]:checked').length < 1) {
            alert('1번 질문에 응답해주세요.');
            $("#ans2").focus();
            return false;
        }

        if ($('input:radio[name="ans4"]:checked').length < 1) {
            alert('2번 질문에 응답해주세요.');
            $("#ans4").focus();
            return false;
        }

        if ($('input:radio[name="ans5"]:checked').length < 1) {
            alert('3번 질문에 응답해주세요.');
            $("#ans5").focus();
            return false;
        }

        if ($('input:radio[name="ans8"]:checked').length < 1) {
            alert('4번 질문에 응답해주세요.');
            $("#ans8").focus();
            return false;
        }

        if ($('input:radio[name="ans9"]:checked').length < 1) {
            alert('5번 질문에 응답해주세요.');
            $("#ans9").focus();
            return false;
        }

        if ($('input:radio[name="ans12"]:checked').length < 1) {
            alert('6번 질문에 응답해주세요.');
            $("#ans12").focus();
            return false;
        }

        if ($('input:radio[name="ans13"]:checked').length < 1) {
            alert('7번 질문에 응답해주세요.');
            $("#ans13").focus();
            return false;
        }

        if ($('input:radio[name="ans16"]:checked').length < 1) {
            alert('8번 질문에 응답해주세요.');
            $("#ans16").focus();
            return false;
        }

        if ($('input:radio[name="ans18"]:checked').length < 1) {
            alert('9번 질문에 응답해주세요.');
            $("#ans18").focus();
            return false;
        }

        if ($('input:radio[name="ans19"]:checked').length < 1) {
            alert('10번 질문에 응답해주세요.');
            $("#ans19").focus();
            return false;
        }

        var ans2 = $('input:radio[name="ans2"]:checked').val();  //1번 응답
        var ans4 = $('input:radio[name="ans4"]:checked').val();  //2번 응답
        var ans5 = $('input:radio[name="ans5"]:checked').val();  //3번 응답
        var ans8 = $('input:radio[name="ans8"]:checked').val();  //4번 응답
        var ans9 = $('input:radio[name="ans9"]:checked').val();  //5번 응답
        var ans12 = $('input:radio[name="ans12"]:checked').val();//6번 응답
        var ans13 = $('input:radio[name="ans13"]:checked').val();//7번 응답
        var ans16 = $('input:radio[name="ans16"]:checked').val();//8번 응답
        var ans18 = $('input:radio[name="ans18"]:checked').val();//9번 응답
        var ans19 = $('input:radio[name="ans19"]:checked').val();//10번 응답

        $("#answer2").val(ans2);
        $("#answer4").val(ans4);
        $("#answer5").val(ans5);
        $("#answer8").val(ans8);
        $("#answer9").val(ans9);
        $("#answer12").val(ans12);
        $("#answer13").val(ans13);
        $("#answer16").val(ans16);
        $("#answer18").val(ans18);
        $("#answer19").val(ans19);
        $("#apt_test").val('실시완료');

        $("#test-modal").modal('hide');
    });

    // 지원모달창 띄우기 (수정용 임시 : 20170605)
    $(".btn_apply_20170605").click(function(e) {
        var idx = $(this).attr("idx");
        $.ajax({
            type : "POST",
            data : "idx=" + idx,
            url : "ajax/ajax_modal_apply_20170605.asp",
            dataType : "html",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            error: function(html) {
                alert("ajaxCall_edit Error!");
            },
            success: function(html) {
                if (html=='exist') {
                    alert('이미 지원하신 모집공고입니다.');
                    $("#apply-modal").modal('hide');
                } else {
                    $("#modal_apply_content_20170605").html(html);
                }

            }
        });
    });

    // 지원모달창 띄우기
    $(".btn_apply").click(function(e) {
        var idx = $(this).attr("idx");
        $.ajax({
            type : "POST",
            data : "idx=" + idx,
            url : "ajax/ajax_modal_apply.asp",
            dataType : "html",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            error: function(html) {
                alert("ajaxCall_edit Error!");
            },
            success: function(html) {
                if (html=='exist') {
                    alert('이미 지원하신 모집공고입니다.');
                    $("#apply-modal").modal('hide');
                } else {
                    $("#modal_apply_content").html(html);
                }

            }
        });
    });

    // 최종 지원 버튼 (수정용 임시 : 20170605)
    $(document).on('click', '.btn_apply_confirm_20170605', function(e) {

        if ($('input:radio[name="division"]:checked').length < 1) {
            alert('모집구분을 선택해주세요.');
            $("#division1").focus();
            return false;
        }
		
        if ($("#m_route").val()=='') {
            alert('지원경로를 선택해주세요.');
            $("#m_route").focus();
            return false;
        }
		
		if ($("#cnt_test_yn").val()=='n')
		{
			if ($("#apt_test").val()=='') {
				alert('적성테스트를 실시해주세요.');
				$("#apt_test").focus();
				return false;
			}
		}
		
		if ($('input:radio[name="m_reason"]:checked').length < 1) {
            alert('지원동기를 선택해주세요.');
            $("#m_reason").focus();
            return false;
        }

		if($('input:radio[name="m_reason"]:checked').val() == "etc")
		{
			if ($("#m_reason_memo").val()=='') {
				alert('코멘트를 입력하세요.');
				$("#m_reason_memo").focus();
				return false;
			}
		}

		if ($('input:radio[name="m_bohun"]:checked').length < 1) {
            alert('보훈 대상 여부를 선택해주세요.');
            $("#m_bohun").focus();
            return false;
        }
			
		if($('input:radio[name="m_bohun"]:checked').val() == "yes")
		{
			if ($("#m_bohun_num").val()=='') {
				alert('보훈 번호를 입력하세요.');
				$("#m_bohun_num").focus();
				return false;
			}
		}
		
		if ($("#apply_responsibility").is(":checked")==false) {
            alert('사실내용 작성에 대한 책임에 동의해주세요.');
            $("#apply_responsibility").focus();
            return false;
        }

        if ($("#personal_info").is(":checked")==false) {
            alert('개인정보처리방침에 동의해주세요.');
            $("#personal_info").focus();
            return false;
        }

		$(".apply_hide").hide();
		$(".span_loading").show();

        var idx = $(this).attr("idx");
        var params = $("#frm_apply_final").serialize() + "&idx=" + idx;
		//alert(params);
        $.ajax({
            type : "POST",
            data : params,
            url : "ajax/ajax_modal_apply_process_20170605.asp",
            dataType : "html",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            error: function(html) {
                alert("ajaxCall_edit Error!");
            },
            success: function(html) {
                alert("해당 공고에 지원 완료하였습니다.");
                $("#apply-modal_20170605").modal('hide');
            }
        });

    });


    // 최종 지원 버튼
    $(document).on('click', '.btn_apply_confirm', function(e) {

        if ($('input:radio[name="division"]:checked').length < 1) {
            alert('모집구분을 선택해주세요..');
            $("#division1").focus();
            return false;
        }

        if ($("#m_route").val()=='') {
            alert('지원경로를 선택해주세요.');
            $("#m_route").focus();
            return false;
        }

		if ($("#cnt_test_yn").val()=='n')
		{
			if ($("#apt_test").val()=='') {
				alert('적성테스트를 실시해주세요.');
				$("#apt_test").focus();
				return false;
			}
		}

		if ($('input:radio[name="m_reason"]:checked').length < 1) {
            alert('지원동기를 선택해주세요.');
            $("#m_reason").focus();
            return false;
        }

		if($('input:radio[name="m_reason"]:checked').val() == "etc")
		{
			if ($("#m_reason_memo").val()=='') {
				alert('코멘트를 입력하세요.');
				$("#m_reason_memo").focus();
				return false;
			}
		}

		if ($('input:radio[name="m_bohun"]:checked').length < 1) {
            alert('보훈 대상 여부를 선택해주세요.');
            $("#m_bohun").focus();
            return false;
        }

		if($('input:radio[name="m_bohun"]:checked').val() == "yes")
		{
			if ($("#m_bohun_num").val()=='') {
				alert('보훈 번호를 입력하세요.');
				$("#m_bohun_num").focus();
				return false;
			}
		}

		if ($("#apply_responsibility").is(":checked")==false) {
            alert('사실내용 작성에 대한 책임에 동의해주세요.');
            $("#apply_responsibility").focus();
            return false;
        }

        if ($("#personal_info").is(":checked")==false) {
            alert('개인정보처리방침에 동의해주세요.');
            $("#personal_info").focus();
            return false;
        }

		$(".apply_hide").hide();
		$(".span_loading").show();

        var idx = $(this).attr("idx");
        var params = $("#frm_apply_final").serialize() + "&idx=" + idx;
        $.ajax({
            type : "POST",
            data : params,
            url : "ajax/ajax_modal_apply_process.asp",
            dataType : "html",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            error: function(html) {
                alert("ajaxCall_edit Error!");
            },
            success: function(html) {
                alert("해당 공고에 지원 완료하였습니다.");
                $("#apply-modal").modal('hide');
            }
        });

    });

    // 주소 검색(다음)
    $(document).on( "click", "#zip_find", function( e ) {

        $addressType   = $(this).attr("addressType");
        $zip           = $(this).attr("zip");
        $zip1          = $(this).attr("zip1");
        $zip2          = $(this).attr("zip2");
        $address       = $(this).attr("address");
        $address1      = $(this).attr("address1");
        $address2      = $(this).attr("address2");
        $addressOption = $(this).attr("addressOption");
        $focus         = $(this).attr("focus");

        openDaumPostcode($addressType, $zip, $zip1, $zip2, $address, $address1, $address2, $addressOption, $focus);
    });

});


function openDaumPostcode(addrType, zip, zip1, zip2, addr, addr1, addr2, addrOpt, addrFocus) {
    new daum.Postcode({
        oncomplete: function(data) {
            var fullAddr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                fullAddr = data.roadAddress;

            } else {
                fullAddr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){

                if(data.bname !== ''){
                    extraAddr += data.bname;
                }

                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }



            if ( addrType != "" && addrType != undefined ) {
                document.getElementById(addrType).value = data.userSelectedType;
            }
            if ( zip != "" && zip != undefined ) {
                document.getElementById(zip).value = data.zonecode;
            }
            if ( addr != "" && addr != undefined ) {
                document.getElementById(addr).value = fullAddr;
            }
            if ( addr1 != "" && addr1 != undefined ) {
                document.getElementById(addr1).value = fullAddr;
            }

            if ( addrFocus != "" && addrFocus != undefined ) {
                document.getElementById(addrFocus).focus();
            }
        }
    }).open();
}




