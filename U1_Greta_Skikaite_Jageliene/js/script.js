function validateForm() {
    let x = document.forms["subscribe"]["vardas"].value;
    let y = document.forms["subscribe"]["pastas"].value;
    if (x == "") || (y == "") {
        alert("Būtina užpildyti visus laukus!");
        return false;
    }
}
