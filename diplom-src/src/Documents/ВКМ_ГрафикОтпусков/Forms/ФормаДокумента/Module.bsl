
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
		Для Каждого СтрокаГрафика Из Объект.ОтпускаСотрудников Цикл
		
		СтрокаГрафика.КоличествоДней = (СтрокаГрафика.ДатаОкончания - СтрокаГрафика.ДатаНачала) / 86400;
		
	КонецЦикла;
	
	УстановитьУсловноеОформление();	
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ПоказатьГрафикОтпусков(Команда)
	
	АдресДанных = ПолучитьАдресДанныхДляОткрытияФормы();
	
	ПараметрыОткрытияНовойФормы = Новый Структура;
	ПараметрыОткрытияНовойФормы.Вставить("АдресДанных", АдресДанных);
	
	ОткрытьФорму("Документ.ВКМ_ГрафикОтпусков.Форма.ФормаДокументаДоп", ПараметрыОткрытияНовойФормы, 
					Элементы.ОтпускаСотрудников,,,,,РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);						
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура УстановитьУсловноеОформление()
	
	Оформление = УсловноеОформление.Элементы.Добавить();
	Оформление.Использование = Истина;
	
	Поле1 = Оформление.Поля.Элементы.Добавить();
	Поле1.Поле = Новый ПолеКомпоновкиДанных("ОтпускаСотрудниковНомерСтроки");
	Поле2 = Оформление.Поля.Элементы.Добавить();
	Поле2.Поле = Новый ПолеКомпоновкиДанных("ОтпускаСотрудниковСотрудник");
	Поле3 = Оформление.Поля.Элементы.Добавить();
	Поле3.Поле = Новый ПолеКомпоновкиДанных("ОтпускаСотрудниковДатаНачала");
	Поле4 = Оформление.Поля.Элементы.Добавить();
	Поле4.Поле = Новый ПолеКомпоновкиДанных("ОтпускаСотрудниковДатаОкончания");	
	
	Отбор = Оформление.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	Отбор.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Объект.ОтпускаСотрудников.КоличествоДней");
	Отбор.ПравоеЗначение = 28;
	Отбор.ВидСравнения = ВидСравненияКомпоновкиДанных.Больше;
	Отбор.Использование = Истина;
	Оформление.Оформление.УстановитьЗначениеПараметра("ЦветФона", WebЦвета.Аквамарин);
	
КонецПроцедуры

&НаСервере
Функция ПолучитьАдресДанныхДляОткрытияФормы()
	
	ПараметрыОткрытия = Новый Массив;
	ПараметрыОткрытия.Добавить(Объект.Год);
	ПараметрыОткрытия.Добавить(Объект.ОтпускаСотрудников.Выгрузить());
	
	Возврат ПоместитьВоВременноеХранилище(ПараметрыОткрытия);
	
КонецФункции

#КонецОбласти
