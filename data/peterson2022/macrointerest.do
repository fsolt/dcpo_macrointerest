set more off

use "macrointerest_R.dta"
**unit root tests
dfuller interest, noconstant lags(1)
dfuller interest, noconstant 
pperron interest, noconstant
**interest has a unit root

dfuller trust , noconstant lags(1)
dfuller trust , noconstant 
dfuller trust
pperron trust , noconstant 

**trust has a unit root

dfuller prapp , noconstant lags(1)
dfuller prapp , noconstant 
pperron prapp , noconstant 

dfuller ics , noconstant lags(1)
dfuller ics , noconstant 
pperron ics , noconstant 



**granger causality

reg interest l.interest l.l.interest l.trust l.l.trust
test l.trust l.l.trust
**trust Granger causes Interest


reg trust l.trust l.l.trust l.interest l.l.interest
test l.interest l.l.interest

*interest does not Granger cause trust



**Are these cointegrated.

**Engle-Granger two step method
**step 1: estimate regression
reg interest trust, 
**collect residuals
capture drop resid
predict resid, resid
**test for stationarity of residuals

dfuller resid, nocons lags(1)
pperron resid, nocons lags(1)


egranger interest trust

** these are not the right critical values, but still reject the null of unit root.

**unit root tests of other variables
dfuller ics, noconstant lags(1)
dfuller prapp, noconstant lags(1)


**Granger tests for other variables

reg interest l.interest l.l.interest l.ics l.l.ics
test l.ics l.l.ics

reg interest l.interest l.l.interest l.prapp l.l.prapp
test l.prapp l.l.prapp

reg ics l.ics l.l.trust l.interest l.l.interest
test l.interest l.l.interest

reg prapp l.prapp l.l.trust l.interest l.l.interest
test l.interest l.l.interest

**Run Error correction model

reg d.interest l.interest l.trust d.trust l.ics d.ics l.prapp d.prapp water-katrina panama iraq pgw prezcamp 

**are residuals white noise?
capture drop ECMresid
predict ECMresid, resid
wntestq ECMresid
armadiag ECMresid

**yes. 

**Calculate LRM and standard error

nlcom _b[l.trust]/(-1*_b[l.interest])
nlcom _b[l.ics]/(-1*_b[l.interest])
nlcom _b[l.prapp]/(-1*_b[l.interest])


**test the joint hypothesis of ICS and PRAPP 
test l.ics d.ics
test l.prapp d.prapp 
 
**LDV model
reg interest l.interest  l.trust l.ics l.prapp water-katrina panama iraq pgw prezcamp 

reg d.interest d.trust d.ics d.prapp water-katrina panama iraq pgw prezcamp

**test for limiting to pre-2013
reg d.interest l.interest l.trust d.trust l.ics d.ics l.prapp d.prapp water-katrina panama iraq pgw prezcamp if year<2013
**test only after 1977
reg d.interest l.interest l.trust d.trust l.ics d.ics l.prapp d.prapp water-katrina panama iraq pgw prezcamp if year>1977
**test after 1977 and before 2013
reg d.interest l.interest l.trust d.trust l.ics d.ics l.prapp d.prapp water-katrina panama iraq pgw prezcamp if year>1977 & year<2013
 

**Phillips bounds method
**run the ECM
reg d.interest l.interest l.trust d.trust water-katrina prezcamp 

**test white noise residuals

capture drop tempresid
predict tempresid, resid
wntestq tempresid
armadiag tempresid



**white noise in other results


**test lag length?

reg d.interest l.interest l.trust d.trust 
est store AIC
estimates stats *


reg d.interest l.interest l.trust d.trust l.l.interest l.l.trust
est store AIC
estimates stats *


**BIC says one lag is better



**Do bounds test 

reg d.interest l.interest l.trust d.trust 

test l.interest l.trust

pssbounds, obs(166) fstat(7) k(2) case(3) tstat(-3.72)





**test lag length?

reg d.interest l.interest l.trust d.trust 
est store AIC
estimates stats *


reg d.interest l.interest l.trust d.trust l.l.interest l.l.trust
est store AIC
estimates stats *


**BIC says one lag is worse

reg d.interest l.interest l.trust d.trust l.l.interest l.l.trust l.l.l.interest l.l.l.trust
est store AIC
estimates stats *

**both say three lags is worse
