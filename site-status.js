/*
 * Site availability switch
 *
 * Set `maintenanceMode` to true and deploy to show the maintenance page across
 * the public pages. Leave it false for the live foundation site.
 *
 * This is deliberately a plain, version-controlled feature flag: no provider,
 * credentials, or dashboard change is required during an urgent update.
 */
(() => {
  const maintenanceMode = false;

  if (maintenanceMode && window.location.pathname !== "/maintenance.html") {
    window.location.replace("/maintenance.html");
  }
})();
