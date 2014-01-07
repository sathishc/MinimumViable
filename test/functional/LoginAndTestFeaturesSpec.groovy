import pages.*

import geb.spock.GebReportingSpec
import spock.lang.Stepwise
import org.openqa.selenium.Keys
import org.openqa.selenium.interactions.Actions

@Stepwise
class LoginAndTestFeaturesSpec extends GebReportingSpec {

    def "Browse Logged In Page and Close popup"() {
        when:
            to LoggedInHomePage
            helpPopupButton.click()

        then:
            at LoggedInHomePage
    }

    def "Change Birth Chart details"() {
        when:
        if(selfTimePicker != '08:30'){
            selfTimePicker = '08:30'
        }else{
            selfTimePicker = '09:30'
        }
        waitFor{
            selfRequestBirthChartButton.click()
        }
        then:
        waitFor {
            title == title
        }
    }

    def "Go to compatibility Tab and get chart"() {
        when:
            compatibilityHeadingButton.click()
            getCompatibilityChartButton.click()
        then:
            waitFor {
                compatibilityRows.size() == 12
            }
    }



    def "Get chart between two entered details"() {
        when:
        //compatibilityHeadingButton.click()
        compatibilityTypeSelector.click()
        compatibilityTypeSelector << Keys.chord(Keys.ARROW_DOWN,Keys.ARROW_DOWN,Keys.ARROW_DOWN,Keys.RETURN)
        //compatibilityTypeSelector.click()
        //compatibilityTypeSelector << Keys.chord(Keys.ENTER)

        waitFor{
            getCompatibilityChartButton.click()
        }

        then:
        waitFor {
            compatibilityRows.size() == 12
        }
    }

}