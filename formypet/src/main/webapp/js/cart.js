/*체크박스*/
$(function(){
    var listAll = $("input[type='checkbox'].agreechkAll");    //전체 클릭하는 엘리먼트에 .agreechkAll 클랙스가 추가되어야 한다.
    var list = $("input[type='checkbox'].chack");    //각각 클릭하는 엘리먼트에 .chack 클랙스가 추가되어야 한다.
    var common = {
        allCheck : function(e){ 
            if($(e.target).prop("checked") === true) { 
                //해당화면에 전체 checkbox들을 체크한다 
                list.prop("checked",true);
            } else if($(e.target).prop("checked") === false){
                //해당화면에 모든 checkbox들의 체크를해제 한다. 
                list.prop("checked",false);
            }
        },
        check : function(e){
            if($(e.target).prop("checked") === true){
                $(e.target).prop("checked", true)
            }
            if($(e.target).prop("checked") === false){
                $(e.target).prop("checked", false)
                listAll.prop('checked', false);
            }
            // 각자 하나씩 선택시 자동으로 전채선택도 활성화 시키기
            var size = list.filter(':checked').length;
                if(size == list.length) {
                    listAll.prop("checked", true);
                } else {
                    listAll.prop("checked", false);
                }
            },
        }

    $('.cart_table').on('click','.agreechkAll', common.allCheck)
    $('.cart_table').on('click','.chack', common.check)
    
    
 
});




   
   
/**
 * 
 */