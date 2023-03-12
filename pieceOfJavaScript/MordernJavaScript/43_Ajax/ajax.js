const xhr = new XMLHttpRequest();

console.log("XMLHttpRequest Start, readyState:", xhr.readyState);

xhr.onreadystatechange = () => {
  console.log("onreadystatechange", {
    readyState: xhr.readyState,
    status: xhr.status,
    statusText: xhr.statusText,
  });
};

console.log(
  "XMLHttpRequest Set onreadystatechange, readyState:",
  xhr.readyState
);

xhr.onload = () => {
  console.log("onLoad", {
    readyState: xhr.readyState,
    status: xhr.status,
    statusText: xhr.statusText,
  });
};

console.log("XMLHttpRequest Set onload, readyState:", xhr.readyState);

xhr.open("GET", "/");

console.log("XMLHttpRequest Set open, readyState:", xhr.readyState);

xhr.setRequestHeader("Access-Control-Allow-Origin", "*");

console.log("XMLHttpRequest Set RequestHeader, readyState:", xhr.readyState);

xhr.send();

console.log("XMLHttpRequest Send, readyState:", xhr.readyState);
