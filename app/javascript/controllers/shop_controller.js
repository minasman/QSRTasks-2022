import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"


// Connects to data-controller="shop"
export default class extends Controller {
  static targets = ["managerList"]

  connect() {
  }

  manager(e) {
    let store = document.getElementById("shop_store_id").value
    let manager_list = e.target.selectedOptions[0].value
    let target = this.managerListTarget.id
    get(`/shops/manager_list?target=${target}&store=${store}`, {
      responseKind: "turbo-stream"
    })
  }

  shoparea(event) {
    document.getElementById('shopQuestions').style.display = 'block'

    const shopButtons = document.getElementsByClassName('shopRadioButton')
    for (let i = 0; i < shopButtons.length; i++) {
      shopButtons[i].addEventListener('change', score)
    }
    let docNeeded = false

    function countDocs() {
      let docCount = 0
      let docButtons = document.getElementsByClassName('doc')
      for (let n = 0; n < docButtons.length; n++) {
        if (docButtons[n].checked === true) {
          docCount = docCount + 1
        }
      }
      docCount > 0 ? docNeeded = true : docNeeded = false
      return docNeeded
    }

    function score() {
      let scoredButtons = document.getElementsByClassName('shopRadioButton')
      document.getElementById('score').style.display = 'block'
      docNeeded = countDocs();
      let possiblePoints = 0
      let achievedPoints = 0
      for (let i = 0; i < scoredButtons.length; i++) {
        if (scoredButtons[i].checked === true) {
          if (parseInt(scoredButtons[i].value) > 0) {
            achievedPoints = achievedPoints + parseInt(scoredButtons[i].value)
            possiblePoints = possiblePoints + parseInt(scoredButtons[i].value)
          } else if (parseInt(scoredButtons[i].value) === 0) {
            possiblePoints = possiblePoints + parseInt(scoredButtons[i - 1].value)
          } else {}
        }
      }

      let dtWait = parseInt(document.getElementById('shop_waitTime').value)
      let dtResp = parseInt(document.getElementById('shop_responseTime').value)
      let dtPresent = parseInt(document.getElementById('shop_presentTime').value)
      let dtOe = parseInt(document.getElementById('shop_oepTime').value)
      let dtTot = parseInt(document.getElementById('shop_totalTime').value)
      let fcWait = parseInt(document.getElementById('shop_fcWaitTime').value)
      let fcDelivery = parseInt(document.getElementById('shop_fcDeliveryTime').value)
      let fcTot = parseInt(document.getElementById('shop_fcTotalTime').value)
      let curbTot = parseInt(document.getElementById('shop_curbsideTotalTime').value)

      if (dtResp) {
        if (dtResp <= 10) {
          achievedPoints = achievedPoints + 5
          possiblePoints = possiblePoints + 5
        } else {
          possiblePoints = possiblePoints + 5
          docNeeded = true
        }
      }

      if (dtPresent) {
        if (dtPresent <= 15) {
          achievedPoints = achievedPoints + 5
          possiblePoints = possiblePoints + 5
        } else {
          possiblePoints = possiblePoints + 5
        }
      }

      if (dtOe) {
        if (dtOe <= 172) {
          achievedPoints = achievedPoints + 10
          possiblePoints = possiblePoints + 10
        } else if (dtOe <= 300) {
          possiblePoints = possiblePoints + 10
        } else {
          possiblePoints = possiblePoints + 10
          docNeeded = true
        }
      }

      if (dtTot) {
        if (dtTot <= 450) {
          achievedPoints = achievedPoints + 10
          possiblePoints = possiblePoints + 10
        } else if (dtTot <= 600) {
          possiblePoints = possiblePoints + 10
        } else {
          possiblePoints = possiblePoints + 10
          docNeeded = true
        }
      }

      if (dtWait) {
        if (dtWait <= 70) {
          achievedPoints = achievedPoints + 5
          possiblePoints = possiblePoints + 5
        } else {
          possiblePoints = possiblePoints + 5
        }
      }

      if (fcWait) {
        if (fcWait <= 90) {
          achievedPoints = achievedPoints + 10
          possiblePoints = possiblePoints + 10
        } else {
          possiblePoints = possiblePoints + 10
        }
      }

      if (fcDelivery) {
        if (fcDelivery <= 135) {
          achievedPoints = achievedPoints + 10
          possiblePoints = possiblePoints + 10
        } else if (fcDelivery <= 300) {
          possiblePoints = possiblePoints + 10
        } else {
          possiblePoints = possiblePoints + 10
          docNeeded = true
        }
      }

      if (fcTot) {
        if (fcTot <= 450) {
          achievedPoints = achievedPoints + 10
          possiblePoints = possiblePoints + 10
        } else if (fcTot <= 600) {
          possiblePoints = possiblePoints + 10
        } else {
          possiblePoints = possiblePoints + 10
          docNeeded = true
        }
      }

      if (curbTot) {
        if (curbTot <= 300) {
          achievedPoints = achievedPoints + 10
          possiblePoints = possiblePoints + 10
        } else if (fcTot <= 600) {
          possiblePoints = possiblePoints + 10
        } else {
          possiblePoints = possiblePoints + 10
          docNeeded = true
        }
      }

      document.getElementById('score').innerHTML = `${possiblePoints} Points Possible & ${achievedPoints} Points Achieved<br>Score: ${(parseFloat(achievedPoints / possiblePoints) * 100).toFixed(2)}%<br>Documentation: ${docNeeded ? "May Be Required" : "Not Required"}`
      document.getElementById('shop_docRequired').value = (parseFloat(achievedPoints / possiblePoints) * 100).toFixed(2) >= 90.00 ? false : docNeeded
      document.getElementById('shop_possiblePoints').value = possiblePoints
      document.getElementById('shop_achievedPoints').value = achievedPoints
      document.getElementById('shop_score').value = `${(parseFloat(achievedPoints / possiblePoints) * 100).toFixed(2)}`

    }

    const fc_timers = document.getElementById('fc')
    const dt_timers = document.getElementById('dt')
    const curbside_timers = document.getElementById('curbside')
    const delivery_timers = document.getElementById('delivery')
    const service_questions = document.getElementsByClassName('service')
    //const dt_questions = document.getElementsByClassName('dt')
    const curbside_questions = document.getElementsByClassName('curbside')
    const delivery_questions = document.getElementsByClassName('delivery')
    if (event.target.value == 'Drive Thru') {
      for (let i = 0; i < service_questions.length; i++) {
        service_questions[i].style.display = 'block'
      }
      for (let i = 0; i < curbside_questions.length; i++) {
        curbside_questions[i].style.display = 'none'
      }
      for (let i = 0; i < delivery_questions.length; i++) {
        delivery_questions[i].style.display = 'none'
      }
      fc_timers.style.display = 'none'
      dt_timers.style.display = 'block'
      curbside_timers.style.display = 'none'
      delivery_timers.style.display = 'none'
      attachDtTimers()
    } else if (event.target.value == 'Front Counter') {
      for (let i = 0; i < service_questions.length; i++) {
        service_questions[i].style.display = 'block'
      }
      for (let i = 0; i < curbside_questions.length; i++) {
        curbside_questions[i].style.display = 'none'
      }
      for (let i = 0; i < delivery_questions.length; i++) {
        delivery_questions[i].style.display = 'none'
      }
      fc_timers.style.display = 'block'
      dt_timers.style.display = 'none'
      curbside_timers.style.display = 'none'
      delivery_timers.style.display = 'none'
      attachFcTimers()
    } else if (event.target.value == 'Curbside') {
      for (let i = 0; i < service_questions.length; i++) {
        service_questions[i].style.display = 'none'
      }
      for (let i = 0; i < curbside_questions.length; i++) {
        curbside_questions[i].style.display = 'block'
      }
      for (let i = 0; i < delivery_questions.length; i++) {
        delivery_questions[i].style.display = 'none'
      }
      fc_timers.style.display = 'none'
      dt_timers.style.display = 'none'
      curbside_timers.style.display = 'block'
      delivery_timers.style.display = 'none'
      attachCurbsideTimers()
    } else if (event.target.value == 'Delivery') {
      for (let i = 0; i < service_questions.length; i++) {
        service_questions[i].style.display = 'none'
      }
      for (let i = 0; i < curbside_questions.length; i++) {
        curbside_questions[i].style.display = 'none'
      }
      for (let i = 0; i < delivery_questions.length; i++) {
        delivery_questions[i].style.display = 'block'
      }
      fc_timers.style.display = 'none'
      dt_timers.style.display = 'none'
      curbside_timers.style.display = 'none'
      delivery_timers.style.display = 'block'
    } else {
      for (let i = 0; i < service_questions.length; i++) {
        service_questions[i].style.display = 'none'
      }
      for (let i = 0; i < curbside_questions.length; i++) {
        curbside_questions[i].style.display = 'none'
      }
      for (let i = 0; i < delivery_questions.length; i++) {
        delivery_questions[i].style.display = 'none'
      }
      fc_timers.style.display = 'none'
      dt_timers.style.display = 'none'
      curbside_timers.style.display = 'none'
      delivery_timers.style.display = 'none'
    }

    function attachDtTimers() {
      document.getElementById('startButton').addEventListener('click', startDT)
      document.getElementById('codButton').addEventListener('click', startCOD)
      document.getElementById('greetedButton').addEventListener('click', startGreet)
      document.getElementById('oeButton').addEventListener('click', startOE)
      document.getElementById('cashierButton').addEventListener('click', startCash)
      document.getElementById('changeButton').addEventListener('click', startChange)
      document.getElementById('presentButton').addEventListener('click', startPresent)
      document.getElementById('pulledButton').addEventListener('click', startPf)
      document.getElementById('endButton').addEventListener('click', endDT)

      document.getElementById("codButton").setAttribute("disabled", "true")
      document.getElementById("greetedButton").setAttribute("disabled", "true")
      document.getElementById("oeButton").setAttribute("disabled", "true")
      document.getElementById("cashierButton").setAttribute("disabled", "true")
      document.getElementById("changeButton").setAttribute("disabled", "true")
      document.getElementById("presentButton").setAttribute("disabled", "true")
      document.getElementById("pulledButton").setAttribute("disabled", "true")
      document.getElementById("endButton").setAttribute("disabled", "true")


      const startDTTimer = document.getElementById("orderStart");
      const startCODTimer = document.getElementById("atcod");
      const startGreetTimer = document.getElementById("greeted");
      const startOETimer = document.getElementById("orderend");
      const startCashTimer = document.getElementById("atcash");
      const startChangeTimer = document.getElementById("change");
      const startPresentTimer = document.getElementById("atpresent");
      const startPfTimer = document.getElementById("pulledfwd");
      const totalDTTimer = document.getElementById("total");

      let startDTPFInterval, startDTTotalInterval, startDTInterval, startDTCODInterval, startDTGreetInterval, startDTOEInterval, startDTCashInterval, startDTChangeInterval, startDTPresentInterval

      function startDT() {
        document.getElementById("codButton").disabled = false
        let dtStart = new Date().getTime();
        startDTTotalInterval = setInterval(getShowTime, 1000, dtStart, totalDTTimer);
        startDTInterval = setInterval(getShowTime, 1000, dtStart, startDTTimer);
        document.getElementById("startButton").setAttribute("disabled", "true");
      }

      function startCOD() {
        document.getElementById("greetedButton").disabled = false
        let dtCODStart = new Date().getTime();
        startDTCODInterval = setInterval(getShowTime, 1000, dtCODStart, startCODTimer);
        clearInterval(startDTInterval)
        document.getElementById("codButton").setAttribute("disabled", "true");
      }

      function startGreet() {
        document.getElementById("oeButton").disabled = false
        let dtGreetStart = new Date().getTime();
        startDTGreetInterval = setInterval(getShowTime, 1000, dtGreetStart, startGreetTimer);
        clearInterval(startDTCODInterval)
        document.getElementById("greetedButton").setAttribute("disabled", "true")
      }

      function startOE() {
        document.getElementById("cashierButton").disabled = false
        let dtOEStart = new Date().getTime();
        startDTOEInterval = setInterval(getShowTime, 1000, dtOEStart, startOETimer);
        clearInterval(startDTGreetInterval)
        document.getElementById("oeButton").setAttribute("disabled", "true")
      }

      function startCash() {
        document.getElementById("changeButton").disabled = false
        let dtCashStart = new Date().getTime();
        startDTCashInterval = setInterval(getShowTime, 1000, dtCashStart, startCashTimer);
        clearInterval(startDTOEInterval)
        document.getElementById("cashierButton").setAttribute("disabled", "true")
      }

      function startChange() {
        document.getElementById("presentButton").disabled = false
        let dtChangeStart = new Date().getTime();
        startDTChangeInterval = setInterval(getShowTime, 1000, dtChangeStart, startChangeTimer);
        clearInterval(startDTCashInterval)
        document.getElementById("changeButton").setAttribute("disabled", "true")
      }

      function startPresent() {
        document.getElementById("pulledButton").disabled = false
        document.getElementById("endButton").disabled = false
        let dtPresentStart = new Date().getTime();
        startDTPresentInterval = setInterval(getShowTime, 1000, dtPresentStart, startPresentTimer);
        clearInterval(startDTChangeInterval)
        document.getElementById("presentButton").setAttribute("disabled", "true")
      }

      function startPf() {
        let dtPullForwardStart = new Date().getTime();
        startDTPFInterval = setInterval(getShowTime, 1000, dtPullForwardStart, startPfTimer);
        clearInterval(startDTPresentInterval)
        document.getElementById("pulledButton").setAttribute("disabled", "true")
      }

      function endDT() {
        clearInterval(startDTTotalInterval)
        clearInterval(startDTPresentInterval)
        if (startDTPFInterval) {
          clearInterval(startDTPFInterval)
        }
        document.getElementById('shop_waitTime').value = startDTTimer.innerHTML || 0;
        document.getElementById('shop_responseTime').value = startCODTimer.innerHTML || 0;
        document.getElementById('shop_presentTime').value = (parseInt(startPresentTimer.innerHTML) || 0) + (parseInt(startPfTimer.innerHTML) || 0);
        document.getElementById('shop_oepTime').value =
        (parseInt(startOETimer.innerHTML) || 0) +
        (parseInt(startCashTimer.innerHTML) || 0) +
        (parseInt(startChangeTimer.innerHTML) || 0) +
        (parseInt(startPfTimer.innerHTML) || 0) +
        (parseInt(startPresentTimer.innerHTML) || 0);
        document.getElementById('shop_pullForwardTime').value = startPfTimer.innerHTML || 0;
        document.getElementById('shop_totalTime').value = totalDTTimer.innerHTML || 0;
        document.getElementById("pulledButton").setAttribute("disabled", "true");
        document.getElementById("endButton").setAttribute("disabled", "true");
      }
    }

    function getShowTime(startTime, timerCell){
      let updatedTime = new Date().getTime();
      let seconds = Math.floor((updatedTime - startTime)/1000);
      timerCell.innerHTML = seconds;
    }

    function attachFcTimers() {
      // Timer Buttons
      document.getElementById('fcstartbutton').addEventListener('click', startFC);
      document.getElementById('fcgreetbutton').addEventListener('click', startFCGreet);
      document.getElementById('fcorderbutton').addEventListener('click', startFCOrder);
      document.getElementById('fcchangebutton').addEventListener('click', startFCChange);
      document.getElementById('fcdonebutton').addEventListener('click', endFC);
      //Disables Buttons
      document.getElementById("fcgreetbutton").setAttribute("disabled", "true");
      document.getElementById("fcorderbutton").setAttribute("disabled", "true");
      document.getElementById("fcchangebutton").setAttribute("disabled", "true");
      document.getElementById("fcdonebutton").setAttribute("disabled", "true");

      // Table cells to display time
      const startFCTimer = document.getElementById("fcstart");
      const startFCGreetTimer = document.getElementById("fcgreeted");
      const startFCOETimer = document.getElementById("fcordercomplete");
      const startFCChangeTimer = document.getElementById("fcchange");
      const totalFCTimer = document.getElementById("fcdone");

      let startFCInterval, startGreetInterval, startOrderInterval, startChangeInterval, startFCTotalInterval

      function startFC() {
        document.getElementById("fcgreetbutton").disabled = false;
        let fcStart = new Date().getTime();
        startFCTotalInterval = setInterval(getShowTime, 1000, fcStart, totalFCTimer);
        startFCInterval = setInterval(getShowTime, 1000, fcStart, startFCTimer);
        document.getElementById("fcstartbutton").setAttribute("disabled", "true");
      }

      function startFCGreet() {
        document.getElementById("fcorderbutton").disabled = false;
        let greetStart = new Date().getTime();
        startGreetInterval = setInterval(getShowTime, 1000, greetStart, startFCGreetTimer);
        clearInterval(startFCInterval);
        document.getElementById("fcgreetbutton").setAttribute("disabled", "true");
      }

      function startFCOrder() {
        document.getElementById("fcchangebutton").disabled = false;
        let orderStart = new Date().getTime();
        startOrderInterval = setInterval(getShowTime, 1000, orderStart, startFCOETimer);
        clearInterval(startGreetInterval);
        document.getElementById("fcorderbutton").setAttribute("disabled", "true");
      }

      function startFCChange() {
        document.getElementById("fcdonebutton").disabled = false;
        let changeStart = new Date().getTime();
        startChangeInterval = setInterval(getShowTime, 1000, changeStart, startFCChangeTimer);
        clearInterval(startOrderInterval);
        document.getElementById("fcchangebutton").setAttribute("disabled", "true");
      };

      function endFC() {
        clearInterval(startFCTotalInterval);
        clearInterval(startChangeInterval);
        document.getElementById('shop_fcWaitTime').value = startFCTimer.innerHTML || 0;
        document.getElementById('shop_fcDeliveryTime').value = startFCChangeTimer.innerHTML || 0;
        document.getElementById('shop_fcTotalTime').value = totalFCTimer.innerHTML || 0;
        document.getElementById("fcdonebutton").setAttribute("disabled", "true");
      };
    }

    function attachCurbsideTimers() {
      // Timer Buttons
      document.getElementById('curbstartbutton').addEventListener('click', startCurb);
      document.getElementById('curbdonebutton').addEventListener('click', endCurb);
      //Disables Buttons
      document.getElementById("curbdonebutton").setAttribute("disabled", "true");
      // Table cells to display time
      const startCurbTimer = document.getElementById("curbstart");
      const totalCurbTimer = document.getElementById("curbdone");

      let startCurbInterval, startTotalCurbInterval

      function startCurb() {
        document.getElementById("curbdonebutton").disabled = false;
        let curbStart = new Date().getTime();
        startTotalCurbInterval = setInterval(getShowTime, 1000, curbStart, totalCurbTimer);
        startCurbInterval = setInterval(getShowTime, 1000, curbStart, startCurbTimer);
        document.getElementById("curbstartbutton").setAttribute("disabled", "true");
      }
      function endCurb() {
        clearInterval(startTotalCurbInterval);
        clearInterval(startCurbInterval);
        document.getElementById('shop_curbsideTotalTime').value = totalCurbTimer.innerHTML || 0;
        document.getElementById("curbdonebutton").setAttribute("disabled", "true");
      };
    }
  }

}
