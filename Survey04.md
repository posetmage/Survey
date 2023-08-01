---
title: 'Survey04'
layout: page
---

<div id="surveys">

<div class="checkbox">
## What are ....
* A
* B
* C
</div>

<div class="choice">
## Which one you think
* X
* Y
* Z
</div>

<div class="text">
## How do you see....
</div>

</div>

<div id="surveyResult"></div>

<script src="https://unpkg.com/survey-jquery"></script>
<link href="https://unpkg.com/survey-jquery/survey.css" type="text/css" rel="stylesheet" />

<script>
    var surveysDiv = document.getElementById('surveys');
    var surveyJson = parseHtmlToSurveyJson(surveysDiv);
    var survey = new Survey.Model(surveyJson);

    survey.onComplete.add(function(result) {
        document.querySelector('#surveyResult').innerHTML = "result: " + JSON.stringify(result.data, null, 2);
    });

    $("#surveys").Survey({model:survey});

    function parseHtmlToSurveyJson(element) {
        var json = { questions: [] };

        var sections = Array.from(element.children);
        sections.forEach(section => {
            if (section.className === 'checkbox') {
                json.questions.push(parseCheckboxSection(section));
            } else if (section.className === 'choice') {
                json.questions.push(parseChoiceSection(section));
            } else if (section.className === 'text') {
                json.questions.push(parseTextSection(section));
            }
        });

        return json;
    }

    function parseCheckboxSection(section) {
        var options = Array.from(section.querySelectorAll('li')).map(li => li.textContent);
        return {
            type: "checkbox",
            name: section.querySelector('h2').textContent,
            choices: options
        };
    }

    function parseChoiceSection(section) {
        var options = Array.from(section.querySelectorAll('li')).map(li => li.textContent);
        return {
            type: "radiogroup",
            name: section.querySelector('h2').textContent,
            choices: options
        };
    }

    function parseTextSection(section) {
        return {
            type: "comment",
            name: section.querySelector('h2').textContent
        };
    }
</script>
