# Regex Practice

In ruby the `.scan()` method is used to find regular expression matches in a string, similar to `.match`, but the result is an array of all of the matches:

```rb
"hello jello".scan /ello/
# => ["ello", "ello"]
```

In this example, the letters `ello` existed twice in the string, the `.scan` method returned an array with both of those matches.

Use the `.scan` method to get an array of the following types of data out of their respective strings:

**Zip Codes**

Get a list of zip codes out of the following text. The result should be an Array of valid zip codes.

```rb
"In the Long Island ZIP code 11962, better known as Sagaponack, N.Y., the most expensive property currently for sale is listed at $30 million. That’s for a partially developed 3.8-acre lot of prime beachfront land with a six-bedroom house, a quaint cottage and “room for tennis and pool,” according to the Corcoran Group listing. The property also comes with billionaire neighbors like industrialist Ira Rennert, whose massive Fair Field estate is assessed at $200 million, and hedge fund boss David Tepper, who recently tore down his $43.5 million house to build a bigger one.

The thick concentration of some of America’s richest people helped make the swanky Hamptons village  the third most expensive ZIP code in the country for home sales this year, with a median asking price of $3,595,000.  It comes in behind two zip codes that regularly grace the top spots of our list: Alpine, N.J., 07620, at No. 1, and Atherton, Calif., 94027, at No. 2.

Alpine is an exclusive New York City suburb where the median home price is $4,295,000, street addresses are regularly scrambled on Google and the residents include celebrities like Stevie Wonder and Sean “P. Diddy” Combs.  In Atherton, a tony town in the San Francisco Bay area, $ 4,295,000 is the median home price thanks to tech billionaires like Eric Schmidt and Meg Whitman.

We compiled our list with the help of Altos Research, a Mountainview, Calif.-based company that tracks housing data in real time. It pulled pricing information for more than 20,000 ZIP codes across the U.S. for June 2 to Sept. 2, zeroing in on the 500 most expensive. Altos calculated the median asking price for both single-family homes and condominiums, weighting the price based on the mix of local property types.  We did not include co-ops. Altos limited the search to ZIP codes where 20 or more residences were listed for sale, including short sales and bank-owned foreclosures on the market.  To smooth out any wrinkles caused by a week’s unusual activity (like, say, an expensive home coming to market in an area where luxury properties are rare), Altos used a rolling average for the 90-day period."
```


**Phone numbers**

The result should be an Array of valid phone numbers.

```rb
"N	111	Archives I	OFFICE OF THE ARCHIVIST OF THE UNITED STATES	202-357-5900	David S Ferriero
4200	Archives II	    Archives II Office	301-837-1600
111	Archives I	    Chief of Staff	202-357-7458	Maria Carosa Stanwich
ND	4200	Archives II	DEPUTY ARCHIVIST OF THE UNITED STATES	202-357-5900	Debra Steidel Wall
Archives I	    Archives I Office	202-357-5900
NCON	101	Archives I	CONGRESSIONAL AFFAIRS STAFF	202-357-5100	John Owen Hamilton
NEEO	3310	Archives II	EQUAL EMPLOYMENT OPPORTUNITY OFFICE	301-837-0939	Ismael Martinez
NGC	3110	Archives II	GENERAL COUNSEL	301-837-1750	GaryM M Stern
3110	Archives II	    Senior Counsel	301-837-2928	Chris M Runkel
3110	Archives II	    Director of Litigation	301-837-3026	GaryM M Stern
NHPRC	114	Archives I	NATIONAL HISTORICAL PUBLICATIONS AND RECORDS COMMISSION	202-357-5263	Kathleen M Williams
OIG	1300	Archives II	OFFICE OF THE INSPECTOR GENERAL	301-837-3018	James E Springs
1300	Archives II	    Audits	301-837-3018	James E Springs
1300	Archives II	    Investigations	301-837-2941	James E Springs
1300	Archives II	    Counsel	301-837-1966	John M Simms
S	106A	Archives I	OFFICE OF STRATEGY AND COMMUNICATIONS	202-357-7464	Donna M Garland
S-A	107	Archives I	    Planning and Support	202-357-7467	Katherine B Balanza
SC	G-1	Archives I	    Communications and Marketing Division	202-357-5300
SP	4100	Archives II	    Strategy Division	301-837-3023
SR	106A	Archives I	    Partnerships Division	202-357-7464	Donna M Garland
C	4200	Archives II	CHIEF OPERATING OFFICER	301-837-0643	William J Bosanko
CA	4100	Archives II	    Accountability Staff	301-837-1490	Susan M Ashtianie
CM	2510	Archives II	    Corporate Records Management Staff	301-837-0880	Tasha M Thian
CML	2510	Archives II	        Records Management Laboratory	301-837-0880	Vacant
CMO	2510	Archives II	        Records Management Operations Team	301-837-1942	Richard W Marcus"
```

**Money**

Find any reference to money, be sure to include the `$` as well as any `,` or `.` characters.
```rb
"In the Long Island ZIP code 11962, better known as Sagaponack, N.Y., the most expensive property currently for sale is listed at $30 million. That’s for a partially developed 3.8-acre lot of prime beachfront land with a six-bedroom house, a quaint cottage and “room for tennis and pool,” according to the Corcoran Group listing. The property also comes with billionaire neighbors like industrialist Ira Rennert, whose massive Fair Field estate is assessed at $200 million, and hedge fund boss David Tepper, who recently tore down his $43.5 million house to build a bigger one.

The thick concentration of some of America’s richest people helped make the swanky Hamptons village  the third most expensive ZIP code in the country for home sales this year, with a median asking price of $3,595,000.  It comes in behind two zip codes that regularly grace the top spots of our list: Alpine, N.J., 07620, at No. 1, and Atherton, Calif., 94027, at No. 2.

Alpine is an exclusive New York City suburb where the median home price is $4,295,000, street addresses are regularly scrambled on Google and the residents include celebrities like Stevie Wonder and Sean “P. Diddy” Combs.  In Atherton, a tony town in the San Francisco Bay area, $ 4,295,000 is the median home price thanks to tech billionaires like Eric Schmidt and Meg Whitman.

We compiled our list with the help of Altos Research, a Mountainview, Calif.-based company that tracks housing data in real time. It pulled pricing information for more than 20,000 ZIP codes across the U.S. for June 2 to Sept. 2, zeroing in on the 500 most expensive. Altos calculated the median asking price for both single-family homes and condominiums, weighting the price based on the mix of local property types.  We did not include co-ops. Altos limited the search to ZIP codes where 20 or more residences were listed for sale, including short sales and bank-owned foreclosures on the market.  To smooth out any wrinkles caused by a week’s unusual activity (like, say, an expensive home coming to market in an area where luxury properties are rare), Altos used a rolling average for the 90-day period.
```

**Money extended**

Allow for dollar amounts written using words such as `$43.5 Million`.
