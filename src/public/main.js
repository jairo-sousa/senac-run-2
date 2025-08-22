console.log("++ SENAC ++");

const sendDataRequest = async (route, method, body) => {
  const response = await fetch(route, {
    method,
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    credentials: "include",
    body: new URLSearchParams(body),
  });

  return response;
};
