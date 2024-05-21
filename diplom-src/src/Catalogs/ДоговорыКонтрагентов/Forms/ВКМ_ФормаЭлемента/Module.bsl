
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
    ГруппаПериод = Элементы.Добавить("АбонентскоеОбслуживание", Тип("ГруппаФормы"), Элементы.ГруппаАбонентскоеОбслуживание);
	ГруппаПериод.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаПериод.ГоризонтальноеПоложениеВГруппе = ГоризонтальноеПоложениеЭлемента.Авто;

	ПолеВвода = Элементы.Добавить("ПериодС", Тип("ПолеФормы"),ГруппаПериод);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ВКМ_ДатаНачала";
	
	ПолеВвода = Элементы.Добавить("По", Тип("ПолеФормы"), ГруппаПериод);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ВКМ_ДатаОкончания";
	
	ПолеВвода = Элементы.Добавить("АбонентскаяПлата", Тип("ПолеФормы"), Элементы.ГруппаАбонентскоеОбслуживание);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ВКМ_АбонентскаяПлата";
	
	ПолеВвода = Элементы.Добавить("СтоимостьЧасаРаботы", Тип("ПолеФормы"), Элементы.ГруппаАбонентскоеОбслуживание);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ВКМ_СтоимостьЧасаРаботы";
		
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
Если Объект.ВидДоговора = ПредопределенноеЗначение("Перечисление.ВидыДоговоровКонтрагентов.ВКМ_АбонентскоеОбслуживание") Тогда
		
		Элементы.ГруппаАбонентскоеОбслуживание.Видимость = Истина;
	Иначе
		Элементы.ГруппаАбонентскоеОбслуживание.Видимость = Ложь;
	
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ВидДоговораПриИзменении(Элемент)
	
	Если Объект.ВидДоговора = ПредопределенноеЗначение("Перечисление.ВидыДоговоровКонтрагентов.ВКМ_АбонентскоеОбслуживание") Тогда
		
		Элементы.ГруппаАбонентскоеОбслуживание.Видимость = Истина;
	Иначе
		Элементы.ГруппаАбонентскоеОбслуживание.Видимость = Ложь;
	
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

