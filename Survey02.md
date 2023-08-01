---
title: 'Survey02'
layout: surveys
---

## input
<input type="text" id="documentId" placeholder="Enter Document ID">
<button onclick="triggerLambda()">Send Hello World to Lambda</button>

## haha
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