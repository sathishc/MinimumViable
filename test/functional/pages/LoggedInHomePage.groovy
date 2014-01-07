package pages

import org.openqa.selenium.Keys
import org.openqa.selenium.interactions.Actions
import org.openqa.selenium.WebDriver
import geb.Browser

class LoggedInHomePage extends ScaffoldPage {
    static url = "/test"



    static at = {
        title == 'Indian Horoscope Matching & Daily Predictions. Vedic Astrology for All. Fun, Free and Simple'
    }

    static content = {

        birthChartHeadingButton { $("div#birthDetailsHeading a.accordion-toggle") }
        selfTimePicker { $('input#SelfTimePickControl')}
        selfRequestBirthChartButton { $('input#SelfRequestBirthChartButton')}

        compatibilityHeadingButton { $("div#compatibilityDetailsHeading a.accordion-toggle") }
        getCompatibilityChartButton { $("button.checkCompatibilityButton") }
        compatibilityTable { $('div#compatibilityChart table.table') }
        compatibilityRows { compatibilityTable.find("tbody").find("tr") }
        compatibilityTypeSelector { $('select#partnerOneType') }


        //downArrayDoubleKeyDown {actions.keyDown(Keys.DOWN).keyDown(Keys.DOWN)}


        helpPopupButton { $("a.popupHelpCloseButton") }
    }
}

