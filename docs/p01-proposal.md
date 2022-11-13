# How a Developed National Energy Grid Impacts the Quality of Life: Project Report

**Code Name: World Peace**

-   Autumn 2022

-   Authors: Sanjana Somayajula, Oswaldo Jimenez, Ian Chiu

-   Date: 11/12/22

-   Affiliation: INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

### Abstract

Our main question is: How can a developed national energy grid impact the quality of living of its citizens? This question is important since energy production and consumption have become one of the most significant geopolitical factors influencing a nation's welfare. As we have seen in Ethiopia, for example, the construction of a large dam has allowed the nation to develop at a higher, more efficient pace, raise the quality of life, and export energy at a profit to neighboring countries. To address this question, we will analyze various overlapping data sets and come to a conclusion (s) from those data points.

**Key Words:** Energy, Quality of Life, Energy production, Consumption

### Introduction

Green energies are put forward as the future of all energy; along with this, we are seeing a modern revival of economic colonialism on behalf of the world's new and old superpowers (China, USA, Russia, EU\*, etc.). Energy as a source of power has also brought about curiosity on behalf of less developed nations to gladly take upon foreign investments in exchange for energetic supremacy (Ethiopia, Rwanda, Morocco, etc.). There is then a contrast between western superpowers who aim to export their green energies, eastern superpowers who aim to export their more efficient energies, and the developing countries who just want cheap power. This brings us to our questions; Which form of energy promises the most grid efficiency? Which form of energy consistently delivers improvements in HDI? And what can nations learn from our findings?

### Problem Domain

Our Domain consists of each of the following sections: *Project Framing, Human Values, Stakeholders, Harms and Benefits, Citations and Examples, and Constraints*.

**Project Framing:** The frame of our project consists of the steps or general goals at each time limit.

**Human Values:** At the very core of our system is the value of love and peace for humankind. We value the grass being green, and we value the air being breathable and not contaminated by pollutant endocrine disruptors and other toxic chemicals. We value acceptance no matter how bad they might seem at; first, we value having an open heart. But most importantly, we value love.

**Direct and Indirect Stakeholders:** The stakeholders of such a global project include virtually everyone in a country with energy. But to say this would be too large, this really affects one group more than any other; Policy Makers. These are the people we will call who call the shots, the bosses of the world. Then there are indirect stakeholders, and that would be the rest of us.

**Harms and Benefits:** One of the harms of such a project is that it could be used against countries and encourage foreign armies to invade, leading to new international conflicts devastating the lives of millions. This is what happened to Ukraine; they make prescriptive statements which then are used to defend offensive actions. Hopefully, though the benefits will outweigh the negatives, we will pervade through the heart of these angry (probably evil) generals and policymakers and make them realize that at the core of all our hearts is well intent and peace. One of the harms we might also pose is that we can ignore individuals since our project is so large scale, which also might mean we might not be able to calculate everything, and there might also be estimations within our data sets.

**Citations and Examples:** \* "The project begins from the premise that energy has long shaped the international system, determining great powers, alliances, and outcomes of wars. Coal-rich countries were the first to industrialize in the 1800s; the shift to oil from coal over the next century brought with it a rise in the strategic importance of the Middle East. Similarly, decisions made about energy today will influence what the world looks like tomorrow, just as the political and security events of today -- be it the Arab Spring or the devastating earthquake and tsunami in Japan -- will shape energy realities." --\> [*Harvard School of International Affairs*](https://www.belfercenter.org/project/geopolitics-energy-project)

-   "Europe is in the throes of a full-fledged energy crisis, with staggering electricity prices forcing businesses across the continent to shutter and energy firms to declare bankruptcy, positioning Russian President Vladimir Putin to take advantage of his neighbors' struggles by leveraging his country's natural gas reserves. In September, blackouts reportedly led Chinese Vice Premier Han Zheng to instruct his country's state-owned energy companies to secure supplies for winter at any cost." --\> [*Foreign Affairs*](https://www.foreignaffairs.com/articles/world/2021-11-30/geopolitics-energy-green-upheaval?check_logged_in=1&utm_medium=promo_email&utm_source=lo_flows&utm_campaign=registered_user_welcome&utm_term=email_1&utm_content=20221024)

-   "One of the things my platform does is focus on the emerging frontier market and keep an eye on what is happening in Africa. One of the fundamental things that we talk about that Americans need to understand is that it is not a place to exploit resources; but a partner to form relationships to help bring a global population's living standards up. We have energy poverty that impacts Africans engaging with the continent. Africans start to take a front seat driving role in how they not only create a narrative, but start to develop both continental and regional, nation-based policies on how to properly exploit their resources," --\> [*Energy Capital & Power*](https://energycapitalpower.com/geopolitics-of-energy-in-africa/))

**Constraints:** Obviously, the collection of data on what we are trying to do is complicated. There are many data points that we must collect across nations with various styles and methodologies when it comes to collecting data. As understanding as we are of various global constraints on data collection, we decided to collect the common points of data, the stats that are recorded across the board, If we decide to exclude nations, we will do so with an explanation.

### Research Questions

1.  *How can a developed national energy grid impact the quality of living of its citizens?*

2.  *Which form of energy promises the most grid efficiency?*

3.  *Which form of energy consistently delivers improvements in HDI? And what can nations learn from our findings?*

### The Dataset

We have collected the following: 30 years' worth of data. This number is not random. On average, for a national grid to transform itself from one energy source to the other, it takes about 14 years. So why 30 years? Because it makes room for countries to switch from one energy source to another seamlessly with some room left over, meaning most or all changes to an energy system will be noticeable in the data. Now, here is what we chose to measure for all countries (one which didn't exists will simply not show up on the demonstration until data was available, ex, Fr Yugoslavia, South Sudan, east Timor, Serbia and Montenegro, Kosovo, etc.).

-   **HDI: Human Development Index**
-   **Energy Grid Composition**
-   **Economic Growth**
-   **Energy exports**
-   **Emissions**

**Our Data:**

| Name               | Num of Observations | Num of Variables | URL                                                                                                                                                                                                                        | Brief Description                                                                      |
|---------------|---------------|---------------|---------------|---------------|
| HDI                | 191                 | 8                | <https://hdr.undp.org/sites/default/files/2021-22_HDR/HDR21-22_Statistical_Annex_HDI_Table.xlsx>                                                                                                                           | Addresses general development of each country                                          |
| Energy Grid        | 191                 | 32               | <https://ourworldindata.org/grapher/electricity-prod-source-stacked>                                                                                                                                                       | Breakdown of sources of energy - coal, oil, gas, nuclear, and renewables               |
| Economics          | 191                 | 33               | <https://api.worldbank.org/v2/en/indicator/NY.GDP.MKTP.KD.ZG?downloadformat=csv>                                                                                                                                           | GDP per country (Gross Domestic Product), organized per country per year starting 1990 |
| Energy Consumption | 191                 | 4                | <https://ourworldindata.org/explorers/energy?tab=table&facet=none&country=USA~GBR~CHN~OWID_WRL~IND~BRA~ZAF&hideControls=false&Total+or+Breakdown=Total&Energy+or+Electricity=Primary+energy&Metric=Per+capita+consumption> | Per capita energy consumption per country from 1990-2021                               |
| Energy Emissions   | 191                 | 6                | <https://api.worldbank.org/v2/en/indicator/EN.ATM.CO2E.PC?downloadformat=csv>                                                                                                                                              | Energy dependency, efficiency, and carbon dioxide emissions from 1990-2015             |

Our data was collected from a various amount of sources, amongst them: Human Development Reports, Our World In Data, and World Bank Group.

-   **Human Development Report:** Independent report commissioned by the United Nations Development Programme.
-   **Our World In Data:** Published by a group of researchers based in multiple universities including Oxford University.
-   **World Bank Group:** Non profit dedicated to presenting information and reducing proverty.

**Expected Implications and Limitations:** The benefactors of the data we collected more than often are the researchers themselves, who consist mostly of students committing to internships. Evidently, once all the data points have been collected, they will be cited. Along with the sources we cited earlier, others will likely be added. Limitations include data about certain countries being unavailable. We are also working with such large data sets that some factors such as democratic index will be excluded, which could affect the calculated data.

### References:

-   <https://www.belfercenter.org/project/geopolitics-energy-project>

-   <https://www.foreignaffairs.com/articles/world/2021-11-30/geopolitics-energy-green-upheaval?check_logged_in=1&utm_medium=promo_email&utm_source=lo_flows&utm_campaign=registered_user_welcome&utm_term=email_1&utm_content=20221024>

-   <https://energycapitalpower.com/geopolitics-of-energy-in-africa/>

-   <https://hdr.undp.org/sites/default/files/2021-22_HDR/HDR21-22_Statistical_Annex_HDI_Table.xlsx>

-   <https://ourworldindata.org/grapher/electricity-prod-source-stacked>

-   <https://api.worldbank.org/v2/en/indicator/NY.GDP.MKTP.KD.ZG?downloadformat=csv>

-   <https://api.worldbank.org/v2/en/indicator/EN.ATM.CO2E.PC?downloadformat=csv>

-   <https://ourworldindata.org/explorers/energy?tab=table&facet=none&country=USA~GBR~CHN~OWID_WRL~IND~BRA~ZAF&hideControls=false&Total+or+Breakdown=Total&Energy+or+Electricity=Primary+energy&Metric=Per+capita+consumption>
