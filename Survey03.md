---
title: 'Survey03'
layout: surveys
---

<div class="checkbox">
  <h2>What are ....</h2>
  <ul>
    <li>A</li>
    <li>B</li>
    <li>C</li>
  </ul>
</div>

<div class="choice">
  <h2>Which one you think</h2>
  <ul>
    <li>X</li>
    <li>Y</li>
    <li>Z</li>
  </ul>
</div>

<div class="text">
  <h2>How do you see....</h2>
</div>

<div id="sendJsonTo">18zRYh2kOGQ0TUhK9br8qS5rVJMGSHZbSm-aby-l_k-o</div>

## send to 

<input type="text" id="documentId" placeholder="Enter Document ID">
<button onclick="triggerLambda()">Send Hello World to Lambda</button>


<script>
    function triggerLambda() {
        const url = 'https://v2uh2lpxh3.execute-api.ap-southeast-2.amazonaws.com/default/SendSurvey';
        const documentIdInput = document.getElementById("documentId");
        const data = { 
            text: 'Hello World from html',
            document_id: documentIdInput.value,
        };

        fetch(url, {
            method: 'POST', 
            body: JSON.stringify(data), 
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
          .then(data => console.log(data))
          .catch((error) => {
            console.error('Error:', error);
        });
    }
    </script>