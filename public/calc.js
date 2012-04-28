$(document).ready(function() {
			function selCalc(){
				nSelCalc=$("#selCalc").val();		
				if (nSelCalc == 0){
				$("#summa").css("display","none");
				$("#pPriceFind").css("display","none");
				$("#pPriceFindComb").css("display","none");
				$("#pSpeedFind").css("display","none");
				$("#pSpeedReg").css("display","none");
				$("#usl1").css("display","none");
				$("#usl2").css("display","none");
					
					$("#calc").css("display","none");
					$("#calc2").css("display","none");
					
				}
				
				if (nSelCalc == 1){
				$("#summa").css("display","none");
				$("#pPriceFind").css("display","none");
				$("#pPriceFindComb").css("display","none");
				$("#pSpeedFind").css("display","none");
				$("#pSpeedReg").css("display","none");
					$("#usl1").css("display","none");
				$("#usl2").css("display","none");
					$("#calc").css("display","block");
					$("#calc2").css("display","none");
					
				}
				if (nSelCalc == 2 || nSelCalc == 3){
				$("#summa").css("display","none");
				$("#pPriceFind").css("display","none");
				$("#pPriceFindComb").css("display","none");
				$("#pSpeedFind").css("display","none");
				$("#pSpeedReg").css("display","none");
					$("#calc").css("display","none");
					$("#calc2").css("display","block");
					$("#usl1").css("display","none");
				$("#usl2").css("display","none");
				}
				
			}
		//Обработка скрытия срока исполнения
		$('#selCalc').change(selCalc);


			var template = /(^([0-9])*\.[0-9]*$)|(^([0-9])*$)/ //Шаблон проверки, является ли строка числом
			var vid=$("#vid").val();				//Вид товарного знака
			var countClass=$("#countClass").val();	//Количество классов МКТУ
			var findTrue=$("#findTrue").val();		//Полный патентный поиск(нужен/нет)
			var countFind=$("#countFind").val();	//Полный патентный поиск(Количество дней)
			var reg=$("#reg").val();				//Срок регистрации ТЗ
			var curs=$("#insert_rate_RUB_1328965094").text(); //Курс доллара
			var sum=0;								//Сумма
			//Функция обработки скрытия срока исполнения
			function fCountFind(){
				findTrue=$("#findTrue").val();		//Полный патентный поиск(нужен/нет)
				if (findTrue == 0){
					$("#countFind").attr("disabled","disabled");
				}else{
					$("#countFind").removeAttr("disabled");	
				}
			}
			//Функция обработки выбора вида элемента
			function fVid(){
				
				vid=$("#vid").val();				//Вид товарного знака
				var day=$("#day").text();
				if (vid == 1){
					$("#countFind").html($(" <option value=\"1\">1-2 "+day+"</option> <option value=\"2\" selected=\"selected\">3-4"+day +"</option> "));
				}else{
					$("#countFind").html(" <option value=\"2\">3-4 "+day+"</option> <option value=\"3\" selected=\"selected\">8-10 "+day+"</option> ");
				}
				
			}
		
		$("#buttonCalc").click(function(){
			$("#summa").css("display","none");
				$("#pPriceFind").css("display","none");
				$("#pPriceFindComb").css("display","none");
				$("#pSpeedFind").css("display","none");
				$("#pSpeedReg").css("display","none");
				$("#usl1").css("display","none");
				$("#usl2").css("display","none");
			sum=0;							//Сумма
			vid=$("#vid").val();				//Вид товарного знака
			countClass=$("#countClass").val();	//Количество классов МКТУ
			findTrue=$("#findTrue").val();		//Полный патентный поиск(нужен/нет)
			countFind=$("#countFind").val();	//Полный патентный поиск(Количество дней)
			reg=$("#reg").val();				//Срок регистрации ТЗ
			curs=30;							//Текущий курс доллара
			var uslugi=0;	//Наши услуги
			var poshlini=0; //Пошлины
			var speedReg=0; //Ускоренная регистрация
			var priceFind=0;//Стоимость поиска
			var speedFind=0;// Ускорение поиска
			var comb = false;//Используется ли комбинированный поиск
			//Нужен ли полный патентный поиск
			if ( findTrue == 1){
			//Используется полный патентный поиск
			
				//Словесный вид
				if (vid == 1){
					sum += 7500;
				}
				
				//Изобразительный
				if (vid == 2){
					sum += 9000;
				}
				
				//Комбинированный
				if (vid == 3){
					sum += 16500;
					comb = true;
				}
				
				//Если КОЛИЧЕСТВО классов МКТУ > 5
				if (countClass > 5){
					sum +=  (countClass - 5) * 50*curs;	
				}
				//Стоимость поиска
				priceFind=sum;
				//Словесный вид и патентный поиск 1-2 дня
				if (vid == 1 && countFind == 1){
					//Стоимость ускоренного поиска
					speedFind=sum;
					sum *=2;
					
				}
				
				//Изобразительный или комбинированный вид и патентный поиск 3-4 дня
				if ((vid == 2 || vid == 3) && countFind == 2){
					//Стоимость ускоренного поиска
					speedFind=sum;
					sum *=2;
					
				}
				sum+=400*curs;
				//Ниши услуги
				uslugi=400*curs;
				
				
				sum +=  10500;
				
				poshlini+=10500;
				//Если КОЛИЧЕСТВО классов МКТУ > 1
				if (countClass > 1){
					sum += 	countClass*1500 - 1500;
					poshlini+=countClass*1500 - 1500;
				}
				//Если Срок регистрации ТЗ 8-9 месяцев
				if (reg == 2){
					sum += (1000*curs);
					speedReg+=(1000*curs);
				}
				
				//Если Срок регистрации ТЗ 12-14 месяцев
				if (reg == 3){
					sum += (0*curs);
					speedReg+=(0*curs);
				}
				
			}else{
			//Полный патентный поиск неиспользуется
				sum+=400*curs;
				//Ниши услуги
				uslugi=400*curs;
				
				sum +=  10500;
				
				poshlini+=10500;
				//Если КОЛИЧЕСТВО классов МКТУ > 1
				if (countClass > 1){
					sum += 	countClass*1500 - 1500;
					poshlini+=countClass*1500 - 1500;
				}
				//Если Срок регистрации ТЗ 8-9 месяцев
				if (reg == 2){
					sum += (1000*curs);
					speedReg+=(1000*curs);
				}
				
				//Если Срок регистрации ТЗ 12-14 месяцев
				if (reg == 3){
					sum += 0;
					speedReg+=0;
				}
			}
			
			$("#summa").css("display","block");
			$("#sum").html(sum);
			$("#usl1").css("display","block");
			$("#uslugi1").html(uslugi);
			$("#poshlini").html(poshlini);
			if (speedReg>0){
				
				$("#pSpeedReg").css("display","block");
				$("#speedReg").html(speedReg);
			}
			//При наличии ускорения стоимости поиска, нужная сумма прибавляется к стоимости поиска
			priceFind += speedFind;
			if (priceFind>0){
				
				if (comb) {
					$("#pPriceFindComb").css("display","block");
					$("#priceFindSlov").html(7500);
					$("#priceFindIzob").html(9000);
				}else{
					$("#pPriceFind").css("display","block");
					$("#priceFind").html(priceFind);	
				} 
				 
			}
		});
		$("#calc2 #buttonCalc").click(function(){
			$("#summa").css("display","none");
				$("#pPriceFind").css("display","none");
				$("#pPriceFindComb").css("display","none");
				$("#pSpeedFind").css("display","none");
				$("#pSpeedReg").css("display","none");
			sum=0;							//Сумма
		
			countClass=$("#calc2 #countClass").val();	//Количество классов МКТУ
			reg=$("#calc2 #reg").val();				//Срок регистрации ТЗ
			curs=30;								//Текущий курс доллара
			
			var uslugi=0;	//Наши услуги
			var poshlini=0; //Пошлины
			var speedReg=0; //Ускоренная регистрация
			var priceFind=0;//Стоимость поиска
			var speedFind=0;// Ускорение поиска
			var comb = false;//Используется ли комбинированный поиск
			
			uslugi = 300*curs;
			poshlini = 10000;
			if (countClass > 1){
				uslugi +=  (countClass -1)*75*curs;
				poshlini += (countClass-1)*8000;
			}
			
			if (reg == 1){
				speedReg = 700*curs;
				speedReg += (countClass-1)*350*curs;
			}
			
			sum = uslugi+poshlini+speedReg;
			$("#summa").css("display","block");
			
			$("#usl2").css("display","block");
			$("#sum").html(sum);
			$("#uslugi2").html(uslugi);
			$("#poshlini").html(poshlini);
			if (speedReg>0){
				
				$("#pSpeedReg").css("display","block");
				$("#speedReg").html(speedReg);
			}
			//При наличии ускорения стоимости поиска, нужная сумма прибавляется к стоимости поиска
			priceFind += speedFind;
			if (priceFind>0){
				
				if (comb) {
					$("#pPriceFindComb").css("display","block");
					$("#priceFindSlov").html(7500);
					$("#priceFindIzob").html(9000);
				}else{
					$("#pPriceFind").css("display","block");
					$("#priceFind").html(priceFind);	
				} 
				 
			}
		});
		
		//Обработка скрытия срока исполнения
		$('#findTrue').change(fCountFind);
		//Обработка выбора вида товара
		$('#vid').change(fVid);
		
		
})