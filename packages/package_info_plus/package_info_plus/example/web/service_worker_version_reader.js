(() => {
  if (!("serviceWorker" in navigator)) return;
  navigator.serviceWorker.ready.then((registration) => {
    const scriptURL = registration.active.scriptURL;
    const url = new URL(scriptURL);
    const version = url.searchParams.get("v");
    if (!version) return; // No version found
    window.serviceWorkerVersion = version;
    console.log("Flutter service worker version:", window.serviceWorkerVersion);
  });
})();
