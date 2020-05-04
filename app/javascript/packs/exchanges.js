document.addEventListener('turbolinks:load', () =>document.getElementById('exchange_form').addEventListener('ajax:success', exchangeFormAjaxSuccess))

exchangeFormAjaxSuccess = (event) =>{
    let [result] = event.detail;
    document.getElementById('result').value = result.value
}


document.addEventListener('turbolinks:load', () => document.getElementById('reverse_button').addEventListener('click', reverse_button_click))

reverse_button_click = (event) =>{
    event.preventDefault()
    let source = document.getElementById('source_currency').value;
    document.getElementById('source_currency').value = document.getElementById('target_currency').value
    document.getElementById('target_currency').value = source
    document.getElementById('result').value = ''
}