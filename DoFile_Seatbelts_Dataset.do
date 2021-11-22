/* STATA PROJECT */

/*
 * Dataset: Seatbelt
 * Group: 17
 * Abhijith Babu Raj: 1076068
 * Ettore Falde: 1076181
 * Simona Lorenzi: 1046338
 */
 
*** IMPORTANT NOTE FOR THE NEWBIES: the comment code is not complides, so it don't influence the efficiency of our study
 
 
/*
 * 1. INTRODUCTION
 * description...telling that summarize() is equal to su()
 * You can also write: summarize varname1 varname1
 */
	/*
	 * 1.1 RESEARCH QUESTIONS
	 * The main questions the we decided to reported are: 
	 * i) Does the usage of seat belts reduce the fatality rate?
	 * ii) How the first and secondary enforcement influence the behaviours of the drivers like seat belts usage. 
	 * iii) How the alcohol street regulations influence the speed limit and the fatality rate?
	 */
	
	/*
	 * 1.2 SUMMARIZE OF THE RESEARCH QUESTIONS AND OUR CONTRIBUTION
	 */
	 
	/*
	 * 1.3 PLAN OF THE PAPER
	 */
 
/*
 * 2. DATA
 * Here we describe our dataset, describing its type, its variables and the 
 * main relationships among them. In order to obtain a better overview of
 * our projects and understanding for furter models and analysis. 
 */

    /*
	 * 2.1 THE SAMPLE
	 * Seatbelts is a balanced panel from 50 U.S. States, plus the District of Columbia, 
	 * for the years 1983-1997. These data were provided by Professor Liran Einav of 
	 * Stanford University and were used in his paper with Alma Cohen “The Effects 
	 * of Mandatory Seat Belt Laws on Driving Behavior and Traffic Fatalities,
	 * ” The Review of Economics and Statistics, 2003, Vol. 85, No. 4, pp 828-843
	 *
	 * In addition our datase is a Panel Data, which have different observatoins
	 * across states and different observation of time. 
	 */
	 
	 *** brief description of the data that we have
	 *** the "xtdescribe" for panel data description of the dataset
	 xtset fips year
	 xtdescribe
	 *** the "d" command is an abbreviation of "des" or "description"
	 d
	 
	 *** Stata view of our dataset description...telling that summarize() 
	 *** is equal to su() You can also write: summarize varname1 varname1
	 su()
	 *** Even if when we have a panel data we usually do this command
	 xtsum
	 
	/*
	 * 2.2 VARIABLES
	 * With a differentiation between dependent variable and the independent one, 
	 * we can make also differnet edits to the dataset in order to make a better
	 * uderstanding of the meaning of our study.
	 */
	 
		/*
		 * 2.2.1 DEPENDENT VARIABLES
		 * In our case are: fatalityrate and sb_usage
		 * 
		 * Definition of Dependent Variable: a variable (often denoted by y ) whose value depends on that of another.
		 * - Oxford Languages - 
		 */
		 
		 *** FATALITYRATE ***
		 
		 /* Labeling it due to was not explained before */
		 label variable fatalityrate "Number of fatalities per million of traffic miles"
		 su sb_useage
		 su sb_usage_mean_year
		 su sb_useage_mean_fips
		 /* Set Stata in order to be shre that it is able to handle a panel data for our work. */
		 xtset fips year
		 
		 /* Showing the evolution of the fatalityrate value across time for each state. */
		 xtline fatalityrate
		 
		 /* Showing the evolution of the fatalityrate value across time for each state. 
		 This time we obtained a graph with a messy view...not very clear in all its values. Even so, the decreasing vlues of fatalityrate is very clear. */
		 xtline fatalityrate, overlay
		 
		 /* Creating a mean variabile of fatalityrate across states (ordered),  and then shoing the values in a very clear graph */
		 *** Further modification was done in the graph editor. 
		 bysort fips: egen fatalityrate_mean_fips=mean(fatalityrate)
		 twoway scatter fatalityrate fips, msymbol(circle_hollow) || connected fatalityrate_mean_fips fips, msymbol(diamond)
		 
		 /* Creating a mean variabile of fatalityrate across years (ordered),  and then shoing the values in a very clear graph */
		 bysort year: egen fatalityrate_mean_year=mean(fatalityrate)
		 twoway scatter fatalityrate year, msymbol(circle_hollow) || connected fatalityrate_mean_year year, msymbol(diamond) || , xlabel(1983(1)1997)
		 
		 *****************
		 *****************
		 
		 *** SB_USAGE ***
		 
		 /* Labeling it due to was not explained before */
		 label variable sb_useage "Seat belt useage rate"
		 
		 
		 /* Showing the evolution of the sb_useage value across time for each state. */
		 xtline sb_useage
		 
		 /* Showing the evolution of the sb_useage value across time for each state. 
		 This time we obtained a graph with a messy view...not very clear in all its values. Even so, the decreasing vlues of fatalityrate is very clear. */
		 xtline sb_useage, overlay
		 
		 /* Creating a mean variabile of sb_useage across states (ordered),  and then shoing the values in a very clear graph */
		 *** Further modification was done in the graph editor. 
		 bysort fips: egen sb_useage_mean_fips=mean(sb_useage)
		 twoway scatter sb_useage fips, msymbol(circle_hollow) || connected sb_useage_mean_fips fips, msymbol(diamond)
		 
		 /* Creating a mean variabile of sb_useage across years (ordered),  and then shoing the values in a very clear graph */
		 bysort year: egen sb_usage_mean_year=mean(sb_useage)
		 twoway scatter sb_useage year, msymbol(circle_hollow) || connected sb_usage_mean_year year, msymbol(diamond) || , xlabel(1983(1)1997)
		 
		/*
		 * 2.2.1 INDEPENDENT VARIABLES
		 * In our case are: state, year, fips, vmt, speed65, speed70, drinkage21, ba08, income, age, primary, secondary
		 * Definition of Independent Variable: is a variable that is being manipulated in an experiment in order to observe the effect on a dependent variable, sometimes called an outcome variable.
		 * - https://statistics.laerd.com/statistical-guides/types-of-variable.php - 
		 */
		 
		 *** SPEED65 ***
		 
		 /* Labeling it due to was not explained before */
		 label variable speed65 "Dummy variable for 65 mile per hour speed limit"
		 
		 /* Tab, showing that in the majority of cases in our dataset there is a speed limit 65 acorss years and states*/
		 *** Note: tab is an abbreviation of the tabulate command.
		 xttab speed65
		 
		 /* Doing a more meaningful view of the speed65 variable across years */
		 tab speed65 year, column
		 
		 *****************
		 *****************
		 
		 *** SPEED70 ***
		 
		 /* Labeling it due to was not explained before */
		 label variable speed70 "Dummy variable for 70 or higher mile per hour speed limit"
		 
		 /* Tab, showing that in the majority of cases in our dataset there is a speed limit 70 acorss years and states*/
		 *** Note: tab is an abbreviation of the tabulate command.
		 xttab speed70
		 
		 /* Doing a more meaningful view of the speed70 variable across years */
		 tab speed70 year, column
		 
		 *****************
		 *****************
		 
		 *** DRINKAGE21 ***
		 
		 /* Labeling it due to was not explained before */
		 label variable drinkage21 "Dummy variable for age 21 drinking age"
		 
		 /* Tab, showing that in the majority of the cases in our dataset there is a drinkage21 regulations adopted by the majority of states acorss years */
		 *** Note: tab is an abbreviation of the tabulate command.
		 xttab drinkage21
		 
		 /* Doing a more meaningful view of the drinkage21 variable across years */
		 tab drinkage21 year, column
		 
		 *****************
		 *****************
		 
		 *** BA08 ***
		 
		 /* Labeling it due to was not explained before */
		 label variable ba08 "Binary variable for blood alcohol limit ≤ .08%"
		 
		 /* Tab, showing that in the majority of cases in our dataset there are more 0 values = non adoption of ba08 
		 regulation vs. 1 values = adoption of ba08 regulations. Even if at the end, all the states decied to impose this driving rule. */
		 *** Note: tab is an abbreviation of the tabulate command.
		 xttab ba08
		 
		 /* Doing a more meaningful view of the ba08 variable across years */
		 tab ba08 year, column
		 
		 *****************
		 *****************
		 
		 *** PRIMARY ***
		 
		 /* Labeling it due to was not explained before */
		 label variable primary "Binary variable for primary enforcement of seat belt laws"
		 
		 /* Tab, showing that in the majority of cases in our dataset the primary enforcement wasn't available */
		 *** Note: tab is an abbreviation of the tabulate command.
		 xttab primary
		 
		 /* Doing a more meaningful view of the primary variable across years */
		 tab primary year, column
		 
		 *****************
		 *****************
		 
		 *** SECONDARY ***
		 
		 /* Labeling it due to was not explained before */
		 label variable secondary "Binary variable for secondary enforcement of seat belt laws"
		 
		 /* Tab, showing that in almost half of the cases in our dataset the secondary enforcement wasn't available */
		 *** Note: tab is an abbreviation of the tabulate command.
		 xttab secondary
		 
		 /* Doing a more meaningful view of the secondary variable across years */
		 tab secondary year, column
		 
		 *****************
		 *****************
		 
		 *** INCOME ***
		 
		 /* Labeling it due to was not explained before */
		 label variable income "Per capita income"
		 
		 /* Histogram, showing the density of income. Plus, a bit of stylish code of the graph */
		 *** Note: tab is an abbreviation of the tabulate command.
		 histogram income, fcolor(ltblue) lcolor(blue)addlabel
		 
		 /* Creating a mean variabile of income across states (ordered),  and then shoing the values in a very clear graph */
		 *** Further modification was done in the graph editor. 
		 bysort fips: egen income_mean_fips=mean(income)
		 twoway scatter income fips, msymbol(circle_hollow) || connected income_mean_fips fips, msymbol(diamond)
		 
		 
		 /* Doing a more meaningful view of the average income variable across years */
		 bysort year: egen income_mean_year=mean(income)
		 twoway scatter income year, msymbol(circle_hollow) || connected income_mean_year year, msymbol(diamond) || , xlabel(1983(1)1997)
		 
		 *****************
		 *****************
		 
		 *** AGE ***
		 
		 /* Labeling it due to was not explained before */
		 label variable age "Mean age"
		 
		 /* Histogram, showing the density of the age variable. Plus, a bit of stylish code of the graph */
		 *** Note: tab is an abbreviation of the tabulate command.
		 histogram age, fcolor(ltblue) lcolor(blue)addlabel
		 
		 
		 *****************
		 *****************
		 
		 *** STATE ***
		 
		 /* Labeling it due to was not explained before */
		 label variable state "State Initials"
		 
		 /* Show all the states without duplicates */
		 levelsof state
		 
		 *****************
		 *****************
		 
		 *** YEAR ***
		 
		 /* Labeling it due to was not explained before */
		 label variable year "Year of data collection"
		 
		 /* Show all the years without duplicates */
		 levelsof year
		 
		 *****************
		 *****************
		 
		 *** VMT ***
		 
		 /* Labeling it due to was not explained before */
		 label variable vmt "Millions of traffic miles per year."
		 
		 /* Creating a mean variabile of vmt across states (ordered),  and then shoing the values in a very clear graph */
		 *** Further modification was done in the graph editor. 
		 bysort fips: egen vmt_mean_fips=mean(vmt)
		 twoway scatter vmt fips, msymbol(circle_hollow) || connected vmt_mean_fips fips, msymbol(diamond)
		 
		 
		 /* Doing a more meaningful view of the average vmt variable across years */
		 bysort year: egen vmt_mean_year=mean(vmt)
		 twoway scatter vmt year, msymbol(circle_hollow) || connected vmt_mean_year year, msymbol(diamond) || , xlabel(1983(1)1997)
		 
		 *****************
		 *****************
		 
		 *** FIPS ***
		 
		 /* Labeling it due to was not explained before */
		 label variable fips "State code" /// this one was correctly into the db
		 
		 
/*
 * 3. STATISTICAL AND ECONOMETRIC METHODS
 * In this part of the project we will discuss the different types of regression
 * models, tests and commands done. 
 */

    /*
	 * 3.1 THE SAMPLE
	 * The three possibile models for our dataset, which is a panel data are:
	 * Pooled OLS, Fixed Effect Model and Random model
	 */
	 
	 *** Poled OLS 
	 reg fatalityrate sb_useage vmt speed65 speed70 drinkage21 ba08 income age primary secondary year
	 
     *** Fixed effect model 
	 xtreg fatalityrate sb_useage vmt speed65 speed70 drinkage21 ba08 income age primary secondary year, fe
	 xtreg fatalityrate sb_useage year, fe
	 estimate store fixed

	 *** Random model 
	 xtreg fatalityrate sb_useage vmt speed65 speed70 drinkage21 ba08 income age primary secondary year, re
	 xtreg fatalityrate sb_useage year, re
	 estimate store random
			
	 *** T-test 
	 /*
	  * A t-test is a type of inferential statistic used to determine if there 
	  * is a significant difference between the means of two groups, which may 
	  * be related in certain features. It is a method of testing hypotheses 
	  * about the mean of a small sample drawn from a normally distributed 
	  * population, when the population standard deviation is unknown. 
	  * In particular, it is usually used to determine whether the mean of 
	  * a dependent variable is statistically equivalent or not to the mean 
	  * of another dependent variable or to a certain value.
	  */
	  
	 *** R Square 
	 /*
	  * R-squared is a statistical measure that represents the proportion of 
	  * the variance for a dependent variable that's explained by an independent
	  * variable. R-squared values range from 0 to 1. If it is close to 0, it 
	  * means that there is no correlation between the dependent variable 
	  * and the independent variable, instead if it is close to 1 it indicates 
	  * a strong correlation. R-squared gives an estimate of the relationship 
	  * between movements of a dependent variable based on an independent 
	  * variable movements. However it doesn't tell if the model we have 
	  * chosen is good or bad or will it tell us whether the data and 
	  * predictions are distorted. A high or low R-square isn't necessarily 
	  * good or bad, as it doesn't convey the reliability of the model. 
	  * A better estimate taking into account degrees of freedom is the 
	  * adjusted R-squared which increases if the t-statistic of a newly added r
	  * egressor is greater than one in absolute value.
	  */
	  
	 *** Multicollinearity 
	 /*
	  * Collinearity means that two variables are near perfect linear 
	  * combinations of another one and, when more than two variables are 
	  * involved, it is often called multicollinearity. In order to see if 
	  * there was multicollinearity between the variables, we used the command 
	  * vif (variance inflation factor) only for the significant independent 
	  * variables. We also used the tolerance, defined as 1/vif  to check on 
	  * the degree of collinearity: a 1/vif value lower than 0.1 implies that 
	  * the variable could be considered as a linear combination of other 
	  * independent variables.
	  */
	  reg fatalityrate sb_useage vmt speed65 speed70 drinkage21 ba08 income age primary secondary year
	  vif
	  
	 *** Hausman test 
	 /*
	  * In panel data analysis, the Hausman test can help us to choose between 
	  * fixed effects model or a random effects model. The null hypothesis is 
	  * that the preferred model is random effects; The alternate hypothesis 
	  * is that the model is fixed effects. Essentially, the tests looks to 
	  * see if there is a correlation between the unique errors and the 
	  * regressors in the model. The null hypothesis is that there is no 
	  * correlation between the two. Interpreting the result from a Hausman 
	  * test is fairly straightforward: if the p-value is small 
	  * (less than 0.05), reject the null hypothesis.
	  */
	  xtreg fatalityrate sb_useage year, fe
	  estimate store fixed

	  xtreg fatalityrate sb_useage year, re
	  estimate store random
	  
      hausman fixed random

	  
	 *** Breusch Pagan Test
	 /*
	  * The Breusch-Pagan-Godfrey Test is a test for heteroskedasticity of 
	  * errors in  a linear regression model. Heteroscedasticity means 
	  * “differently scattered”; this is opposite to homoscedastic, which 
	  * means “same scatter.” Homoskedasticity in regression is an important 
	  * assumption and if it is violated, we can't use a regression analysis. 
	  * Hence, this test is used in order to understand if the variance of 
	  * the errors from a regression is dependent on the values of the 
	  * independent variables. So, in this case there is heteroskedasticity.
	  */
	  reg fatalityrate sb_useage vmt speed65 speed70 drinkage21 ba08 income age primary secondary year
	  estat hettest, iid rhs
	  
	  *** White Test
	 /*
	  * After evaluating the Breusch-Pagan Test result, the White test was 
	  * implemented: an extremely common test for heteroskedasticity which 
	  * begins by allowing the heteroskedasticity process to be a function 
	  * of one or more of your independent variables. It’s similar to the 
	  * Breusch-Pagan test, but the White test allows the independent 
	  * variable to have a nonlinear and interactive effect on the error variance.
	  * Note: don't do this if you already have determined heteroskedasticity with 
	  * the Breusch Pagan Test.
	  */
	  estat imtest, white

/*
 * 4. RESTULS
 * In this part of the project we will discuss the different types of regression
 * models, tests and commands done. 
 */
 
    /*
	 * 4.0 INTRO TO OUR STUDY
	 * At the beginning we start running a simpole OLS regression.
	 */
		*** 1. Running a OLS regression 
	    reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 income age fips year
		reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 income age
		reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 income age i.fips i.year
		//genearte a logincome varible
		gen logincome = ln(income)
		//regress with the logincome
		reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.fips i.year
		estimate store ols
		
		*** 2. Running a FIxed Effect Regression (you can run also a generic xtreg regression withour ,fe at the end) & storing its values
	    xtreg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.fips i.year //--> general regression for panel data
		xtreg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.fips i.year, fe
	    estimates store fixed
		
		*** 3. Running a Random Effect Regression (you can run also a generic xtreg regression withour ,re at the end) & storing its values
	    xtreg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.fips i.year, re
	    estimates store random
		
		*** 4. Comparison between the fixed and the random model
	    estimates table fixed random ols, star stats(N r2 r2_a)
		
		*** 5. Hausman test in ordere to 
	    hausman fixed random
		
		*** 6. Heteroskedasticity
		reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.year i.fips
		estat hettest, iid rhs /* ---> reject homoskedasticity because = 0.0000*/
	
		
    /*
	 * 4.1 OLS MODEL 1st QUESTION
	 * Question: Does the usage of seat belts reduce the fatality rate?
	 */
	 
		*** 1. Transfor income to logincome and do a regression
		reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age, robust
		
		*** 2. Estimate robust standard error --> in short we are looking for each US State (this can be done aso without the cluster(fips))
		reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.fips, robust
		*** or 
		reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.fips, cluster(fips)
		*** if we don't need an estimated value for each alfa
		areg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age, cluster(fips) absorb(fips)
		*** 3. States with more dangerous driving conditions (and a higher fatality rate) also have more people wearing seat belts. Thus (1) suffers from omitted variable bias. --> this not make any sense
		reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.fips i.year, cluster(fips)
		*** or
		areg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.year, cluster(fips) absorb(fips)
		
		
		*** 4. vif test
		reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.year, cluster(fips)
		vif
		
		*** 5. Breusch-Pagan Test
		reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.year i.fips
		estat hettest, iid rhs

		
		*** 6. Testparm for years
		reg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.year i.fips, cluster(fips)
		testparm i.year /* TheProb>F is > 0.05,so we did not failed to reject the null that the coefficients for all years are jointly equal to zero, therefore time fixed- effects is needed.*/
		
		*** 7. Graph comparison fatalityrate sb_useage
		graph twoway (lfitci fatalityrate sb_useage) (scatter fatalityrate_mean_year sb_usage_mean_year)
			

    /*
	 * 4.2 2nd QUESTION
	 * Question: How the first and secondary enforcement influence the behaviours of the drivers like seat belts usage. 
	 */	 
	
		
		*** 1. Estimate Robust standard error
		reg sb_useage primary secondary speed65 speed70 ba08 drinkage logincome age i.year, cluster(fips) absorb(fips)
		
		*** 2. If we don't need to look at all the fips (in our case we don't care to check in each state)
		areg sb_useage primary secondary speed65 speed70 ba08 drinkage logincome age i.year, cluster(fips) absorb(fips)
		

		*** 3. vif test
		reg sb_useage primary secondary speed65 speed70 ba08 drinkage logincome age i.year, cluster(fips) absorb(fips)
		vif
		
		*** 4. Breusch-Pagan Test
		reg sb_useage primary secondary speed65 speed70 ba08 drinkage logincome age i.year i.fips
		estat hettest, iid rhs
		
		*** 5. White test
		estat imtest, white
		
		*** 6. Testparm for years
		reg sb_useage primary secondary speed65 speed70 ba08 drinkage logincome age i.year, cluster(fips)
		testparm i.year /* TheProb>F is > 0.05,so we did not failed to reject the null that the coefficients for all years are jointly equal to zero, therefore time fixed- effects is needed.*/

	
    /*
	 * 4.2 3rd QUESTION
	 * Question: How the alcohol street regulations influence the speed limit and the fatality rate?
	 */
	 
	 /* Note that in this case we would take a look to the regressions that we 
	  * did before (4.1), taking into account the variables ba08, speed65, speed70 and fatality rate 
	  * In short, we can answer to this question simply looking at the analysis did in the quesitons 2 and 3. 
	  */
	  
	  *** 1. Take this regression and proceed with the study
	  areg fatalityrate sb_useage speed65 speed70 ba08 drinkage21 logincome age i.year, cluster(fips) absorb(fips)
	 
/*
 * 5. CONCLUSIONS
 * In this part of the project we will discuss the conclusions
 */		
	 
    /*
	 * 5.1 Decrease of Fatalityrate
	 */	 
	 
	 *** 1. 
	 egen max_sb_useage=max(sb_useage)
	 egen min_sb_useage=min(sb_useage)
	 gen delta_1984_1997_sbuseage = max_sb_useage-min_sb_useage
	 egen mean_sb_useage=mean(sb_useage)
	 egen mean_vmt=mean(vmt)
	 display max_sb_useage
	 display min_sb_useage
	 display mean_sb_useage
	 display mean_vmt
	 
	 display .0037186*(delta_1984_1997_sbuseage)
	 display .00301207*mean_vmt //average fatalities prevented 
	 
	 /* Note: 
	  * you can do this also by state with the difference of two or more years
	  * in order to get the value you need, or you want to show. 
	  */
	 
	 *** 2. 
	 su primary secondary
	 egen mean_primary = mean(primary)
	 egen mean_secondary = mean(secondary)
	 display .2055968*mean_primary + .1085184*mean_secondary
	 
	 
	 *** example CA 1997 has only secondary enforcement
	 display  .0037186 * .1085184 
	 su year vmt if state == "CA"
	 display 245259.1 * .00040354
	 
	 /* Note: 
	  * In our point of view, taking the year and the specific state you want
	  * to analyze will give you more accurate data, based on you specific needs.
	  */
	 
	 *** 3. 
	 su speed70 speed65
	 egen mean_70 = mean(speed70)
	 egen mean_65 = mean(speed65)
	 display  .0007833*mean_65+ .0008042*mean_70
	 
	 
	 *** example CA 1997 has both speed limits
	 display  .0037186 * (.0007833 + -.0008042) // = -7.772e-08
	 su year vmt if state == "CA"  // = 245259.1
	 display 245259.1 * -7.772e-08 // life prevented with the speed limits per 245259.1 miles
	 
	  /* Note: 
	  * In our point of view, taking the year and the specific state you want
	  * to analyze will give you more accurate data, based on you specific needs.
	  */
	  
	  
***
***
/*
 * Thank you for following our analysis!
 * Dataset: Seatbelt
 * Group: 17
 * Abhijith Babu Raj: 1076068
 * Ettore Falde: 1076181
 * Simona Lorenzi: 1046338
 */


/*
.O°o. .o°O________________________________O°o. .o°O.
.°o.O.o° ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯.°o.O.o°
		   ░░░░░╔══╦╗░░░░╔╗░░░░░░╔╗╔╗░░░░░░░░
		   ░░░░░╚╗╔╣╚╦═╦═╣║╔╗░░░░║║║╠═╦╦╗░░░░
		   ░░░░░░║║║║╠╝║║║╠╝║░░░░║╚╝║║║║║░░░░
		   ░░░░░░║║║║║║║║║╔╗╣░░░░╚╗╔╣║║║║░░░░
		   ░░░░░░╚╝╚╩╩═╩╩╩╝╚╝░░░░░╚╝╚═╩═╝░░░░
.O°o. .o°O________________________________O°o. .o°O.
.°o.O.o° ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯.°o.O.o°..

*/

	 
