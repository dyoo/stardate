// Stardate script by Phillip L. Sublett
// TrekMaster@TrekGuide.com
// http://TrekGuide.com
// http://TrekGuide.com/Stardates.htm
// An average Earth year comprises 365.2422 mean solar days
// Voyager episode "Homestead" stated Stardate 54868.6 was on April 6, 2378 
// 918.23186 Stardates = 1 year
// 0.00108904956 year = 1.0 Stardate
// 0.397766856 day = 1.0 Stardate
// 34,367.0564 seconds = 1.0 Stardate
// 34367056.4 milliseconds = 1.0 Stardate
// Stardate 00000.0 started on Friday, July 5, 2318, around noon


function StardateThis(form) {

YearInput = eval(form.Year.value)
MonthInput = eval(form.Month.value)
DayInput = eval(form.Date.value)
HourInput = eval(form.Hour.value)
MinuteInput = eval(form.Minute.value)

var StardateOrigin = new Date("July 5, 2318 12:00:00");
var StardateInput = new Date();

StardateInput.setYear(YearInput)
StardateInput.setMonth(MonthInput)
StardateInput.setDate(DayInput)
StardateInput.setHours(HourInput)
StardateInput.setMinutes(MinuteInput)
StardateInput.setSeconds(0)
StardateInput.toGMTString(0)

var findMilliseconds = StardateInput.getTime() - StardateOrigin.getTime();

// 34367056.4 milliseconds = 1.0 Stardate

var findStarYear = findMilliseconds / (34367056.4);

findStarYear = Math.floor(findStarYear * 100);
findStarYear = findStarYear / 100

form.YourChosenDate.value = StardateInput;
form.StarDateOutput.value = findStarYear;
	
return true; 
	}



// 34367056.4 milliseconds = 1.0 Stardate = newStardatesPerYear
// 31556926.1 = 60 * 60 * 24 * 365.2422 = oldStardatesPerYear = 1000 Stardates per year



function CalendarizeThis(form) {

var StardateOrigin = new Date("July 5, 2318 12:00:00");

var StardateIn = eval(document.forms.computeStardate.StardateFromUser.value);

var DateOut = StardateIn * 34367056.4 ;

var ResultMilliseconds = StardateOrigin.getTime() + DateOut;

var ResultDate = new Date();

ResultDate.setTime(ResultMilliseconds);

form.YourStardate.value = StardateIn;
	
form.ComputeDate.value = ResultDate;
	
return true; 
	}
