function getUrlCodeJson(httpCode, httpsCode, location){
	return  {"http:": {"urlCode" : httpCode},
		 	 "https:" : {"urlCode" : httpsCode},
	         "location" : location
		};
}

function sleep (delay) {
   var start = new Date().getTime();
   while (new Date().getTime() < start + delay);
}


var KmcCert = {
	form_data: null,
	getUrlCode : function(seq, json){
		var hostname = self.location.hostname;
		var pathname = self.location.pathname;
		var protocol = self.location.protocol;
		var url = self.location.href;
		
		var urlCode = "";
		var location = "";
		
		
		if( !(hostname == "stg.mcdonalds.co.kr" || hostname == "mstg.mcdonalds.co.kr" || hostname=="m.mcdonalds.co.kr")) {
			hostname = "mcdonalds.co.kr"
		}
		
		var data={}
		
		if( pathname.indexOf("/kor/main.do") != -1){
			
			data["stg.mcdonalds.co.kr"]  =  getUrlCodeJson("003002","006002","main");
			data["mstg.mcdonalds.co.kr"] =  getUrlCodeJson("007002","008002","main");
			data["m.mcdonalds.co.kr"]    =  getUrlCodeJson("002003","005002","main");
			data["mcdonalds.co.kr"]      =  getUrlCodeJson("001002","004002","main");
		
		} else if(pathname.indexOf("/kor/promotion/list.do") != -1){
		
			data["stg.mcdonalds.co.kr"]  = getUrlCodeJson("003001","006001","promotion_list");
			data["mstg.mcdonalds.co.kr"] = getUrlCodeJson("007001","008001","promotion_list");
			data["m.mcdonalds.co.kr"]    = getUrlCodeJson("002003","005001","promotion_list");
			data["mcdonalds.co.kr"]      = getUrlCodeJson("001001","004001","promotion_list");
		} else if( pathname.indexOf("/kor/promotion/detail.do") != -1) {
			
			data["stg.mcdonalds.co.kr"]  = getUrlCodeJson("003003","006003","promotion_detail");
			data["mstg.mcdonalds.co.kr"] = getUrlCodeJson("007003","008005","promotion_detail");
			data["m.mcdonalds.co.kr"]    = getUrlCodeJson("002006","005006","promotion_detail");
			data["mcdonalds.co.kr"]      = getUrlCodeJson("001005","004004","promotion_detail");

		} else if( pathname.indexOf("/gmal/kor") != -1){

			data["m.mcdonalds.co.kr"]    = getUrlCodeJson("002004","005003","gmal");
		} else if( pathname.indexOf("identity.do") != -1){

			data["m.mcdonalds.co.kr"]    = getUrlCodeJson("002005","005004","identity");
		}
		 		
		if(json == "json"){
			this.form_data =  {"urlCode" : data[hostname][protocol]["urlCode"],
		               "location" : data[hostname]["location"],
		               "seq" : seq
		              };
			return this.form_data;
		} else {
			return urlCode;
		}
	}, 
	setCookie : function(name, value, exp){
		var date = new Date();
        
		date.setTime(date.getTime() + (exp*60*60*1000) );
        var expires = "; expires=" + date.toUTCString();

        document.cookie = name + "=" + (value || "")  + expires + "; path=/";
	},
	
	getCookie : function(name){
	   
		  var match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
		  if (match) return match[2];
		  
		  return null;
	},

	isCookieExist : function(data){
		var name = null;
		if( typeof data == 'string'){
			name = data;
		} else {
			name = "_prm_"+data["seq"];
		}
		return (this.getCookie(name) !== null);
	},

	getTargetUrl : function(){
		return self.location.protocol+"//"+self.location.host+"/cert/result.do";
	}
}